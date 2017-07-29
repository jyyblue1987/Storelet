<form class="form-horizontal" id="product">
    <div class="form-group">
        <label for="description" class="col-sm-2 control-label">Product: </label>
        <div class="col-sm-10">
            <input type="text" class="form-control" id="description" name="description" placeholder="Please enter product" required> </div>
    </div>
    <div class="form-group row">
        <div class="col-md-4"> min stock
            <input type="number" class="form-control" id="min_stock" name="min_stock" min="1" value="1" required /> </div>
        <div class="col-md-4"> stock
            <input type="number" class="form-control" id="stock" name="stock" min="1" value="1" required /> </div>
        <div class="col-md-4"> max stock
            <input type="number" class="form-control" id="max_stock" name="max_stock" min="1" value="1" required /> </div>
    </div>
    <div class="form-group row">
        <div class="col-md-8">
            <label for="wprice" class="">Wholeprice: </label>
            <div class="input-group">
                <div class="input-group-addon">$</div>
                <input type="text" class="form-control input-group-lg reg_name" id="wprice" name="wprice" placeholder="Amount" required/> </div>
        </div>
        <div class="col-md-4">
            <label for="cost_price" class="">Cost price: </label>
            <div class="input-group">
                <div class="input-group-addon">$</div>
                <input type="text" class="form-control input-group-lg reg_name" id="cost_price" name="cost_price" placeholder="Amount" required/> </div>
        </div>
    </div>
    <div class="form-group row ">
        <div class="col-md-8">
            <label for="provider">Provider: </label>
            <select name="select_provider" id="select_provider" class="form-control" required>
                <option value="">Select a provider</option>
                <?php foreach ($data as $value): ?>
                    <option value="<?php echo $value['id']; ?>">
                        <?php echo $value['first_name'].' '.$value['last_name'] ?>
                    </option>
                    <?php endforeach ?>
            </select>
        </div>
        <div class="col-md-4">
            <label for="selling_price">Selling price: </label>
            <div class="input-group">
                <div class="input-group-addon">$</div>
                <input type="text" class="form-control input-group-lg reg_name" id="selling_price" name="selling_price" placeholder="Amount" required> </div>
        </div>
    </div>
</form>
<script>
    $(function(event) {
        $('#max_stock,#min_stock,#stock').bootstrapNumber({
            upClass: 'success',
            downClass: 'danger'
        });
        $("#product").validate({
            rules: {
                wprice: {
                    required: true,
                    currency: ["$", false],
                },
                cost_price: {
                    required: true,
                    currency: ["$", false],
                },
                selling_price: {
                    required: true,
                    currency: ["$", false],
                },
            }
        });
    });
</script>
