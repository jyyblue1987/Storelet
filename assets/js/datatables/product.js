$(function () {
    URL_GET_DATATABLE = BASE_URL + 'inventory/product/datatable';
    URL_GET_VIEW_PRODUCT = BASE_URL + 'inventory/product/getViewProduct';
    URL_GET_ADD_PRODUCT = BASE_URL + 'inventory/product/addProduct';
    URL_GET_UPDATE_PRODUCT = BASE_URL + 'inventory/product/updateProduct';
    URL_GET_VIEW_PRODUCT_UPDATE = BASE_URL + 'inventory/product/getViewProductUpdate';
    var table = $('#example').DataTable({
        "lengthChange": false,
        responsive: true,
        dom: 'Blfrtip',
        ajax: {
            url: URL_GET_DATATABLE,
            type: 'POST',
        },
        columnDefs: [{
                targets: -1,
                data: null,
                defaultContent: "<a href='#'><span class='glyphicon glyphicon-pencil'></span></a>"
            }, {
                targets: 7,
                render: function (data) {
                    return (data == 1) ? "<span class='label label-success'>active</span>" : "<span class='label label-danger'>inactive</span>";
                }
            }
            , {
                targets: 0,
                visible: false,
                render: function (data) {
                    return '<input type="text" name="hash" id="hash" value="' + data + '" />';
                }
            }
        ],
        fnRowCallback: function (data, nRow) {
            if (nRow[7] == 0) {
                $(data).css({
                    'background-color': '#f2dede'
                });
            } else if (nRow[7] == 1) {
                $(data).css({
                    'background-color': '#dff0d8'
                });
            } else {}
        }
    });
    $('#example tbody').on('click', 'a', function (event) {
        event.preventDefault();
        var data = table.row($(this).parents('tr')).data();
        hash = data[0];
        $("#product_update").validate();
        BootstrapDialog.show({
            type: BootstrapDialog.TYPE_WARNING,
            message: function (dialog) {
                var $message = $('<div></div>');
                var pageToLoad = dialog.getData('pageToLoad');
                $message.load(pageToLoad);
                return $message;
            },
            data: {
                'pageToLoad': URL_GET_VIEW_PRODUCT_UPDATE + '/' + hash
            },
            closable: false,
            buttons: [{
                id: 'btn-ok',
                cssClass: 'btn-primary',
                icon: 'glyphicon glyphicon-send',
                label: ' Save',
                action: function (e) {
                    var description = $('#description').val();
                    var description = $('#description').val();
                    var cost_price = $('#cost_price').val();
                    var selling_price = $('#selling_price').val();
                    var wprice = $('#wprice').val();
                    var min_stock = $('#min_stock').val();
                    var stock = $('#stock').val();
                    var max_stock = $('#max_stock').val();
                    var provider_id = $('#select_provider').val();
                    if ($("#product_update").valid()) {
                        $.ajax({
                            url: URL_GET_UPDATE_PRODUCT,
                            type: 'POST',
                            data: {
                                hash: hash,
                                provider_id: provider_id,
                                description: description,
                                cost_price: cost_price,
                                selling_price: selling_price,
                                wprice: wprice,
                                min_stock: min_stock,
                                stock: stock,
                                max_stock: max_stock
                            },
                            success: function (data) {
                                if (data.msg == 'successfully updated') {
                                    e.close();
                                    swal("successfully added", "", "success");
                                    table.ajax.reload();
                                } else if (data.min_stock == 'el stock no puede ser mayor al min') {
                                    BootstrapDialog.show({
                                        type: BootstrapDialog.TYPE_DANGER,
                                        message: 'el stock no puede ser mayor al min'
                                    });
                                }
                            }
                        });
                    }
                }
            }, {
                id: 'btn-cancel',
                cssClass: 'btn-danger',
                icon: 'glyphicon glyphicon-remove',
                label: ' Cancel',
                action: function (e) {
                    e.close();
                }
            }]
        });
    });
    $('#add').on('click', function () {
        $("#product").validate();
        BootstrapDialog.show({
            type: BootstrapDialog.TYPE_PRIMARY,
            message: function (dialog) {
                var $message = $('<div></div>');
                var pageToLoad = dialog.getData('pageToLoad');
                $message.load(pageToLoad);
                return $message;
            },
            data: {
                'pageToLoad': URL_GET_VIEW_PRODUCT
            },
            closable: false,
            buttons: [{
                id: 'btn-ok',
                cssClass: 'btn-primary',
                icon: 'glyphicon glyphicon-send',
                label: ' Save',
                action: function (e) {
                    var description = $('#description').val();
                    var cost_price = $('#cost_price').val();
                    var selling_price = $('#selling_price').val();
                    var wprice = $('#wprice').val();
                    var min_stock = $('#min_stock').val();
                    var stock = $('#stock').val();
                    var max_stock = $('#max_stock').val();
                    var provider_id = $('#select_provider').val();
                    if ($("#product").valid()) {
                        $.ajax({
                            url: URL_GET_ADD_PRODUCT,
                            type: 'POST',
                            data: {
                                provider_id: provider_id,
                                description: description,
                                cost_price: cost_price,
                                selling_price: selling_price,
                                wprice: wprice,
                                min_stock: min_stock,
                                stock: stock,
                                max_stock: max_stock
                            }
                        }).done(function (data) {
                            if (data.msg == 'successfully added') {
                                e.close();
                                swal("successfully added", "", "success");
                                table.ajax.reload();
                            } else if (data.max_stock == 'el stock no puede ser mayor al max') {
                                BootstrapDialog.show({
                                    type: BootstrapDialog.TYPE_DANGER,
                                    message: 'el stock no puede ser mayor al max'
                                });
                            }
                        });
                        return false;
                    }
                }
            }, {
                id: 'btn-cancel',
                cssClass: 'btn-danger',
                icon: 'glyphicon glyphicon-remove',
                label: ' Cancel',
                action: function (e) {
                    e.close();
                }
            }]
        });
    });
});
