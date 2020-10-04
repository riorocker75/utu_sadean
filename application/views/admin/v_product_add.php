<div class="content">
	<?php show_alert(); ?>
	<?php echo form_open_multipart('admin/product_add_act');?>	
	<div class="row">
		<div class="col-md-9">			
			<?php echo validation_errors(); ?>
			
			<div class="form-group">					
				<input type="text" name="nama" class="form-control" placeholder="Post Tittle">
			</div>			
			<div class="form-group">					
				<textarea name="deskripsi" class="ckeditor form-control"></textarea>
			</div>						
			
			<div class="panel">
				<div class="panel-heading">
					<header>Product Image</header>
				</div>			
				<div class="panel-body">	
					<div class="tampil-image-cover-product"></div>	
					<b>Gambar 1 (Gambar Utama)</b>
					<input type="file" accept="image/*" name="gambar[]">			
					<b>Gambar 2</b>
					<input type="file" accept="image/*" name="gambar[]">		
					<b>Gambar 3</b>
					<input type="file" accept="image/*" name="gambar[]">			
					<b>Gambar 4</b>
					<input type="file" accept="image/*" name="gambar[]">															
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
					<input name="bukalapak" class="form-control">

					<b>Tokopedia</b>
					<input name="tokopedia" class="form-control">
				</div>				
			</div>	

			<div class="panel">
				<div class="panel-heading">
					<header>Berat (gram)</header>
				</div>			
				<div class="panel-body">	
					<input name="berat" class="form-control">
				</div>				
			</div>

			<div class="panel">
				<div class="panel-heading">
					<header>Harga (Rp.)</header>
				</div>			
				<div class="panel-body">	
					<input name="harga" class="form-control">
				</div>				
			</div>

			<div class="panel">
				<div class="panel-heading">
					<header>Jumlah Produk</header>
				</div>			
				<div class="panel-body">	
					<input name="jumlah" class="form-control">
				</div>				
			</div>

			<div class="panel">
				<div class="panel-heading">
					<header>Lokasi</header>
				</div>			
				<div class="panel-body">	
					<input name="lokasi" class="form-control">
				</div>				
			</div>


			<div class="panel">
				<div class="panel-heading">
					<header>Proses Kirim</header>
				</div>			
				<div class="panel-body">	
					<input name="proses_kirim" class="form-control">
				</div>				
			</div>

			<div class="panel">
				<div class="panel-heading">
					<header>Jasa Pengiriman</header>
				</div>			
				<div class="panel-body">	
					<input name="jasa_kirim" class="form-control">
				</div>				
			</div>




			<div class="panel">
				<div class="panel-heading">
					<header>Kategori Produk</header>
				</div>			
				<div class="panel-body">					
					<?php 				
					foreach($category as $c){ 
						?>
						<input value="<?php echo $c->pcat_id; ?>" type="checkbox" name="cat_pro[]"> <?php echo $c->pcat_name; ?><br/>
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

<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
