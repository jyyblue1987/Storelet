<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title> <?= $module ?> </title>
    <link rel="stylesheet" href="<?= base_url('assets/css/bootstrap.min.css'); ?>">
    <link rel="stylesheet" href="<?= base_url('assets/css/storeLTE.css'); ?>">
</head>

<body>
    <div class="container">
        <h1 class="welcome text-center">Welcome to <br>StoreLte</h1>
        <div class="card card-container welcome text-center">
            <img class="profile-img" src="<?= base_url('assets/img/StoreLTE.png')?>" alt="aa" />
            <h2 class='login_title text-center'>Login to your account</h2>


            <form class="form-signin" id="login-form" method="POST" method="post" action="#" role="login" onsubmit="return false;">
                <span id="reauth-email" class="reauth-email"></span>
                <p class="input_title">Username</p>
                <input type="text" name="username" id="username" class="login_box" placeholder="user@gmail.com" required autofocus>
                <p class="input_title">Password</p>
                <input type="password" name="password" id="password" class="login_box" placeholder="**********" required>
                <div class="alert alert-danger text-center" style="display:none;" id="error">
                    <strong>Error!</strong> Invalid Username or Password.
                </div>
                <button class="btn btn-lg btn-success" type="submit">Login</button>
            </form>
        </div>
    </div>
    <script src="<?=base_url('assets/js/jQuery-2.1.4.min.js');?>"></script>
    <script src="<?=base_url('assets/js/bootstrap.min.js');?>"></script>
    <script src="<?=base_url('assets/js/login/login.js');?>"></script>
</body>
</html>