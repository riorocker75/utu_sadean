<!-- breadrumb section -->
<section class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-line">
            <ul>
                <li><a href="<?php echo base_url()?>">Home</a> </li>
               <li><a href="">Detail Produk</a></li>
               <?php foreach($product as $ps){ ?>
               <li><a href=""><?php echo $ps->prod_name?></a></li>
               <?php } ?>

               
            </ul>
        </div>
    </div>

</section>

<!-- end breadcrumb -->
<?php
			if(count($product) > 0){
				foreach($product as $p){
	?>
<!-- product-single -->

<section class="product-single" ng-app="">
    <div class="container">
   
            <div class="product-single-container ">
                <!-- detail produxt -->
                
                    <div class="cs-row-aja">
                        <div class="row">
                            <!-- img sinlge produxt -->
                            <div class="col-lg-5 col-md-12 col-sm-12 col-12" style="background: #fff;">
                                    <div class="single-img">
                                        <?php
                                            if($p->prod_img1 != ""){
                                            echo "<img alt='".$p->prod_name."' src='".base_url().'dah_image/products/'.$p->prod_img1."' > ";
                                            }else{

                                            echo "<img alt='".$p->prod_name."' src='".base_url()."dah_image/default/no_product.jpg'>";
                                            }
                                        ?>
                                    </div> 
                            </div>
                            <!-- end img single product -->
                            <!-- detail product -->
                            <div class="col-lg-7 col-md-12 col-sm-12" style="background: #fff;padding-top:6px;">
                                
                                     <div class="product-single-title" style="margin-left:15px">

                                        <h1><?php echo ucfirst($p->prod_name); ?> </h1>
                                    </div>

                                    <div class="product-single-price">
                                    <h2 ><?php echo "Rp".number_format($p->prod_price); ?></h2>
                                    <span>Tersedia >&nbsp;<?php echo $p->prod_qty ?> </span>
                                    <p> <span>Berat : <?php echo $p->prod_berat ?> gram</span></p>
                                    <p ng-init="harga='<?php echo $p->prod_price?>'" ></p>

                                    <p class="tx-12" style="opacity:0.7;margin-top:-10px">Masukan jumlah yang ingin di beli</p>         
                                    <div class="col-lg-4 col-md-4 col-sm-12" style="margin-top:-10px;margin-left:-15px;">
                                    <input class="input-spinner" type="number" min="1" name="jumlah_produk" value="1" max="90" ng-model="stock" />
                                    <input type="hidden" name="rowid[]" value="<?php echo $item['rowid'] ?>">
                                    </div>
                                    <input type="hidden" id="jumlah_produk" value="{{ (stock  * 1) || (1)}}">
                                    <input type="hidden" id="stock_hasil" value="{{ (harga * stock) || (harga * 1) }}">
                                    <input type="hidden" name="stock_hasil" value="{{ (harga * stock) || (harga * 1) }}"> 
                                    <br>
                                    <p>Total: Rp&nbsp;{{ (harga * stock) || (harga * 1) | number}}</p>  

                                    </div>

                                    <div class="single-seller">
                                    <div class="row">

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                        </div>
                                    
                                    </div>
                                    </div>
                                    <br>

                                    <div class="product-single-act ">

                                    <div class="row">
                                        <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                            <a id="<?php echo $p->prod_id; ?>" class="btn-bordered-md-fullwidth bor-default-full  tx-16 keranjang-dulu" style="cursor:pointer">Masukan Keranjang</a>
                                        </div>

                                        <div class="col-lg-6 col-md-6 col-sm-12 col-12">
                                            <a id="<?php echo $p->prod_id; ?>" class="btn-bordered-md-fullwidth bor-core-full tx-16 btn-bayarlangsung" style="cursor:pointer">Beli Sekarang</a>
                                        </div>
                                    </div>
                                    </div>              
                            </div>
                            <!-- end detail -->
                        </div>    
                    </div>
                
       <!-- product information -->
       <div>
       <nav style="background: #fff;">
          <div class="nav nav-tabs nav-tab-custom" id="nav-tab" role="tablist">
            <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Detail</a>
            <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">Estimasi Ongkir</a>
            <a class="nav-item nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">Ulasan</a>
          </div>
        </nav>
        <div class="tab-content tab-custom " id="nav-tabContent"  style="background: #fff;">
          <div class="tab-pane fade show active product-single-detail" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
          <?php echo $p->prod_desc;?>
          </div>
          <!-- end deskripsi -->

          <!-- ongkir -->
          <div class="tab-pane fade product-single-detail" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                <label>Provinsi</label>
                                <?php
                                $province_ori = json_decode(GetProv(), TRUE);
                                echo "<select name='prov_origin' required class='form-control form-control-sm form-provinsi2' id='prov_origin'>";
                                echo "<option value=''>Pilih Provinsi ..</option>";
                                for ($i=1; $i < count($province_ori['rajaongkir']['results']); $i++) {
                                    echo "<option value='".$province_ori['rajaongkir']['results'][$i]['province_id']."' class='jne tiki pos all' >".$province_ori['rajaongkir']['results'][$i]['province']."</option>";
                                }
                                echo "</select>";
                                ?>
                                <?php echo "<span class='text-warning'>".form_error('prov_origin')."</span>"; ?>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Kota</label>
                                    <?php
                                    echo "<select name='city_origin' required class='form-control form-control-sm form-kota2' id='prov_origin'>";
                                    echo "<option value=''>Pilih provinsi terlebih dulu</option>";
                                    echo "</select>";
                                    ?>
                                    <?php echo "<span class='text-warning'>".form_error('city_origin')."</span>"; ?>
                                </div>
                            </div>
                        </div>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="table-responsive">
                                                <?php echo "<span class='text-warning'>".form_error('kurir')."</span>"; ?>
                                                <div class="tempat-cost"></div>

                                            </div>
                                        </div>
                                    </div>
              
          </div>

          <!-- end ongkir -->

          <!-- ulasan product -->
          <div class="tab-pane fade product-single-detail" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
                
                  <form action="" method="post">                     
                        <div class="ulasan-produk">
                              
                        <div class="col-lg-6 col-md-12 col-12 yellow-text text-darken-3" style="margin-bottom:10px;">
                                
                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" name="rating" value="5">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </label>
                            </div>

                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" name="rating" value="4">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </label>
                            </div>

                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" name="rating" value="3">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                </label>
                            </div>

                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" name="rating" value="2">
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>    
                                </label>
                            </div>

                            <div class="form-check">
                                <label class="form-check-label">
                                    <input type="radio" class="form-check-input" name="rating" value="1">
                                    <i class="fa fa-star"></i>
                               
                                </label>
                            </div>
                                     
                        </div>

                            <div class="col-lg-6 col-md-12 col-sm-12 col-12">
                                <div class="input-group ">
                                    <textarea class="form-control" name="rating-komen" aria-label="With textarea" placeholder="Isi ulasan disini"></textarea>
                                </div>    
                                <button class="btn btn-primary" style="margin-top:15px;" type="submit">Kirim Ulasan</button>       
                            </div>
                               

                        </div>
                                               
                 </form>   
          </div>

          <!-- end ulasan product -->
        </div>
      </div>
  <!-- end product info -->
 
  
  <!-- product suggest -->
        <div class="product-suggest">
            <div class="product-s-title"  style="background: #fff;">
                <h1>Banyak dicari</h1>
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
          <div class="prod-ind prod-reco-1" id="prod-ind-jq">
            <?php
                    $arr = array(68,65,71,72,69,70,66);
                    for($a=0;$a<count($arr);$a++){
                    $ww = array('prod_id' => $arr[$a]);
                    $q = $this->m_dah->edit_data($ww,'dah_products')->result();
                    
                ?>                 
                <?php 	foreach($q as $pop){?>
                  <div class="prod-index" >
             
             <!-- image -->
             <div class="prod-img">
               <a href="<?php echo base_url().'produk/'.$pop->prod_id.'-'.create_slug($pop->prod_name) ?>">
                   <?php if($pop->prod_img1!=""){
                       echo"<img alt='Product' src='".base_url().'dah_image/products/'.$pop->prod_img1."'>";
                       }else{
                         echo"<img alt='Product' src='".base_url()."dah_image/default/no_product.jpg'>";
                       }
                       ?>
               </a>
             </div>

             <!-- end image -->
             <!-- judul -->
            
               <div class="prod-title">
                   <a href="<?php echo base_url().'produk/'.$pop->prod_id.'-'.create_slug($pop->prod_name) ?>">
                     <?php 
                         echo substr(strip_tags($pop->prod_name),0,70);
                     ?> 
                   </a>         
               </div>
         
             <!-- end judul -->
            <a href="<?php echo base_url().'produk/'.$pop->prod_id.'-'.create_slug($pop->prod_name) ?>">
               <!-- harga & add to cart -->
               <div class="prod-price">
                 Rp. <?php echo number_format($pop->prod_price) ?>
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
                
                <?php }} ?> 
            
          </div>

        </div>
  </div>
            
        </div>
  <!-- end product suggest -->
</div>

<!-- end detail product -->

<!-- sidebar single product -->

<!-- end single sidebar product -->
</div>
<!-- d-none d-sm-block d-md-none -->
   
</section>

<?php }?>
    <?php }else{?> Product Belum ada <?php }?>

<!-- end product-single -->