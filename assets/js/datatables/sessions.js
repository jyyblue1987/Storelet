$(function () {
	URL_GET_DATATABLE = BASE_URL + 'Profile/datatable';
	var table = $('#sessions').DataTable({
        "lengthChange": false,
        responsive: true,
        dom: 'Blfrtip',
        ajax: {
            url: URL_GET_DATATABLE,
            type: 'POST',
        },
    });
});