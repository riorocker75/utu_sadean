
  <!-- product index   -->
  <br>	
<div class="container">
<!-- carousel gambar -->
<div class="slider-prepro">
  <div class="row">
    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
      <div class="imgpre-pro"></div>
      
    </div>
    <div class="col-xl-6 col-lg-6 col-md-12 col-sm-12 col-12">
      <div class="imgpre-pro"></div>
      
    </div>
    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
      <div class="imgpre-pro"></div>
      
    </div>
  </div>
</div>
<section class="variable slider slider-ind" style="margin-bottom:40px;" id="slider-indj">
    <div class="img-slick-slider">
      <img src="<?php echo base_url()?>dah_image/default/banner2.png">
    </div>
    <div class="img-slick-slider">
      <img src="<?php echo base_url()?>dah_image/default/banner3.png">
    </div>
    <div class="img-slick-slider">
      <img src="<?php echo base_url()?>dah_image/default/banner4.png">
    </div>
  
  </section>
<!-- end carousel gambar -->


<!-- kelebihan -->
<div class="kelebihan">
    <div class="row">
          <div class="col-lg-3 col-md-6 col-12">
              <div class="keli-static" >
                  <img src="<?php echo base_url().'dah_image/icon-cate/ship.png'?>">
                  <div class="keli-static-meta">
                   <h4>Pengiriman Cepat</h4>
                    <p>24/7 siaga kirim</p>
                  </div>
              </div>
          </div>
          <div class="col-lg-3 col-md-6 col-12">
            <div class="keli-static" >
                    <img src="<?php echo base_url().'dah_image/icon-cate/web.png'?>">
                    <div class="keli-static-meta">
                    <h4>Uang Kembali</h4>
                      <p>Garansi uang kembali</p>
                    </div>
                </div>
          </div>
          <div class="col-lg-3 col-md-6 col-12">
              <div class="keli-static" >
                      <img src="<?php echo base_url().'dah_image/icon-cate/pay.png'?>">
                      <div class="keli-static-meta">
                      <h4>Pembayaran Aman</h4>
                        <p>Bayar melaui Bank</p>
                      </div>
                  </div>
          </div>
          <div class="col-lg-3 col-md-6 col-12">
              <div class="keli-static" >
                      <img src="<?php echo base_url().'dah_image/icon-cate/call.png'?>">
                      <div class="keli-static-meta">
                      <h4>Bantuan Cepat</h4>
                        <p>Siap mengatasi bantuan</p>
                      </div>
                  </div>
          </div>
    </div>
</div>
<!-- end kelebihan -->

<!--strat product-->
<?php	if(count($products) > 0){?>
<div style="margin-bottom:30px;">
  <p class="judul-part" >Baru di olah</p> 
  <span class="bag-part">Produk yang di jual selalu fresh</span>
</div>
  <div class="load-bef-ind d-lg-block d-xl-block d-md-block d-sm-block d-none">
      <!-- loaderprepro -->
      <div class="loader-prepro">
          <div class="row">
            <?php for($i=1;$i < 6;$i++){?>
            <div class="colb-xl-3 col-lg-3 colb-md-5 col-sm-6">
                <div class="lprepro-ind">
                    <div class="prepro-shine lprepro-img"></div>
                    <div class="prepro-shine lprepro-title"></div>
                    <div class="prepro-shine lprepro-title"></div>
                    <div class="prepro-shine lprepro-price"></div>
                    <div class="prepro-shine lprepro-footer"></div>
                </div>
            </div>
            <?php }?>
          </div>
      </div>
      <!-- end loader-prepro -->
      <div class="sp-body">
          <div class="prod-ind prod-insli1" id="prod-ind-jq">

                <?php	foreach($products as $p){?>
                  <div class="prod-index" >
             
             <!-- image -->
             <div class="prod-img">
               <a href="<?php echo base_url().'produk/'.$p->prod_id.'-'.create_slug($p->prod_name) ?>">
                   <?php if($p->prod_img1!=""){
                       echo"<img alt='Product' src='".base_url().'dah_image/products/'.$p->prod_img1."'>";
                       }else{
                         echo"<img alt='Product' src='".base_url()."dah_image/default/no_product.jpg'>";
                       }
                       ?>
               </a>
             </div>

             <!-- end image -->
             <!-- judul -->
            
               <div class="prod-title">
                   <a href="<?php echo base_url().'produk/'.$p->prod_id.'-'.create_slug($p->prod_name) ?>">
                     <?php 
                         echo substr(strip_tags($p->prod_name),0,70);
                     ?> 
                   </a>         
               </div>
         
             <!-- end judul -->
            <a href="<?php echo base_url().'produk/'.$p->prod_id.'-'.create_slug($p->prod_name) ?>">
               <!-- harga & add to cart -->
               <div class="prod-price">
                 Rp<?php echo number_format($p->prod_price) ?>
                 <p class="tx-12" style="margin-top:7px;">
                   <i class="fa fa-star yellow-text text-darken-3"></i>
                   <span style="color:#000;opacity:0.4">4.5</span>
                 </p>

               </div>
               <!-- end harga -->
           </a>
            
           <div class="prod-stats">
               <a id="<?php echo $p->prod_id; ?>" class="keranjang-dulu-ind" title="tambah ke keranjang">Keranjang</a>
           </div>
           </div> 
                
                <?php } ?> 
            
          </div>

        </div>
  </div>

  <?php foreach($products as $pr1){?>
    <?php $nama_author_1=$this->m_dah->product_author_detail($pr1->prod_author)->row(); ?>

    <div class="prod-list-sw d-lg-none d-md-none d-sm-none d-inline-block">
                    <div class="prod-list-sw-pre">
                    
                    <a href="" data-toggle="tooltip" data-placement="bottom" title="add to favorit"><i class="fa fa-heart"></i></a>
                    </div>                 
                    <div class="prod-list-sw-coverup">
                        <div class="prod-list-sw-img">
                          <?php if($pr1->prod_img1!=""){
                       echo"<img alt='Product' src='".base_url().'dah_image/products/'.$pr1->prod_img1."'>";
                       }else{
                         echo"<img alt='Product' src='".base_url()."dah_image/default/no_product.jpg'>";
                       }
                       ?>
                        </div>  
                        
                        <div class="prod-list-sw-title">
                     <a href="<?php echo base_url().'produk/'.$pr1->prod_id.'-'.create_slug($pr1->prod_name) ?>">
                         <?php 
                         echo substr(strip_tags($pr1->prod_name),0,70);
                         ?> 
                     </a> 
                                    
                        </div>
                </div>

                <div class="prod-list-sw-rating">
                    <i class="fa fa-star yellow-text text-accent-4 tx-16"></i> 4.8
                </div> 
                
                <div class="prod-list-sw-price">
                    <?php if($pr1->prod_price != "0"){?>
                <span >Rp<?php echo number_format($pr1->prod_price);?></span>
                    <?php }else{?>
                    <span class="green-text text-accent-4 tx-robosan tx-14">Gratis</span>
                    <?php } ?>  
                </div>
            
                <div class="prod-list-sw-auth">
                    <!-- <div class="prod-list-swa-img">
                        <img src="<?php echo base_url()?>dah_image/system/shop-store.png">
                    </div> 
                     <?php 
                            $cat = $this->m_dah->get_product_category($pr1->prod_id)->result();
                            foreach($cat as $ct){}
                       ?>
                    <div class="prod-list-swa-title">
                        <div class="text-prod-list-swa-cat">di<a href="<?php echo base_url().'index/kategori_produk/'.$ct->pcat_id;?>" style="top:1px;margin-left:2px;"><?php echo substr(strip_tags($ct->pcat_name),0,20); ?></a> </div>    
                    </div> -->
                    
                </div>             
        </div>
  <?php } ?>  
<!-- end baru panen -->

<!--end product-->
  
  <?php }else{?> 
    Product Masih Belum 
  <?php } ?> 
  <!-- kategori -->
<div style="margin:30px 0;">
  <p class="judul-part" >Kategori Populer</p> 
  <span class="bag-part">Kategori yang paling laris</span>
</div>
<?php
  $koroke=$this->m_dah->get_tot_cat('39')->num_rows();
  $bakso=$this->m_dah->get_tot_cat('36')->num_rows();
  $sosis=$this->m_dah->get_tot_cat('37')->num_rows();
?>
<div class="row">
    <div class="col-lg-4 col-md-6 col-12">
        <div class="kategori-prod-index">
          <img src="<?php echo base_url().'dah_image/icon-cate/cat_koroke.png'?>" alt="">
          <div class="ket-kategori">
            <div class="jud-ket-kategori">
              Olahan Koroke
            </div>
            <span><?php echo $koroke?> Produk</span>
            <div style="margin-bottom:10px"></div>
                <a href="<?php echo base_url().'index/kategori_produk/39'?>" style="margin-top:30px">
                  Belanja Sekarang <i class="fa fa-play-circle" aria-hidden="true"></i>
                </a >

                </div>
        </div>
    </div>
    <div class="col-lg-4 col-md-6 col-12">
      <div class="kategori-prod-index">
            <img src="<?php echo base_url().'dah_image/icon-cate/cat_sosis.png'?>" alt="">
            <div class="ket-kategori">
              <div class="jud-ket-kategori">
                Olahan Sosis
              </div>
              <span><?php echo $sosis ?> Produk</span>
              <div style="margin-bottom:10px"></div>
                  <a href="<?php echo base_url().'index/kategori_produk/37'?>" style="margin-top:30px">
                    Belanja Sekarang <i class="fa fa-play-circle" aria-hidden="true"></i>
                  </a >

                  </div>
          </div>
    </div>
    <div class="col-lg-4 col-md-6 col-12">
    <div class="kategori-prod-index">
            <img src="<?php echo base_url().'dah_image/icon-cate/cat_bakso.png'?>" alt="">
            <div class="ket-kategori">
              <div class="jud-ket-kategori">
                Olahan Bakso
              </div>
              <span><?php echo $bakso?> Produk</span>
              <div style="margin-bottom:10px"></div>
                  <a href="<?php echo base_url().'index/kategori_produk/36'?>" style="margin-top:30px">
                    Belanja Sekarang <i class="fa fa-play-circle" aria-hidden="true"></i>
                  </a >

                  </div>
          </div>

    </div>
    

</div>

<!-- end kategori -->
</div>
<!-- end product -->





<!-- <div class="chat-sess-body" id="chat-body">
    <div class="grt-close">
      <a style="cursor:pointer"> <i class="fa fa-times red-text"></i> </a>
    </div>
  
    <div class="grt-cs">
    
      <img src="<?php echo base_url()?>dah_image/system/supp.png" alt="">
      <div class="grt-cs-isi">
       <label id="pesan-hari"></label>,<br> Ada yang bisa kami bantu ?
      
      </div>
    </div>

    <div class="grt-wa" style="text-align:center;margin-top:15px">
      <a href="https://wa.me/6282162899474" target="__blank" class="tx-13 white-text green darken-3" style="border-radius:8px; padding:12px 20px;"> <i class="fab fa-whatsapp tx-18"></i> Chat Kami Di Whatsapp</a>
    </div>
</div>
<div class="chat-sess-flat green darken-2 white-text " id="chat-sess">
 <i class="fas fa-comment-dots tx-30"></i>
</div> -->



<!-- madal promo -->

<!-- <div class="modal fade" id="promo-mod" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-sm modal-dialog-centered">
  
    <div class="modal-content promo-lead">
        <div class="close-aja-pro"><a id="tutup-promo" data-dismiss="modal"><i class="fa fa-times tx-15"></i></a></div>
				<img src="<?php echo base_url()?>dah_image/default/promo_pop.png" alt="" srcset="">
				<a href="<?php echo base_url().'shop'?>" class="promo-pop-btn">Belanja yuk</a>
			</div>
  </div>
</div> -->

<!-- end modal promo -->


<!-- 
<script>
$(document).ready(function () {
		$('<audio id="notif_sound"><source src="<?php echo base_url()?>dah_image/notif.mp3" type="audio/mpeg"></audio>').appendTo('body');
		var sound_x = document.getElementById("notif_sound");
		function chat_ses1(){
			$('#chat-sess').fadeIn();
		}
		function playNotif() {
			sound_x.play();
		}
		function bc_sess(){
			$('.chat-sess-body').fadeIn();
			$('#notif_sound')[0].play();
		}
		window.setTimeout(chat_ses1, 6000);
		window.setTimeout(bc_sess, 7000);
		window.setTimeout(playNotif, 7000);
	
	});
  
</script> -->
