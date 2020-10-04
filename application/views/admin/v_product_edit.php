<div class="content">
	
	<?php show_alert(); ?>
	<?php foreach($products as $p){ ?>
	<?php echo form_open_multipart('admin/product_update');?>	
	<div class="row">
		<div class="col-md-9 box-posting">			
			<?php echo validation_errors(); ?>

			<div class="form-group">					
				<input type="hidden" name="id" value="<?php echo $p->prod_id ?>">
				<input type="text" name="nama" class="form-control" placeholder="Post Tittle" value="<?php echo $p->prod_name ?>">
			</div>			
			<div class="form-group">					
				<textarea name="deskripsi" class="ckeditor form-control"><?php echo $p->prod_desc ?></textarea>
			</div>						
			

			<div class="panel">
				<div class="panel-heading">
					<header>Product Image</header>
				</div>			
				<div class="panel-body">	
					<div class="row">					

						<div class="col-md-3">		
							<b>Gambar 1</b>			
							<?php if($p->prod_img1!=""){ ?>
							<img class="col-md-12" src="<?php echo base_url().'dah_image/products/'.$p->prod_img1 ?>">					
							<a href="<?php echo base_url().'admin/product_hapus_gambar/'.$p->prod_id.'/1'; ?>">Hapus gambar</a>
							<?php }else{ ?>
							<input type="file" accept="image/*" name="gambar1">			
							<?php } ?>
						</div>

						<div class="col-md-3">		
							<b>Gambar 2</b>			
							<?php if($p->prod_img2!=""){ ?>
							<img class="col-md-12" src="<?php echo base_url().'dah_image/products/'.$p->prod_img2 ?>">					
							<a href="<?php echo base_url().'admin/product_hapus_gambar/'.$p->prod_id.'/2'; ?>">Hapus gambar</a>
							<?php }else{ ?>
							<input type="file" accept="image/*" name="gambar2">			
							<?php } ?>
						</div>


						<div class="col-md-3">		
							<b>Gambar 3</b>			
							<?php if($p->prod_img3!=""){ ?>
							<img class="col-md-12" src="<?php echo base_url().'dah_image/products/'.$p->prod_img3 ?>">					
							<a href="<?php echo base_url().'admin/product_hapus_gambar/'.$p->prod_id.'/3'; ?>">Hapus gambar</a>
							<?php }else{ ?>
							<input type="file" accept="image/*" name="gambar3">			
							<?php } ?>
						</div>


						<div class="col-md-3">		
							<b>Gambar 4</b>			
							<?php if($p->prod_img4!=""){ ?>
							<img class="col-md-12" src="<?php echo base_url().'dah_image/products/'.$p->prod_img4 ?>">					
							<a href="<?php echo base_url().'admin/product_hapus_gambar/'.$p->prod_id.'/4'; ?>">Hapus gambar</a>
							<?php }else{ ?>
							<input type="file" accept="image/*" name="gambar4">			
							<?php } ?>
						</div>
					</div>												
				</div>				
			</div>

		</div>

		<div class="col-md-3">	
			<div class="panel">
				<div class="panel-heading">
					<header>Link Beli</header>
				</div>			
				<div class="panel-body">	
					<b>BukaLapak</b>
					<input name="bukalapak" class="form-control" value="<?php echo $p->prod_bukalapak ?>">

					<b>Tokopedia</b>
					<input name="tokopedia" class="form-control" value="<?php echo $p->prod_tokopedia ?>">
				</div>				
			</div>	

			<div class="panel">
				<div class="panel-heading">
					<header>Harga (Rp.)</header>
				</div>			
				<div class="panel-body">	
					<input name="harga" class="form-control" value="<?php echo $p->prod_price ?>">
				</div>				
			</div>

			<div class="panel">
				<div class="panel-heading">
					<header>Berat (gram)</header>
				</div>			
				<div class="panel-body">	
					<input name="berat" class="form-control" value="<?php echo $p->prod_berat ?>">
				</div>				
			</div>

			<div class="panel">
				<div class="panel-heading">
					<header>Jumlah Produk</header>
				</div>			
				<div class="panel-body">	
					<input name="jumlah" class="form-control" value="<?php echo $p->prod_qty ?>">
				</div>				
			</div>

			<div class="panel">
				<div class="panel-heading">
					<header>Lokasi</header>
				</div>			
				<div class="panel-body">	
					<input name="lokasi" class="form-control" value="<?php echo $p->prod_lokasi ?>">
				</div>				
			</div>


			<div class="panel">
				<div class="panel-heading">
					<header>Proses Kirim</header>
				</div>			
				<div class="panel-body">	
					<input name="proses_kirim" class="form-control" value="<?php echo $p->prod_kirim ?>">
				</div>				
			</div>

			<div class="panel">
				<div class="panel-heading">
					<header>Jasa Pengiriman</header>
				</div>			
				<div class="panel-body">	
					<input name="jasa_kirim" class="form-control" value="<?php echo $p->prod_jasa_kirim ?>">
				</div>				
			</div>


			<div class="panel">
				<div class="panel-heading">
					<header>Kategori Produk</header>
				</div>			
				<div class="panel-body">									
					<?php 
					foreach($category as $c){
						$wt = array(
							'taxonomy' => 'product_category',
							'taxonomy_child' => $c->pcat_id,
							'taxonomy_parent' => $p->prod_id
							);
						$cek_tax = $this->m_dah->edit_data($wt,'dah_taxonomy')->num_rows();
						?>
						<input <?php if($cek_tax > 0){echo "checked='checked'";} ?> value="<?php echo $c->pcat_id; ?>" type="checkbox" name="cat_pro[]"> <?php echo $c->pcat_name; ?><br/>
						<?php 
						sub_catpro_form($c->pcat_id);
					} 
					?>												
				</div>				
			</div>			

			<div class="panel">
				<div class="panel-heading">
					<header>Publish</header>
				</div>			
				<div class="panel-body">												
					<input type="submit" name="save" value="Publish" class="btn btn-sm btn-primary">				
				</div>				
			</div>
		</div>
	</div>
</form>
<?php } ?>

<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
