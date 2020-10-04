<!-- breadrumb section -->
<section class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-line">
            <ul>
				<li><a href="<?php echo base_url()?>">Home</a> </li>
                <li><a href="">Kategori</a> </li>
				
                <li><a href=""><?php echo $kategori_produk; ?></a> </li>
            </ul>
        </div>
    </div>

</section>

<!-- end breadcrumb -->

<!-- product-gird -->
	<?php 			
		if(count($products) > 0){
	
	?>
<section class="product-gird">
    <div class="container">
        <div class="row" >
            <!-- sidebar product-gird -->
            <?php include "sidebar_shop.php"?>
            <!-- end sidebar -->

			<!-- product-main-gird -->
            <div class="col-lg-9 col-md-7 col-sm-12 col-12">
				<div class="row">
					<?php foreach($products as $p){?>
                    <div class="col-lg-3 col-md-6 col-sm-6 col-6">
                        <div class="product-main-gird">

                            <div class="product-mg-img">
								<a href="<?php echo base_url().'produk/'.$p->prod_id.'-'.create_slug($p->prod_name) ?>">
							<?php if($p->prod_img1!=""){ 
									echo "<img src='".base_url().'dah_image/products/'.$p->prod_img1."'>";
								}else{ 
									echo "<img src='".base_url()."dah_image/default/no_product.jpg'>";
								}
								?>
								</a>
                            </div>

                            <div class="product-mg-title">
								<a href="<?php echo base_url().'produk/'.$p->prod_id.'-'.create_slug($p->prod_name) ?>">
								<?php 
									echo substr(strip_tags($p->prod_name),0,48)
								?>
								</a>
                            </div>

                            <div class="product-mg-sell">
								<div class="product-mg-price">
									<p>Rp.<?php echo number_format($p->prod_price)?></p>
								</div>

								<div class="product-mg-rating">
									<p>
										<i class="fa fa-star"></i>
										<span style="color:#000;opacity:0.5">4.5</span>
									</p>
									
								</div>

							</div>
							
							<div class="product-mg-stats">
                                   <a id="<?php echo $p->prod_id; ?>" class="keranjang-dulu-ind" title="tambah ke keranjang">Keranjang</a>
							</div>
                        </div>

                    </div>
					<?php }?>
                </div>

            </div>
            <!-- end product-gird -->
		

        </div>
    </div>
</section>

	<?php }else{?>
		<div class="container center">
        <section class="product-gird">
            <div class="container">
                <div class="row" >
            <!-- sidebar product-gird -->
            <?php include "sidebar_shop.php"?>
            <!-- end sidebar -->
                <div class="col-lg-9 col-md-7 col-sm-12 col-12">
                    <div class="not-avail d-flex justify-content-center">
                        <img src="<?php echo base_url()?>dah_image/system/unhappy.png">
                       
                    </div>
                    <div style="text-align:center;margin-top:20px">
                    <p class="tx-20 red-text">Oopps !!</p>

                    <p class="tx-20 red-text">Product di Kategori <b><?php echo $kategori_produk; ?></b> Belum Tersedia</p>
                    </div>
               
                </div>
            </div>
            </div>
        </section>
        </div>
        
	<?php }?>

<!-- end product-gird -->