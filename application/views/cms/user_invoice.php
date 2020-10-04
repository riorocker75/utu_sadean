<!-- breadrumb section -->
<section class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-line">
            <ul>
                <li><a href="<?php echo base_url()?>">Laman Depan</a> </li>
                <li><a href="">Pesanan</a> </li>
            </ul>
        </div>
    </div>

</section>

<!-- end breadcrumb -->

<section class="user-profile">

      <div class="container">
          <div class="row">
              <div class="col-lg-3 d-lg-block d-md-none d-none">
                <?php include"user_sidebar.php";?>
			  </div>
			  
			
              <div class="col-lg-9 col-md-12 col-12">
				<?php if($this->m_dah->edit_data(array('user_id' => $this->session->userdata('user_id')),'invoice')->num_rows()>0){ ?>
				  <?php foreach($invoice as $p){ ?>	

			  	<div class="user-sb-main">
                      <div class="order-title">
					 <a href="<?php echo base_url().'user/invoice_detail/'.$p->id ?>"><?php echo $p->no; ?></a>
						  <span class="float-right">
						  <?php
								if($p->status == 0){
									echo "<span class='labil-o'>Menunggu pembayaran</span>";
								}else if($p->status == 1){
									echo "<span class='labil-o'>Menunggu konfirmasi</span>";
								}else if($p->status == 2){
									echo "<span class='labil-o'>Di tolak</span>";
								}else if($p->status == 3){
									echo "<span class='labil-o'>Di proses</span>";
								}else if($p->status == 4){
									echo "<span class='labil-o'>Di bayar</span>";
								}
								?>
						  </span>
						</div>
						<!-- <?php if($p->status == 4){echo "active";}else{}?> -->
						<?php if($p->status > 0){?>
						<div class="body-progres">
							<ul class="progress-order">
								<li class="<?php if($p->status == 4){echo "active";}else{}?>"><span class="tx-12">Pembayaran Berhasil</span></li>
								<li class="<?php if($p->status == 3){echo "active";}else{}?>"><span class="tx-12">Barang Dikirim</span> </li>
								<li class="<?php if($p->status == 5){echo "active";}else{}?>"><span class="tx-12">Selesai</span> </li>

							</ul>
						</div>
						<?php }else{}?>
			 		 	<div class="user-sb-main-body">
							  <?php
									 $barang=$this->db->query("select * from dah_products,orders where dah_products.prod_id=orders.order_produk and orders.order_invoice='$p->id'")->result(); 
									 $subtotal = $this->db->query("select * from orders where orders.order_invoice='$p->id'")->result();
									 $sub = "";
									 foreach($subtotal as $s){
										 $sub += $s->order_harga * $s->order_jumlah;
									 }
							  ?>
							<?php foreach($barang as $b){?>
								<div class="ket-cart-body">
										<div class="ket-cb-img">
												<?php 
												if($b->prod_img1 != ""){
													echo"<img src='".base_url().'dah_image/products/'.$b->prod_img1."' alt='product'>";
												}else{
													echo "<img src='".base_url()."dah_image/default/no_product.jpg' alt='product'>";
												}
											?>

											<div class="ket-cb-nama">
												<a href="<?php echo base_url().'produk/'.$b->prod_id.'-'.create_slug($b->prod_name) ?>" class="tx-14"><?php echo substr(strip_tags($b->prod_name),0,55) ?></a>
												<p class="tx-14 tx-bold-600"><?php echo number_format($b->prod_price)?> 
													<span class="tx-bold-400" style="color:rgb(119, 121, 140);">x <?php echo $b->order_jumlah ?></span>
													<?php
														$total_peritem=$b->prod_price * $b->order_jumlah; 
													?>
													<span class="float-right" style="color:rgb(119, 121, 140);">Rp.<?php echo number_format($total_peritem)?></span>
												</p>
												</div>
										</div>	
										
												
								</div>
							<?php }?>		
							<div class="order-footer">
								<span class="float-right">Total:  <b class="tx-22 core-co">Rp.<?php echo number_format($sub)?></b></span>
								<br>
							</div>


						</div>
				
					</div>
					<!-- end user-sb-main -->
				  <?php } ?>	
              </div>
			  <?php }else{ ?>
				<p class="text-muted text-center">Anda belum belanja apapun. segeralah belanja</p>
			  <?php } ?>				
          </div>

  </div>

</section>