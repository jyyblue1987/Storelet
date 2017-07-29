$(function (event) {
    var URL_GET_VIEW_SEARCH_PRODUCT = BASE_URL + 'sale/sales/getViewSearch';
    var URL_GET_DATATABLE = BASE_URL + 'sale/sales/datatable';
    var URL_SEARCH_PRODUCT = BASE_URL + 'sale/sales/search_product';
    var URL_ADD_CART = BASE_URL + 'sale/sales/add_cart';
    var URL_GET_CART = BASE_URL + 'sale/sales/show_cart';
    var URL_SELL_CART = BASE_URL + 'sale/sales/concretar_venta';
    var URL_GET_PAYMANET = BASE_URL + 'sale/sales/payment';

    $('#btn-search').click(function (e) {
        e.preventDefault();
        BootstrapDialog.show({
            title: 'Search Product',
            message: function (dialog) {
                var $message = $('<div></div>');
                var pageToLoad = dialog.getData('pageToLoad');
                $message.load(pageToLoad);
                return $message;
            },
            data: {
                pageToLoad: URL_GET_VIEW_SEARCH_PRODUCT
            },
            onshown: function (dialog) {
                $('#example').DataTable({
                    lengthChange: false,
                    responsive: true,
                    ajax: {
                        url: URL_GET_DATATABLE,
                        type: 'POST',
                    },
                    columnDefs: [{
                        targets: 4,
                        data: null,
                        defaultContent: "<a href='#' class='add_product'><span class='glyphicon glyphicon-plus'></span></a>"
                    }]
                });
                $('.dataTable').on('click', 'tbody tr td a.add_product', function (e) {
                    e.preventDefault();
                    var columnas = $(this).parent().parent().children();
                    var id = columnas[0].innerHTML;
                    var name = columnas[1].innerHTML;
                    var qty = 1;
                    var price = columnas[3].innerHTML;
                    add_cart(id, name, qty, price, 1);
                    columnas[2].innerHTML = (columnas[2].innerHTML - 1) < 0 ? 0 : (columnas[2].innerHTML - 1);
                });

            }
        });
    });
    $('#search').typeahead({
        source: function (query, process) {
            $.ajax({
                url: URL_SEARCH_PRODUCT,
                type: 'POST',
                data: {
                    query: query
                },
                dataType: 'json',
                async: true,
                success: function (data) {
                    process(data);
                    data.forEach(function (item) {
                        var options = $("ul.typeahead li");
                        options.each(function (indice, option) {
                            if ($(option).find("a").text() === item.name) {
                                $(option).find("a").attr("data-id", item.id);
                                $(option).find("a").attr("data-name", item.name);
                                $(option).find("a").attr("data-qty", item.qty);
                                $(option).find("a").attr("data-price", item.price);
                            }
                        });
                    });
                }
            });
        },
        afterSelect: function (item) {
            $("#search").attr("disabled", "disabled");
            var actual = $("ul.typeahead li.active a");
            var actual_id = $(actual).data("id");
            var actual_name = $(actual).data("name");
            var actual_qty = 1;
            var actual_price = $(actual).data("price");
            add_cart(actual_id, actual_name, actual_qty, actual_price, 1);
            $("#search").removeAttr("disabled");
        }
    });
    $.ajax({
        url: URL_GET_CART,
        method: 'POST',
        dataType: 'json',
        success: function (data) {
            setCartHtml(data);
        }
    });
    $("#checkout").click(function (e) {
        e.preventDefault();
        $("#checkout_pay").validate();
        BootstrapDialog.show({
            title: '',
            message: function (dialog) {
                var $message = $('<div></div>');
                var pageToLoad = dialog.getData('pageToLoad');
                $message.load(pageToLoad);
                return $message;
            },
            data: {
                pageToLoad: URL_GET_PAYMANET
            },
            cssClass: 'payment-dialog',
            buttons: [{
                label: 'Pay',
                cssClass: 'btn-primary',
                action: function (dialog) {
                    if ($("#checkout_pay").valid()) {
                        BootstrapDialog.confirm({
                            title: '',
                            message: 'Deseas completar la orden?',
                            type: BootstrapDialog.TYPE_WARNING,
                            closable: false,
                            btnCancelLabel: 'no',
                            btnOKLabel: 'yes',
                            btnOKClass: 'btn-warning',
                            callback: function (result) {
                                if (result) {
                                    var total = $("#amount_tendered").val();
                                    var cantidad_pagada = $("#cantidad_pagada").val();
                                    if (Number(cantidad_pagada) >= Number(total)) {
                                        var datos_formulario = new FormData();
                                        datos_formulario.append("total", total);
                                        datos_formulario.append("cantidad_pagada", cantidad_pagada);
                                        $.ajax({
                                            url: URL_SELL_CART,
                                            method: 'POST',
                                            data: datos_formulario,
                                            processData: false,
                                            contentType: false,
                                            success: function (data) {
                                                if (data.success == 'The sale was successfully made') {
                                                    $.ajax({
                                                        url: URL_GET_CART,
                                                        method: 'POST',
                                                        dataType: 'json',
                                                        success: function (data) {
                                                            setCartHtml(data);
                                                        }
                                                    });
                                                    BootstrapDialog.show({
                                                        type: BootstrapDialog.TYPE_SUCCESS,
                                                        message: 'Sale completed!, the change due is: ' + (Number(cantidad_pagada) - Number(total))
                                                    });
                                                } else {
                                                    BootstrapDialog.show({
                                                        type: BootstrapDialog.TYPE_DANGER,
                                                        message: 'please enter the money before accept'
                                                    });
                                                }
                                            }
                                        });
                                    } else {
                                        BootstrapDialog.show({
                                            type: BootstrapDialog.TYPE_DANGER,
                                            message: 'The payment must be equal or higher than the total'
                                        });
                                    }
                                    return false;
                                } else {}
                            }
                        });
                    }
                }
            }]
        });
    });

    function add_cart(id, name, qty, price, type_operation) {
        var datos = new FormData();
        datos.append("id", id);
        datos.append("name", name);
        datos.append("qty", qty);
        datos.append("price", price);
        datos.append("tipo_operacion", type_operation);
        $.ajax({
            url: URL_ADD_CART,
            data: datos,
            method: 'POST',
            processData: false,
            contentType: false,
            dataType: 'json',
            success: function (response) {
                if (response.status == 0) {
                    alert(response.error);
                }
                setCartHtml(response.product_data);
            }
        });
    }

    function setTotalHtml(total) {
        $("li.sub-total span.value").html('$' + total.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
        $(".amount-block .total.amount .total-amount, .amount-block .amount-due .amount").html('$' + total.toFixed(2).replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,"));
        $("#amount_tendered").val(total.toFixed(2));
        $("#total").html("Total: " + total.toFixed(2));
    }

    function setCartHtml(products) {
        $("#table_cart_contents tbody").html("");
        var table_html = "";
        if (products.length == 0) {
            $("#table_cart_contents tbody").html("<tr><td colspan='100%'>No hay productos en el carrito de compras, los elementos que  agregues por medio del buscador o de la tabla de productos aparecerá aquí</td></tr>");
            setTotalHtml(0);
            return;
        }
        var total = 0;
        products.forEach(function (producto, indice) {
            total += producto.price * producto.qty;
            table_html += "<tr>";
            setTotalHtml(total);
            table_html += "<td>" + (indice + 1) + "</td>";
            table_html += "<td>" + producto.name + "</td>";
            table_html += "<td>$" + producto.price + "</td>";
            table_html += "<td> <input type ='number' class='quantity_cart' min='0' data-id='" + producto.id + "' data-name='" + producto.name + "' data-price='" + producto.price + "' value='" + producto.qty + "' step='1' /></td>";
            table_html += "<td>$" + (producto.price * producto.qty) + "</td>";
            table_html += "<td><a href='#' class='remove-product-cart' data-id='" + producto.id + "' data-name='" + producto.name + "' data-price='" + producto.price + "' data-qty='" + producto.qty + "'><i class='fa fa-times'>" + "</i></a></td>"
            table_html += "</tr>";
        });
        $("#table_cart_contents tbody").html(table_html);
        $("input.quantity_cart").change(function (e) {
            var id = $(this).data("id");
            var name = $(this).data("name");
            var price = $(this).data("price");
            var qty = $(this).val();
            var type = 0;
            add_cart(id, name, qty, price, type);
        });
        $("a.remove-product-cart").click(function (e) {
            e.preventDefault();
            var id = $(this).data("id");
            var name = $(this).data("name");
            var price = $(this).data("price");
            var qty = 0;
            var type = 0;
            if (confirm("¿Deseas eliminar el producto del carrito?")) {
                add_cart(id, name, qty, price, type);
            }
        });
    }
});
