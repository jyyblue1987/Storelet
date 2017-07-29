$(function() {
    URL_GET_DATATABLE = BASE_URL + 'purchase/provider/datatable';
    URL_GET_VIEW_PROVIDER = BASE_URL + 'purchase/provider/getViewProvider';
    URL_GET_ADD_PROVDER = BASE_URL + 'purchase/provider/addProvider';
    URL_GET_UPDATE_PROVIDER = BASE_URL + 'purchase/provider/updateProvider';
    var table = $('#example').DataTable({
        "lengthChange": false,
        responsive: true,
        dom: 'Blfrtip',
        buttons: [{
            extend: 'excelHtml5',
            exportOptions: {
                columns: [1, 2, 3, 4, 5, 6]
            }
        }, {
            extend: 'csvHtml5',
            exportOptions: {
                columns: [1, 2, 3, 4, 5, 6]
            }
        }, {
            extend: 'pdf',
            exportOptions: {
                columns: [1, 2, 3, 4, 5, 6]
            }
        }],
        ajax: {
            url: URL_GET_DATATABLE,
            type: 'POST',
        },
        columnDefs: [{
            targets: -1,
            data: null,
            defaultContent: "<a href='#'><span class='glyphicon glyphicon-pencil'></span></a>"

        }, {
            targets: 6,
            render: function(data) {
                return (data == 1) ? "<span class='label label-success'>active</span>" : "<span class='label label-danger'>inactive</span>";
            }
        }, {
            targets: 0,
            visible: false,
            render: function(data) {
                return '<input type="hidden" name="hash" id="hash" value="' + data + '" >';
            }
        }],
        fnRowCallback: function(data, nRow) {
            if (nRow[6] == 0) {
                $(data).css({
                    'background-color': '#f2dede'
                });
            } else if (nRow[6] == 1) {
                $(data).css({
                    'background-color': '#dff0d8'
                });
            } else {

            }
        }
    });


    $('#add_provider').on('click', function() {
        $("#provider").validate();
        BootstrapDialog.show({
            message: function(dialog) {
                var $message = $('<div></div>');
                var pageToLoad = dialog.getData('pageToLoad');
                $message.load(pageToLoad);

                return $message;
            },
            data: {
                'pageToLoad': URL_GET_VIEW_PROVIDER
            },
            closable: false,
            buttons: [{
                id: 'btn-ok',
                cssClass: 'btn-primary',
                icon: 'glyphicon glyphicon-send',
                label: ' Save',
                action: function(dialog) {
                    var first_name = $('#first_name').val();
                    var last_name = $('#last_name').val();
                    var email = $('#email').val();
                    var phone = $('#phone').val();
                    var address = $('#address').val();
                    if ($("#provider").valid()) {
                        $.ajax({
                            url: URL_GET_ADD_PROVDER,
                            type: 'POST',
                            data: {
                                first_name: first_name,
                                last_name: last_name,
                                email: email,
                                phone: phone,
                                address: address
                            }
                        }).done(function(data) {
                            if (data.first_name == 'The first_name field may only contain alphabetical characters.') {
                                BootstrapDialog.show({
                                    type: BootstrapDialog.TYPE_WARNING,
                                    message: 'The first_name field may only contain alphabetical characters.'
                                });
                            } else if (data.last_name == 'The last_name field may only contain alphabetical characters.') {
                                BootstrapDialog.show({
                                    type: BootstrapDialog.TYPE_WARNING,
                                    message: 'The last_name field may only contain alphabetical characters.'
                                });
                            } else if (data.email == 'The email field must contain a valid email address.') {
                                BootstrapDialog.show({
                                    type: BootstrapDialog.TYPE_WARNING,
                                    message: 'The email field must contain a valid email address.'
                                });
                            } else if (data.phone == 'Please enter a valid phone number') {
                                BootstrapDialog.show({
                                    type: BootstrapDialog.TYPE_WARNING,
                                    message: 'Please enter a valid phone number'
                                });
                            } else if (data.msg == 'The email is used by another provider') {
                                BootstrapDialog.show({
                                    type: BootstrapDialog.TYPE_WARNING,
                                    message: 'The email is used by another provider'
                                });
                            } else if (data.msg == 'successfully added') {
                                dialog.close();
                                swal("successfully added", "", "success");
                                table.ajax.reload();
                            } else {
                                BootstrapDialog.show({
                                    type: BootstrapDialog.TYPE_DANGER,
                                    message: 'It could not be added'
                                });
                            }
                        });
                    }
                }
            }, {
                id: 'btn-ok',
                cssClass: 'btn-danger',
                icon: 'glyphicon glyphicon-remove',
                label: ' Cancel',
                action: function(dialog) {
                    dialog.close();
                }
            }]
        });
    });

    $('#example tbody').on('click', 'a', function(event) {
        event.preventDefault();
        var data = table.row($(this).parents('tr')).data();
        hash = data[0];
        $("#provider").validate();
        BootstrapDialog.show({
            type: BootstrapDialog.TYPE_WARNING,
            message: function(dialog) {
                var $message = $('<div></div>');
                var pageToLoad = dialog.getData('pageToLoad');
                $message.load(pageToLoad);

                return $message;
            },
            data: {
                'pageToLoad': URL_GET_VIEW_PROVIDER
            },
            closable: false,
            buttons: [{
                id: 'btn-ok',
                cssClass: 'btn-primary',
                icon: 'glyphicon glyphicon-send',
                label: ' Save',
                action: function(e) {
                    var first_name = $('#first_name').val();
                    var last_name = $('#last_name').val();
                    var email = $('#email').val();
                    var phone = $('#phone').val();
                    var address = $('#address').val();
                    if ($("#provider").valid()) {
                        $.ajax({
                            url: URL_GET_UPDATE_PROVIDER,
                            type: 'POST',
                            data: {
                                hash: hash,
                                first_name: first_name,
                                last_name: last_name,
                                email: email,
                                phone: phone,
                                address: address
                            },
                            success: function(data) {
                                if (data.first_name == 'The first_name field may only contain alphabetical characters.') {
                                    BootstrapDialog.show({
                                        type: BootstrapDialog.TYPE_WARNING,
                                        message: 'The first_name field may only contain alphabetical characters.'
                                    });
                                } else if (data.last_name == 'The last_name field may only contain alphabetical characters.') {
                                    BootstrapDialog.show({
                                        type: BootstrapDialog.TYPE_WARNING,
                                        message: 'The last_name field may only contain alphabetical characters.'
                                    });
                                } else if (data.email == 'The email field must contain a valid email address.') {
                                    BootstrapDialog.show({
                                        type: BootstrapDialog.TYPE_WARNING,
                                        message: 'The email field must contain a valid email address.'
                                    });
                                } else if (data.phone == 'Please enter a valid phone number') {
                                    BootstrapDialog.show({
                                        type: BootstrapDialog.TYPE_WARNING,
                                        message: 'Please enter a valid phone number'
                                    });
                                } else if (data.msg == 'The email is used by another provider') {
                                    BootstrapDialog.show({
                                        type: BootstrapDialog.TYPE_WARNING,
                                        message: 'The email is used by another provider'
                                    });
                                } else if (data.msg == 'successfully updated') {
                                    e.close();
                                    swal("successfully updated", "", "success");
                                    table.ajax.reload();
                                } else {
                                    BootstrapDialog.show({
                                        type: BootstrapDialog.TYPE_DANGER,
                                        message: 'It could not be added'
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
                action: function(dialog) {
                    dialog.close();
                }
            }]
        });
    });
});