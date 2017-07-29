$(function() {
	URL_GET_SEND_EMAIL = BASE_URL + '/site/home/sendMail';
	$('#contact-form').submit(function() {
		event.preventDefault();
		var name = $('#name').val();
		var email = $('#email').val();
		var subject = $('#subject').val();
		var message = $('#message').val();
		$.ajax({
			type: 'POST',
			url: URL_GET_SEND_EMAIL,
			data: {name: name, email: email, subject: subject, message: message},
			success: function (data) {
				console.log(data);
			}
		});
	});
});