<link rel="stylesheet" href="<?= base_url('assets/css/dataTables.bootstrap.css'); ?>">
<link rel="stylesheet" href="<?= base_url('assets/css/bootstrap-dialog.min.css');?>">
    <div class="content-wrapper">
        <section class="content">
            <section class="col-lg-12 connectedSortable">
                <div class="row register">
                    <div class="col-lg-8 col-md-7 col-sm-12 col-xs-12 no-padding-right no-padding-left">
                        <div class="toolbar">
                            <form action="#" id="autocomplete" name="autocomplete" class="form-horizontal" autocomplete="off" method="POST" accept-charset="utf-8" onsubmit="return true;">
                                <div class="form-group">
                                    <div class="col-sm-10 input-group">
                                        <input type="text" class="form-control" id="search" name="search" placeholder="Enter item name or scan barcode" autocomplete="off" data-provide="typeahead">
                                        <span class="input-group-addon">
                                                    <a href="#" id="btn-search" class="glyphicon glyphicon-search"></a>
                                                </span>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="table-responsive">
                            <table class="table" id="table_cart_contents">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Item Name</th>
                                        <th>Price</th>
                                        <th>Qty.</th>
                                        <th>Total</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>0</td>
                                        <td>####</td>
                                        <td>0</td>
                                        <td>
                                            <input type="number" class="quantity_cart" data-id="0" data-name="0" data-price="0" value="0" disabled step="1" />
                                        </td>
                                        <td>0</td>
                                        <td><a href="#" class="remove-product-cart" data-id="0" data-name="" data-price="0" data-qty="0"><i class="fa fa-times"></i></a></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-12 col-xs-12 no-padding-right">
                        <div class="col-sm-12">
                            <div class="register-box register-summary paper-cut">
                                <div class="tier-group">
                                    <a href="#" class="select-sales-person ">Sales person: <span class="selected-sales-person pull-right">Aaron Imperial</span></a>
                                </div>
                                <ul class="list-group">
                                    <li class="list-group-item global-discount-group">
                                        <div class="key">Discount all Items by Percent: </div>
                                        <div class="value pull-right">
                                            <a href="#" id="discount_all_percent" class="xeditable editable editable-click editable-empty" data-validate-number="false" data-placement="left" data-type="text" data-pk="1" data-name="discount_all_percent" data-url="https://demo.phppointofsale.com/index.php/sales/discount_all" data-title="Discount all Items by Percent" data-emptytext="Set Discount" data-placeholder="Set Discount">Set Discount</a>
                                        </div>
                                    </li>
                                    <li class="sub-total list-group-item">
                                        <span class="key">Sub Total:</span>
                                        <span class="value">$0.00</span>
                                    </li>
                                </ul>
                                <div class="amount-block">
                                    <div class="total amount">
                                        <div class="side-heading">
                                            Total </div>
                                        <div class="amount total-amount" data-speed="1000" data-currency="$" data-decimals="2">
                                            $0.00 </div>
                                    </div>
                                    <div class="total amount-due">
                                        <div class="side-heading">
                                            Amount Due </div>
                                        <div class="amount">
                                            $0.00 </div>
                                    </div>
                                </div>
                                <div class="add-payment">
                                    <form action="#" id="add_payment_form" autocomplete="off" method="post" onsubmit="return false;">
                                        <div class="input-group add-payment-form">
                                            <input type="text" name="amount_tendered" id="amount_tendered" class="add-input ">
                                            <span class="input-group-addon">
                                                    <a href="#"  id="checkout">Check Out</a>
                                                </span>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </section>
    </div>
</div>
<script src="<?=base_url('assets/js/jquery.dataTables.min.js');?>"></script>
<script src="<?=base_url('assets/js/dataTables.bootstrap.min.js');?>"></script>
<script src="<?=base_url('assets/js/sales/sales.js');?>"></script>
<script src="<?=base_url('assets/js/bootstrap-dialog.min.js');?>"></script>
<script src="<?=base_url('assets/js/jquery.validate.min.js');?>"></script>
<script src="<?=base_url('assets/js/additional-methods.min.js');?>"></script>
<script src="<?=base_url('assets/js/bootstrap3-typeahead.min.js')?>"></script>
