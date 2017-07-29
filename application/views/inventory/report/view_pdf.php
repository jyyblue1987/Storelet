<style type="text/css">

P {text-align:justify;font-size: 12pt;}
li {text-align:justify;font-size: 12pt;}
table.page_footer {width: 100%; border: none; border-top: solid 1px #000000; }
table.products {border-collapse: collapse; width: 100%;}
table.products th,td  {text-align: left; padding: 8px;}
table.products thead tr{font-size: 9.5pt}
table.products th {background-color: #34495e;  color: white;}
tbody tr {background-color: #f2f2f2;}
</style>

<page backtop="0mm" backbottom="0mm" backleft="0mm" backright="0mm" style="font-size: 12pt">
    <page_footer>
        <table class="page_footer">
            <tr>
                <td style="width: 100%; text-align: right">
                    page [[page_cu]]/[[page_nb]]
                </td>
            </tr>
        </table>
    </page_footer>
<div style="width:100%;text-align:center;">
    <h1><b>List Inventory</b></h1>
</div>
   <table class="products" style='width:100%'; align="center">
      <thead>
          <tr>
              <th>Codigo</th>
              <th>Descripcion</th>
              <th>Precio compra</th>
              <th>Precio venta</th>
              <th>Precio mayoreo</th>
              <th>Existencia</th>
          </tr>
      </thead>
      <tbody>
        <?php foreach ($products as $key): ?>
            <tr>
              <td><?php echo $key['code']?></td>
              <td><?php echo $key['description']?></td>
              <td><?php echo $key['purchase_price']?></td>
              <td><?php echo $key['sale_price']?></td>
              <td><?php echo $key['wholesale_price']?></td>
              <td><?php echo $key['stock']?></td>
            </tr>
        <?php endforeach ?>
      </tbody>
   </table>
</page>