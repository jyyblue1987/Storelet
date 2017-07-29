<aside class="main-sidebar">
   <section class="sidebar">
      <ul class="sidebar-menu">
         <?php foreach ($fields as $session): ?>
            <?php foreach ($session['data'] as $itemData): ?>
               <li class="treeview">
                  <a href="">
                     <img src="<?= $session['icon']?>" alt="" class="menu-icon"> <span><?= $session['section'] ?></span>
                     <i class="fa fa-angle-left pull-right"></i> 
                  </a>
                  <ul class="treeview-menu">
                     <li><a href="<?= $itemData['url']?>"><i class="fa fa-circle-o text-aqua"></i> <?= $itemData['value'] ?></a></li>
                  </ul>
               </li>
            <?php endforeach ?>
         <?php endforeach ?>
      </ul>
   </section>
</aside>