<style type="text/css">
page{
font-size: 5px;
}
.invoice-box .caption,
.thanks{
text-align: center;
}
table{
margin-top: 10px;
}
table thead tr > th,
table tbody tr > td {
    padding: 10px;
}
.total {
display: inline;
margin-left: 90px;
}
table .total td  {
    text-transform: uppercase;
}
</style>
<page backtop="7mm" backbottom="7mm" backleft="6mm" backright="6mm">
    <div class="invoice-box">
        <div class="caption">
            WALMART * <br>
            Save money. Live better<br>
            we sell for less<br>
            Manager Aaron IMperial<br>
            6691296347 <br>
            MAZATLAN,SINALOA
        </div>
        <div>
            <?php foreach ($ticket as $key => $value): ?>
                <p>Date: <?php echo $value['created_at'] ?></p>
            <?php endforeach ?>
        </div>
        <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <th>Item</th>
                    <th>Qty</th>
                    <th>Price</th>
                </tr>
            </thead>
            <tbody>
            <?php foreach ($ticket as $value ): ?>
                <tr>
                    <td><?php echo $value['description'] ?></td>   
                    <td><?php echo $value['quantity'] ?></td>  
                    <td><?php echo $value['price'] ?></td>  
                </tr>
             <?php endforeach; ?>
             </tbody>
        </table>
        <P class="thanks">THANK YOU FOR SHOPPING AT STORELTE!</P>
    </div>
</page>