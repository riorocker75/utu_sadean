  <div class="clearfix visible-sm visible-xs"></div>

<div class="container-fluid" style="margin-top:5px;">
      <div class="row">

        
<!-- carousel -->
<div id="bootstrap-touch-slider" class="carousel bs-slider slide  control-round indicators-line" data-ride="carousel" data-pause="hover" data-interval="5000" >

            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#bootstrap-touch-slider" data-slide-to="0" class="active"></li>
                <li data-target="#bootstrap-touch-slider" data-slide-to="1"></li>
              
            </ol>

            <!-- Wrapper For Slides -->
            <div class="carousel-inner" role="listbox">

                <!-- Third Slide -->
                <div class="item active">

                    <!-- Slide Background -->
                    <img src="<?php echo base_url();?>images/nelayan1.jpg" style="width:100%; background-size: cover; height: 450px"/>
                    <div class="bs-slider-overlay"></div>

                    <div class="container">
                        <div class="row">
                            <!-- Slide Text Layer -->
                            <div class="slide-text slide_style_left">
                                <h1 data-animation="animated zoomInRight">Lapak Nelayan </h1>
                                <p data-animation="animated fadeInLeft">Hadir untuk nelayan dalam memasarkan hasil tangkapannya lebih luas</p>
                               
                                <a href="<?php echo base_url();?>" target="_blank"  class="btn btn-primary" data-animation="animated fadeInRight">Belanja Sekarang</a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End of Slide -->

                <!-- Second Slide -->
                <div class="item">

                    <!-- Slide Background -->
                  <img src="<?php echo base_url();?>images/nelayan2.jpg" style="width:100%; background-size: cover; height: 450px"/>
                    <div class="bs-slider-overlay"></div>
                    <!-- Slide Text Layer -->
                    <div class="slide-text slide_style_right">
                        <h1 data-animation="animated flipInX">Lapak Nelayan</h1>
                        <p data-animation="animated lightSpeedIn">Memberikan kemudahan dalam berbelanja ikan segar</p>
                        <a href="<?php echo base_url();?>" target="_blank" class="btn btn-default" data-animation="animated fadeInUp">Beli Sekarang</a>
                       
                    </div>
                </div>
                <!-- End of Slide -->

                <!-- Third Slide -->
                
                <!-- End of Slide -->


            </div><!-- End of Wrapper For Slides -->

            <!-- Left Control -->
            <a class="left carousel-control" href="#bootstrap-touch-slider" role="button" data-slide="prev">
                <span class="fa fa-angle-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>

            <!-- Right Control -->
            <a class="right carousel-control" href="#bootstrap-touch-slider" role="button" data-slide="next">
                <span class="fa fa-angle-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
</div>
        </div> <!-- End  bootstrap-touch-slider Slider -->

    <!-- Main Content -->
    <div class="container m-t-2">


      <!-- <div class="row">
        <div class="col-md-4 ">
          <div class="title"><span></span></div>
                                  <div class=" col-xs-12 col-sm-12">
                                    <a class="" href="detail.html"><img style="width:100%!important;"src="<?php echo base_url();?>images/promo12.png" alt=""></a>

            </div>                        </div>



                                  <div class="col-xs-12 col-sm-12"style="margin-top:7px">
                                    <a class="" href="detail.html"><img style="width:100%!important;"src="<?php echo base_url();?>images/promo2.png" alt=""></a>

                                  </div>

      </div> -->

      <div class="row">

        <div class="col-md-9 col-xs-12 col-sm-12 hidden-xs hidden-sm">
          <div class="title">
            <span>Kategori</span>
          </div>
          <div class="kat_label">
        <ul class="kat_label">
        <a href="">
          <li id="hover">
            <div class="kat_label_image">
              <img src="<?php echo base_url().'images/ikan_laut.png';?>" >
            </div>
            <div class="kat_label_title">Ikan Laut<span class="kat_label_opportunities">(20)</span>
            </div>
          </li>
        </a>
        <a href="">
          <li id="hover">
            <div class="kat_label_image">
              <img src="<?php echo base_url().'images/ikan.png';?>">
            </div>
            <div class="kat_label_title">
            Ikan Tawar<span class="kat_label_opportunities">(10)</span>
            </div>
          </li>
        </a>
        <a href="">
          <li id="hover">
            <div class="kat_label_image">
              <img src="<?php echo base_url().'images/tambak1.png';?>">
            </div>
            <div class="kat_label_title">
              Hasil Budidaya<span class="kat_label_opportunities">(30)</span>
            </div>
          </li>
        </a>



        <!-- </li>
        <li class="col-md-4 col-xs-4">Tes</li>
        <li class="col-md-4 col-xs-4">Tes</li> -->

        </ul>
      </div>
        </div>
      </div>


      <div class="row">

        <!-- New Arrivals & Best Selling -->

        <!-- End New Arrivals & Best Selling -->
<!-- kategory -->
<!-- <div class="clearfix visible-sm visible-xs"></div> -->


<!-- akhir kategory -->
        <div class="clearfix visible-sm visible-xs"></div>

        <div class="col-md-9">

          <!-- Featured -->
          <div class="title"><span>Daftar Komoditas</span></div>
					<?php
					if(count($products) > 0){
					foreach($products as $p){
					?>
          <div class="col-xs-6 col-sm-4 col-lg-3 box-product-outer">

            <div class="box-product  layang" width="300"!important height="300">

              <div class="img-wrapper img-layang" width="174" height="174">
                <a href="<?php echo base_url().'produk/'.$p->prod_id.'-'.create_slug($p->prod_name) ?>">
									<?php if($p->prod_img1!=""){
                  echo"<img alt='Product' src='".base_url().'dah_image/products/'.$p->prod_img1."'>";
									}else{
										echo"<img alt='Product' src='".base_url()."dah_image/default/no_product.jpg'>";
									}
									?>
                </a>

                <div class="tags">
                  <span class="label-tags"><span class="label label-success arrowed">Fresh</span></span>
                </div>
                <div class="tags tags-left">
                  <span class="label-tags"><span class="label label-primary arrowed-right">Tersedia</span></span>
                </div>
                <div class="option">
                  <a id="<?php echo $p->prod_id; ?>" data-toggle="tooltip" title="Masukkan ke keranjang !" class=" btn-addtocart"><i class="fa fa-shopping-cart"></i></a>
                </div>
              </div>
              <h6  style="max-width: 200px; overflow: hidden;  white-space: nowrap; text-overflow: ellipsis;"><a href="<?php echo base_url().'produk/'.$p->prod_id.'-'.create_slug($p->prod_name) ?>"><?php echo $p->prod_name; ?></a></h6>
              <div class="price">
                <div><?php echo "Rp.".number_format($p->prod_price).",-"; ?></div>

              </div>
              <div class="rating">
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star"></i>
                <i class="fa fa-star-half-o"></i>
                <a href="#">(5 reviews)</a>
              </div>

            </div><br/>

          </div>
					<?php
}
}else{

echo "<center>";
echo "<h4>Oppss ! Sepertinya produk tidak tersedia.</h4>";
echo "<a href='".base_url()."'>Kembali</a'>";
echo "</center>";

}
?>

<div class="col-xs-12 text-center">
           <nav aria-label="Page navigation">
             <ul class="pagination">
               <li class="disabled"><span>&laquo;</span></li>
               <li class="disabled"><span>&lsaquo;</span></li>
               <li class="active"><span>1</span></li>
               <li><a href="#">2</a></li>
               <li><a href="#">3</a></li>
               <li><a href="#">&rsaquo;</a></li>
               <li><a href="#">&raquo;</a></li>
             </ul>
           </nav>
         </div>




       <div class="row m-t-3">
         <div class="col-xs-12">
           <div class="title"><span>Komoditas Terbaik</span></div>
           <div class="">
             <?php
             $arr = array(12,9,4,3);
             for($a=0;$a<count($arr);$a++){
               $ww = array('prod_id' => $arr[$a]);
               $q = $this->m_dah->edit_data($ww,'dah_products')->result();
               foreach($q as $pop){
                 ?>

             <div class="col-xs-6 col-sm-4 col-lg-3 box-product-outer layang">
               <div class="box-product">
                 <div class="img-wrapper">
                   <a href="">
                     <?php if($pop->prod_img1!=""){
                     echo "<img alt='Product' src='".base_url().'dah_image/products/'.$pop->prod_img1."'>";
                   }else{
           echo "<img class='img-responsive' src='".base_url()."dah_image/default/no_product.jpg'>";
         }
         ?>
                   </a>

                   <div class="tags tags-left">
                     <span class="label-tags"><span class="label label-success arrowed-right">fresh</span></span>
                   </div>
                   <div class="option">
                     <a id="<?php echo $pop->prod_id; ?>" class="diki-tooltip btn-addtocart" data-toggle="tooltip" title="Masukan Keranjang"><i class="fa fa-shopping-cart"></i></a>

                   </div>
                 </div>
                 <h6><a href="<?php echo base_url().'produk/'.$pop->prod_id.'-'.create_slug($pop->prod_name) ?>"><?php echo $pop->prod_name; ?></a></h6>
                 <div class="price">
                   <div><?php echo "Rp.".number_format($pop->prod_price).",-"; ?></div>

                 </div>
                 <div class="rating">
                   <i class="fa fa-star"></i>
                   <i class="fa fa-star"></i>
                   <i class="fa fa-star"></i>
                   <i class="fa fa-star"></i>
                   <i class="fa fa-star-half-o"></i>
                   <a href="#">(5 reviews)</a>
                 </div>
               </div>
             </div>
             <?php
           }
         }
         ?>
           </div>
         </div>
       </div>




       <div class="row m-t-3">
         <div class="col-xs-12">
           <div class="title"><span>Komoditas Terpopuler</span></div>
           <div class="">
             <?php
             $arr = array(2,5,13,7);
             for($a=0;$a<count($arr);$a++){
               $ww = array('prod_id' => $arr[$a]);
               $q = $this->m_dah->edit_data($ww,'dah_products')->result();
               foreach($q as $pop){
                 ?>

             <div class="col-xs-6 col-sm-4 col-lg-3 box-product-outer layang">
               <div class="box-product">
                 <div class="img-wrapper">
                   <a href="">
                     <?php if($pop->prod_img1!=""){
                     echo "<img alt='Product' src='".base_url().'dah_image/products/'.$pop->prod_img1."'>";
                   }else{
           echo "<img class='img-responsive' src='".base_url()."dah_image/default/no_product.jpg'>";
         }
         ?>
                   </a>

                   <div class="tags tags-left">
                     <span class="label-tags"><span class="label label-success arrowed-right">fresh</span></span>
                   </div>
                   <div class="option">
                     <a id="<?php echo $pop->prod_id; ?>" class="diki-tooltip btn-addtocart" data-toggle="tooltip" title="Masukan Keranjang"><i class="fa fa-shopping-cart"></i></a>

                   </div>
                 </div>
                 <h6><a href="<?php echo base_url().'produk/'.$pop->prod_id.'-'.create_slug($pop->prod_name) ?>"><?php echo $pop->prod_name; ?></a></h6>
                 <div class="price">
                   <div><?php echo "Rp.".number_format($pop->prod_price).",-"; ?></div>

                 </div>
                 <div class="rating">
                   <i class="fa fa-star"></i>
                   <i class="fa fa-star"></i>
                   <i class="fa fa-star"></i>
                   <i class="fa fa-star"></i>
                   <i class="fa fa-star-half-o"></i>
                   <a href="#">(5 reviews)</a>
                 </div>
               </div>
             </div>
             <?php
           }
         }
         ?>
           </div>
         </div>
       </div>

          </div>
          <!-- End Featured -->


          <!-- Contact Info -->
              <div class="clearfix visible-sm visible-xs"></div>

              <div class="col-md-3" style="margin-bottom:10px">
                <div class="title"><span>Promo Iklan</span></div>
                                        <div class="col-xs-12 col-sm-12">
                                          <a class="layang" href="detail.html"><img style="width:100%!important;"src="<?php echo base_url();?>images/promo12.png" alt=""></a>

                                        </div>
              <div class="clearfix visible-sm visible-xs"></div>


                                        <div class="col-xs-12 col-sm-12"style="margin-top:7px">
                                          <a class="layang" href="detail.html"><img style="width:100%!important;"src="<?php echo base_url();?>images/promo2.png" alt=""></a>

                                        </div>
              </div>
  <div class="clearfix visible-sm visible-xs"></div>
          <div class="col-sm-3">
            <div class="title"><span>Kontak Kami</span></div>
            <ul class="list-group list-group-nav">
              <li class="list-group-item"><i class="fa fa-road"></i> Bukit Indah. Lhokseumawe</li>
              <li class="list-group-item"><i class="fa fa-phone-square"></i> +628236676551</li>
              <li class="list-group-item"><i class="fa fa-envelope"></i> fisbis@gmail.com</li>
            </ul>

            <!-- Location Map -->
            <div class="title"><span>Lokasi LapakNelayan</span></div>
            <div class="embed-responsive embed-responsive-4by3">
              <iframe class="embed-responsive-item" src="https://www.google.com/maps/d/embed?ll=5.169453000000009%2C97.13185399999998&spn=0%2C0&output=embed&hl=en&t=h&vpsrc=6&msa=0&ie=UTF8&mid=1BKFsRU4pe1fE8MWDCH62KjD1AZA&z=17"></iframe>
            </div>
            <!-- End Location Map -->

          </div>



        <div class="col-sm-3">


      </div>
          <!-- End Contact Info -->

          <!-- Collection -->
      </div>

      <!-- pagination -->


      <!-- end pagination -->

      <!-- Brand & Clients -->
      <!-- <div class="row">
        <div class="col-xs-12 m-t-1">
          <div class="title text-center"><span>Brand & Clients</span></div>
          <div class="brand-slider owl-carousel owl-theme owl-controls-top-offset">
            <div class="brand">
              <a href="#"><img src="images/demo/brand1.png" alt=""></a>
            </div>
            <div class="brand">
              <a href="#"><img src="images/demo/brand2.png" alt=""></a>
            </div>
            <div class="brand">
              <a href="#"><img src="images/demo/brand3.png" alt=""></a>
            </div>
            <div class="brand">
              <a href="#"><img src="images/demo/brand4.png" alt=""></a>
            </div>
            <div class="brand">
              <a href="#"><img src="images/demo/brand5.png" alt=""></a>
            </div>
            <div class="brand">
              <a href="#"><img src="images/demo/brand1.png" alt=""></a>
            </div>
            <div class="brand">
              <a href="#"><img src="images/demo/brand2.png" alt=""></a>
            </div>
            <div class="brand">
              <a href="#"><img src="images/demo/brand3.png" alt=""></a>
            </div>
            <div class="brand">
              <a href="#"><img src="images/demo/brand4.png" alt=""></a>
            </div>
            <div class="brand">
              <a href="#"><img src="images/demo/brand5.png" alt=""></a>
            </div>
          </div>
        </div>
      </div> -->
      <!-- End Brand & Clients -->

    </div>
    <!-- End Main Content -->
