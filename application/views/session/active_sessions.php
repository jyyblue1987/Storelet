<link rel="stylesheet" href="<?= base_url('assets/css/dataTables.bootstrap.css'); ?>">
<link rel="stylesheet" href="<?= base_url('assets/css/bootstrap-dialog.min.css')?>">
    <div class="content-wrapper">
        <section class="content">
            <section class="col-lg-12 connectedSortable">
                <div class="box">
                    <div class="box-header ">
                        <div class="box-title ">Active Sessions</div>
                    </div>
                    <div class="box-body ">
                        <table id="sessions" class="table table-bordered table-striped">
                            <thead>
                                <tr>
                                    <th>Browser</th>
                                    <th>IP Address</th>
                                    <th>Last Activity</th>
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
<script src="<?=base_url('assets/js/datatables/sessions.js');?>"></script>
<script src="<?=base_url('assets/js/bootstrap-dialog.min.js');?>"></script>
<script src="<?=base_url('assets/js/jquery.validate.min.js');?>"></script>
<script src="<?=base_url('assets/js/additional-methods.min.js');?>"></script>
