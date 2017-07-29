<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>
        <?= $module ?>
    </title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="shortcut icon" href="<?=base_url('assets/img/favicon.ico');?>" type="image/x-icon">
    <link rel="icon" href="<?=base_url('assets/img/favicon.ico');?>" type="image/x-icon">
    <link rel="stylesheet" href="<?=base_url('assets/css/bootstrap.min.css'); ?>">
    <link rel="stylesheet" href="<?=base_url('assets/css/main.css');?>">
    <link rel="stylesheet" href="<?=base_url('assets/font-awesome/css/font-awesome.min.css');?>">
    <link rel="stylesheet" href="<?=base_url('assets/ionicons-2.0.1/css/ionicons.min.css');?>">
    <link rel="stylesheet" href="<?=base_url('assets/dist/css/AdminLTE.css');?>">
    <link rel="stylesheet" href="<?=base_url('assets/dist/css/skins/_all-skins.css');?>">
    <link rel="stylesheet" href="<?=base_url('assets/css/storeLTE.css').'?ver='.uniqid()?>">
    <script src="<?=base_url('assets/js/jQuery-2.1.4.min.js');?>"></script>
    <script src="<?=base_url('assets/js/bootstrap.min.js');?>"></script>
    <script src="<?=base_url('assets/dist/js/app.min.js');?>"></script>
    <script src="<?=base_url('node_modules/socket.io/node_modules/socket.io-client/dist/socket.io.js');?>"></script>
    <script>
        BASE_URL = "<?= base_url() ?>";
        document.addEventListener('DOMContentLoaded', function () {
            if (window.console || "console" in window) {
                console.log("%c WARNING!!!", "color:#FF8F1C; font-size:40px;");
                console.log("%c This browser feature is for developers only. Please do not copy-paste any code or run any scripts here. It may cause your StoreLTE account to be compromised.", "color:#003087; font-size:12px;");
                console.log("%c For more information, http://en.wikipedia.org/wiki/Self-XSS", "color:#003087; font-size:12px;");
            }
        }, false);
    </script>
</head>
<body class="skin-blue sidebar-mini">
    