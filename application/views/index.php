<div class="wrapper">
    <header class="main-header">
        <a href="<?= base_url('home')?>" class="logo">
            <span class="logo-mini"><b>A</b>LT</span>
            <span class="logo-lg"><b>Store</b>LTE</span>
        </a>
        <nav class="navbar navbar-static-top" role="navigation">
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <div class="navbar-custom-menu">
                <ul class="nav navbar-nav">
                    <div class="clock" id="clock"></div>
                    <?php $this->load->view('notifications'); ?>
                        <?php $this->load->view('menu/user_menu'); ?>
                </ul>
            </div>
        </nav>
    </header>
    <?php $this->load->view('menu/menu'); ?>