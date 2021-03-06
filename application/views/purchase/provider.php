<link rel="stylesheet" href="<?= base_url('assets/css/dataTables.bootstrap.css'); ?>">
<link rel="stylesheet" href="<?= base_url('assets/css/bootstrap-dialog.min.css')?>">
<link rel="stylesheet" href="<?= base_url('assets/css/sweetalert.css')?>">
    <div class="content-wrapper">
        <section class="content">
            <section class="col-lg-12 connectedSortable">
                <div class="box">
                    <div class="box-header">
                        <div class="box-title">Lista De Provedores</div>
                    </div>
                    <div class="box-body">
                        <div class="">
                            <button id="add_provider" class="btn btn-primary">New provider</button>
                            <div class="btn-group">
                                <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="caret"></span>
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a href="<?php echo base_url().'purchase/Report_provider';?>">PDF Export</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <table id="example" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>First name</th>
                                    <th>Last name</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Address</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </section>
        </section>
    </div>
</div>
<script src="<?=base_url('assets/js/jquery.dataTables.min.js');?>"></script>
<script src="<?=base_url('assets/js/dataTables.bootstrap.min.js');?>"></script>
<script src="<?=base_url('assets/js/datatables/provider.js');?>"></script>
<script src="<?=base_url('assets/js/bootstrap-dialog.min.js');?>"></script>
<script src="<?=base_url('assets/js/jquery.validate.min.js');?>"></script>
<script src="<?=base_url('assets/js/additional-methods.min.js');?>"></script>
<script src="<?=base_url('assets/js/sweetalert.min.js');?>"></script>
