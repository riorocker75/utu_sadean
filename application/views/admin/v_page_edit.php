<div class="content">


	<?php show_alert(); ?>
	<?php echo form_open_multipart('admin/page_update');?>	
	<?php 
	foreach($page as $p){
		?>
		<div class="row">
			<div class="col-md-9">							
				<?php echo validation_errors(); ?>							
				<div class="form-group">					
					<input type="hidden" name="id" value="<?php echo $p->page_id ?>">
					<input type="text" name="page_tittle" class="form-control" placeholder="Page Tittle" value="<?php echo $p->page_tittle ?>">
				</div>			
				<div class="form-group">					
					<textarea name="page_content" class="ckeditor form-control"><?php echo $p->page_content ?></textarea>
				</div>												
			</div>


			<div class="col-md-3">		
				<div class="panel">
					<div class="panel-heading">
						<header>Page's Image Cover</header>
					</div>			
					<div class="panel-body">					
						<div class="tampil-image-cover">
							<?php if($p->page_cover != ""){ ?>
							<img class='gambar-cover-sementara' src='<?php echo base_url().'dah_image/page/'.$p->page_cover ?>'>						
							<a id="<?php echo $p->page_id ?>" class="hapus-cover-image">Hapus Gambar Cover</a>											
							<?php }else{ ?>
							<input type="file" name="page_cover" class="btn-image-cover">
							<?php } ?>
							<a class="btn-hapus-cover">Hapus Gambar Cover</a>
						</div>						
					</div>				
				</div>

				<div class="panel">
					<div class="panel-heading">
						<header>Publish</header>
					</div>			
					<div class="panel-body">												
						<input type="submit" name="save" value="publish" class="btn btn-sm btn-primary">
						<input type="submit" name="save" value="draft" class="btn btn-sm btn-default">
					</div>				
				</div>
			</div>
		</div>
		<?php } ?>
	</form>

	<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
