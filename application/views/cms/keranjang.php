<!-- breadrumb section -->
<section class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-line">
            <ul>
                <li><a href="<?php echo base_url()?>">Home</a> </li>
                <li><a href="">Keranjang Belanja</a> </li>
            </ul>
        </div>
    </div>

</section>

<!-- end breadcrumb -->

<!-- checkout product-->
<section class="checkout-product">
    <div class="container">
    <?php show_alert(); ?>
    <?php if(count($this->cart->contents())>0){ ?>
     <?php foreach($this->cart->contents() as $item){ ?>
      <form action="<?php echo base_url().'index/update_cart' ?>" method="post">
        <div class="check-main-product">
            <div class="title-checkout-product">
                <i class="fas fa-store"></i> Nama Penjual

                <a href="<?php echo base_url().'index/removefromcart/'.$item['rowid']; ?>" class="float-right d-none d-sm-block d-md-block d-lg-none d-block d-xl-none diki-tooltip" data-toggle="tooltip" data-placement="top" title="Hapus Belanja">Hapus</a>
            </div>
            <div class="row">
                <div class="col-lg-2 col-md-3 col-sm-3 col-5">
                    <div class="checkout-img">
                    <?php if($item['options']['gambar']!=""){

                        echo  "<img alt='Product' src='".base_url().'dah_image/products/'.$item['options']['gambar']."'>";
                        }else{
                        echo  "<img alt='Product' src='".base_url()."dah_image/default/no_product.jpg'>";
                        }
                    ?>
                    </div>    
                </div>

                <div class="col-lg-10 col-md-9 col-sm-9 col-7">
                    <div class="row" style="margin-left:-30px!important">

                        <div class="col-lg-4 col-md-12 col-sm-12">
                          
                            <div class="tp-checkout">
                            <p><a href="<?php echo base_url().'produk/'.$item['id'].'-'.create_slug($item['name']) ?>" class="d-block"><?php echo $item['name'] ?></a></p>
                            </div>
                        </div>
                    
                            
                            <div class="col-lg-2 col-md-12 col-sm-12 seperator">
                               <b>Rp. <?php echo number_format($item['price']).' ,-' ?></b> 
                            </div>
                            <div class="col-lg-2 col-md-12 col-sm-12 seperator">
                                  <input class="input-spinner" type="number" min="1" name="jumlah_produk[]" value="<?php echo $item['qty'] ?>" max="90"/>
                                  <input type="hidden" name="rowid[]" value="<?php echo $item['rowid'] ?>">
                            </div>
                            <div class="col-lg-2 col-md-12 col-sm-12 d-none d-lg-block d-xl-block seperator">
                                    <b class="red-text text-darker-2 d-flex justify-content-center">Rp. <?php echo number_format($item['price']).' ,-' ?></b> 
                                   
                            </div>
                            <div class="col-lg-2 col-md-12 col-sm-12 d-none d-lg-block d-xl-block seperator">
                              <a href="<?php echo base_url().'index/removefromcart/'.$item['rowid']; ?>" class="d-flex justify-content-center diki-tooltip" data-toggle="tooltip" data-placement="top" data-original-title="Hapus Belanja">Hapus</a>  
                            </div>

                      
                    </div>
                </div>
            </div>
        </div>
        <?php } ?>
        <!-- sticky checkout -->
        <div class="sticky-checkout">
          <div class="row">
            <div class="col-lg-9 col-md-7 col-sm-6">
                <div class="float-lg-right" style="margin-bottom: 10px;">
                    Subtotal :  <span class="blue-text text-accent-4">
                    <?php echo "Rp.". number_format($this->cart->total()).',-' ?>
                      </span>                
                    </div>
            </div>
            <div class="col-lg-3 col-md-5 col-sm-6">
              <a href="<?php echo base_url().'index/pembayaran' ?>" class="btn btn-check-out green darken-2 white-text">Bayar</a>

            </div>
          </div>
          
        </div>
        <!-- end sticky checkout -->
        </form>
        <?php } else{ ?>
          <p class="text-center">Keranjang belanja anda masih kosong. Ayo <a href="<?php echo base_url().'index/shop'; ?>">Belanja Produk Favorit Anda</a>.</p>
        <?php } ?>  

             <!-- product suggest -->
        <div class="product-suggest">
            <div class="product-s-title"  style="background: #fff;">
                <h1>Produk Rekomendasi</h1>
            </div>
           
            <div class="row">
                <?php
                    $arr = array(43,55,38,11);
                    for($a=0;$a<count($arr);$a++){
                    $ww = array('prod_id' => $arr[$a]);
                    $q = $this->m_dah->edit_data($ww,'dah_products')->result();
                    
                ?>
                <?php foreach($q as $pop){?>
                <div class="col-lg-3 col-md-6 col-sm-6">
             
                  <div class="product-suggest-form">
                      <!-- gambarproduct -->
                      <div class="product-suggest-img">
                        <?php       
                                    if($pop->prod_img1 !=""){
                                        echo "<img alt='Product' src='".base_url().'dah_image/products/'.$pop->prod_img1."'>";
                                    }else{
                                         echo "<img src='".base_url()."dah_image/default/no_product.jpg'>";
                                    }
                            ?>
                      </div>
                      <!-- end gambar product -->

                      <!-- product -suggest title -->
                      <div class="product-suggest-title">
                      <a href="<?php echo base_url().'produk/'.$pop->prod_id.'-'.create_slug($pop->prod_name) ?>"><?php echo substr(strip_tags($pop->prod_name),0,70); ?></a>
                      </div>
                      <!-- end produt-suggest -->

                        <!-- pdouct suggest sell -->
                        <div class="prod-price">
                  Rp. <?php echo number_format($pop->prod_price) ?>
                  <p class="tx-12" style="margin-top:3px;">
                    <i class="fa fa-star yellow-text text-darken-3"></i>
                    <i class="fa fa-star yellow-text text-darken-3"></i>
                    <i class="fa fa-star yellow-text text-darken-3"></i>
                    <i class="fa fa-star yellow-text text-darken-3"></i>
                    <i class="fa fa-star yellow-text text-darken-3"></i>
                    <span style="color:#000;opacity:0.4">(50) ulasan</span>
                  </p>

                  <p class="tx-13" style="margin-top:-5px;color:#000;opacity:0.5"> <i class="fas fa-store-alt"></i> 
                  <?php 
                      $nama_author=$this->m_dah->product_author_detail($pop->prod_author)->row();
                      echo $nama_author->user_name;      
                    ?> 

                </p>
                </div>
                      <!-- end product suggest sell -->
                  </div>
                </div>
                <?php } } ?>

            </div>
            
        </div>
  <!-- end product suggest -->
    </div>
</section>
<!-- end checkout -->