<style type="text/css">
P {text-align:justify;font-size: 12pt;}
li {text-align:justify;font-size: 12pt;}
table.page_footer {width: 100%; border: none; border-top: solid 1px #000000; }
table.provider {border-collapse: collapse; width: 100%;}
table.provider th,td  {text-align: left; padding: 8px;}
table.provider thead tr{font-size: 9.5pt}
table.provider th {background-color: #34495e;  color: white;}
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
    <h1><b>List Provider</b></h1>
</div>
   <table class="provider" style='width:100%'; align="center" >
      <thead>
          <tr>
              <th>First name</th>
              <th>Last name</th>
              <th>Phone</th>
              <th>Email</th>
              <th>Address</th>
          </tr>
      </thead>
      <tbody>
        <?php foreach ($providers as $key): ?>
            <tr>
              <td style="text-align: center;"><?php echo $key['first_name']?></td>
              <td style="text-align: center;"><?php echo $key['last_name']?></td>
              <td style="text-align: center;"><?php echo $key['phone']?></td>
              <td style="text-align: center;"><?php echo $key['email']?></td>
              <td style="text-align: center;"><?php echo $key['address']?></td>
            </tr>
        <?php endforeach ?>
      </tbody>
   </table>
</page>