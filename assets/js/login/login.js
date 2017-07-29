$(function(event) {
    $('#login-form').submit(function() {
        var username = $('#username').val();
        var password = $('#password').val();
        URL_GET_ACCESS = BASE_URL + 'login/getAccess';
        $.ajax({
            url: URL_GET_ACCESS,
            type: 'POST',
            data: { username: username, password: password }
        }).done(function(data) {
            console.log(data);
            if (data.error === 'invalid username or password') {
                $('#error').show().delay(2000).fadeOut();
                $('#login-form')[0].reset();
                $('#username').focus();
            } else if (data === '1') {
                window.location.href = BASE_URL + 'home';
            } else {
                window.location.href = BASE_URL + 'home';
            }
        });
        return false;
    });

    $('#logout').on('click', function (event) {
        event.preventDefault();
        URL_GET_LOGGOUT = BASE_URL + 'login/logout';
        $.ajax({
            url: URL_GET_LOGGOUT,
            type: 'POST',
            success: function(event) {
                document.location = BASE_URL + 'login';
            }
        });
    });
});