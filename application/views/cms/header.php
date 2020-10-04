<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author" content="">
	<title><?php echo $this->m_dah->get_option('blog_name'); ?> | <?php echo strip_tags($this->m_dah->get_option('blog_description')); ?></title>
	<!--<link rel="icon" type="image/png" href="<?php echo base_url().'dah_image/default/logo_utu.png' ?>">-->
	<!-- Global stylesheets -->
  <!-- core CSS -->

  	<link rel="stylesheet" href="<?php echo base_url() ?>assets_front/css/bootstrap.css">
    <link rel="stylesheet" href="<?php echo base_url(); ?>assets_front/css/bootgrid-15col.css" />
    <link rel="stylesheet" href="<?php echo base_url() ?>assets_front/dist/css/core_utu.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>assets_front/dist/css/custom_utu.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>assets_front/dist/css/custom.css">

    <link rel="stylesheet" href="<?php echo base_url() ?>assets_front/dist/css/slick.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>assets_front/dist/css/slick-theme.css">

    <!-- font -->
    
    <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.css"> -->
    <link rel="stylesheet" href="<?php echo base_url() ?>assets_front/font-aw/css/all.css">
    <link rel="stylesheet" href="<?php echo base_url() ?>assets_front/material-icon/material-icon.css">


	<!-- Core JS files -->
  <script src="<?php echo base_url()?>assets_front/js/jquery.min.js" ></script>

	<!-- Theme JS files -->


	 <!-- Histats.com  START  (aync)-->

<!-- Histats.com  END  -->
</head>

  <body>

<!-- bagian header mulai -->
<div class="sticky-top">

<!-- topbar mulai -->
  <div class="topbar-cus d-lg-block d-md-none d-none">
    <div class="row">
    <div class="container">
      <div class="topbar-right float-right">
          <ul>
            <li>
              <a data-target="#modal-lacak" data-toggle="modal">Lacak Pesanan</a>
            </li>
            <li>
              <a data-target="#modal-resi" data-toggle="modal">Cek resi</a>
            </li>

            <?php if($this->session->userdata('user_status') != "login"){?>
              <li>
                <a href="<?php echo base_url().'index/user_daftar'?>">Daftar</a>
              </li>
              <li>|</li>
              <li>
                <a data-target="#login-pembeli" data-toggle="modal">Masuk</a>
              </li>
            <?php }else{}?>
          </ul>
      </div>

      <div class="topbar-right float-left" style="margin-left:-40px">
        <ul>
        
          <li>
            <a href="<?php echo base_url().'index/tentang'?>">
              Tentang
           </a>
          </li>

          <li>
            <a href="<?php echo base_url().'index/tentang'?>">
              Metode Bayar
           </a>
          </li>

          <li>
            <a href="<?php echo base_url().'index/tentang'?>">
             Bantuan
           </a>
          </li>
        </ul>
      </div>
      </div>
      
    
    </div>
  </div>
<!-- end topbar -->

<!-- nsearchnav -->

<!-- ukuran desktop -->
<?php
    $id=$this->session->userdata('user_id');
    $notif_inv=$this->m_dah->get_susun_invoice($id,0)->num_rows();
    $notif_invoices=$this->m_dah->get_susun_invoice($id,0)->result();
    foreach($this->cart->contents() as $items){
        $tots_item += $items['qty'];
    }
  ?>
<div class="search-nav d-none d-md-none d-lg-block">
 
      <div class="container" style="margin-top:2px">
          <div class="row">
           
                  <div class="col-lg-2">
                      <div class="float-left">
                      <div class="logo">
                        <a href="<?php echo base_url()?>">
                          <img src="<?php echo base_url().'dah_image/default/logo_sadean.png'?>" alt="">
                      </a>
                      </div>
                      </div>
                  </div>

                  <div class="col-lg-6">
                  <form action="<?php echo base_url().'search'?>" method="post" class="cari-header">
                    <i class="fa fa-search" style="margin-left:10px"></i>
                        <input type="text"  class="input-banner" placeholder="Cari disini " name="item">
                        <input
                        type="submit"
                        name="submit"
                        class="btn-bordered-icon btn-find "
                        value="Cari"
                    hidden />
                    </form>
                  </div>

                  <div class="col-lg-4">
                    <div class="float-right">
                        <ul class="search-right">
                    
                        <li class="dropdown">
                              <a id="keranjang">
                                <div class="btn-icon">
                                <i class="fas fa-shopping-bag"></i>
                                  <?php if(count($this->cart->contents())>0){ ?>
                                    <span class="det-bel"><?php  echo $tots_item ?></span>
                                  <?php }else{}?>
                                </div>

                              </a>

                        </li>
                                 <!-- end bagian desktop cart -->


                                  <!-- start user desktop  -->
                                  <?php if($this->session->userdata('user_status') == "login"){?>

                                  
                                    <!-- start info desktop -->
                                    <li class="dropdown">
                                      <a data-toggle="dropdown">
                                      <div class="btn-icon">
                                           <i class="fa fa-bell tx-18" aria-hidden="true"></i>
                                           <?php if($notif_inv > 0){ ?>
                                          <span class="notif-ang"><?php echo $notif_inv?></span>
                                          <?php }else{}?>
                                      </div>
                                        
                                      </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-custom">
                                          <div class="dropdown-title">
                                             Pemberitahuan
                                          </div>
                                          <?php 
                    
                                            if($notif_inv > 0){ 
                                          ?>
                                            <?php foreach($notif_invoices as $inc){ ?>
                                                <a href="<?php echo base_url().'user/invoice_detail/'.$inc->id ?>" > 
                                                  <div class="notif-body">
                                                  <a href="<?php echo base_url().'user/invoice_detail/'.$inc->id ?>" class="blue-text text-accsent-3 tx-14 tx-bold-600"> <?php echo $inc->no?></a>
                                                  <p class=" tx-12">Rp <?php echo number_format($inc->pembayaran)?></p>
                                                  <label class="labil labil-notif tx-10">Harap dibayar</label>
                                                  </div>
                                                  </a>
                                              <?php }?>
                                          <?php }else{?>
                                         
                                              Belum ada pemberitahuan
                                          <?php } ?>  
                                        </div>
                                    </li>
                                  <!-- end desktop user -->    
                                        <li class="dropdown">
                                              <a data-toggle="dropdown">
                                                <div class="btn-icon">
                                                  <i class="fa fa-user tx-18" aria-hidden="true"></i>
                                                  </div>
                                              </a>
                                              <div class="dropdown-menu dropdown-custom dropdown-menu-right down-md">
                                                <ul>
                                                    <li><a href="<?php echo base_url().'user/invoice' ?>">Pesanan</a> </li>
                                                    <li><a href="<?php echo base_url().'user'?>">Pengaturan Akun</a></li>
                                                    <li><a href="" data-toggle="modal" data-target="#modal-resi">Lacak Pesanan</a></li>
                                                    <li><a href="<?php echo base_url().'user/user_logout'?>">Keluar</a></li>
                                                </ul>
                                              </div>
                                          </li>
                                  <?php }else{}?>          
                                  <!-- end desktop user -->

                                

                          </ul>
                    </div>
                      
                  </div>
              </div>
            
           
</div>
</div>

<!-- ukuran mobile -->
<div class="search-nav d-block d-md-block d-lg-none">
        <div class="container">
          <div class="row">
              <div class="col-sm-7 col-5">
              <form action="<?php echo base_url().'search'?>" method="post" class="cari-header">
                    <i class="fa fa-search" style="margin-left:10px"></i>
                        <input type="text"  class="input-banner" placeholder="Cari disini " name="item">
                        <input
                        type="submit"
                        name="submit"
                        class="btn-bordered-icon btn-find "
                        value="Cari"
                    hidden />
                    </form>                 
              </div>
            <!-- untuk keranjang  -->
              <div class="col-sm-5 col-7" >
              <div class="float-right">
                        <ul class="search-right" style="margin-right:-20px">

                        <li class="dropdown">
                            <a id="keranjang">
                              <div class="btn-icon">
                              <i class="fas fa-shopping-bag"></i>
                                <?php if(count($this->cart->contents())>0){ ?>
                                  <span class="det-bel"><?php  echo $tots_item ?></span>
                                <?php }else{}?>
                              </div>

                             </a>

                               
                        </li>
                                 <!-- akhir keranjang mobile -->

                                
                                 <!-- start user mobile -->
                                
                                <?php if($this->session->userdata('user_status') != "login"){?>

                                  <li><a data-target="#login-pembeli" data-toggle="modal" title="masuk">
                                    <div class="btn-icon">
                                         <i class="fas fa-sign-in-alt"></i>
                                    </div>
                                  </a></li>    
                                <?php }else{?>

                                <!-- start info mobile -->
                                <li class="dropdown">
                                      <a data-toggle="dropdown">
                                      <div class="btn-icon">
                                           <i class="fa fa-bell tx-18" aria-hidden="true"></i>
                                           <?php if($notif_inv > 0){ ?>
                                          <span class="notif-ang"><?php echo $notif_inv?></span>
                                          <?php }else{}?>
                                      </div>
                                        
                                      </a>
                                        <div class="dropdown-menu dropdown-menu-right dropdown-custom">
                                          <div class="dropdown-title">
                                             Pemberitahuan
                                          </div>
                                          <?php 
                    
                                            if($notif_inv > 0){ 
                                          ?>
                                            <?php foreach($notif_invoices as $inc){ ?>
                                                <a href="<?php echo base_url().'user/invoice_detail/'.$inc->id ?>" > 
                                                  <div class="notif-body">
                                                  <a href="<?php echo base_url().'user/invoice_detail/'.$inc->id ?>" class="blue-text text-accsent-3 tx-14 tx-bold-600"> <?php echo $inc->no?></a>
                                                  <p class=" tx-12">Rp <?php echo number_format($inc->pembayaran)?></p>
                                                  <label class="labil labil-notif tx-10">Harap dibayar</label>
                                                  </div>
                                                  </a>
                                              <?php }?>
                                          <?php }else{?>
                                         
                                              Belum ada pemberitahuan
                                          <?php } ?>  
                                        </div>
                                    </li>
                                  <!-- end mobile user --> 
                                  <li class="dropdown">
                                      <a data-toggle="dropdown">
                                         <div class="btn-icon">
                                           <i class="fa fa-user tx-18" aria-hidden="true"></i>
                                          </div>
                                      </a>
                                      <div class="dropdown-menu dropdown-custom down-md dropdown-menu-right">
                                        <ul>
                                            <li><a href="<?php echo base_url().'user/invoice' ?>">Pesanan</a> </li>
                                            <li><a href="<?php echo base_url().'user'?>">Pengaturan Akun</a></li>
                                            <li><a href="" data-toggle="modal" data-target="#modal-resi">Lacak Pesanan</a></li>
                                            <li><a href="<?php echo base_url().'user/user_logout'?>">Keluar</a></li>
                                        </ul>
                                      </div>
                                  </li>
                                <?php } ?>          

                                 <!-- end user mobile -->
                                 
                          </ul>
                    </div>                            

              </div>
                <!-- end keranjang -->
          </div>
           
        </div>
</div>


 <!-- akhir nsearchnav -->

</div>
<!-- end bagian header -->

