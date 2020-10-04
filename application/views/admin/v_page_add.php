<div class="content">

	<!-- Dashboard content -->		
	<?php show_alert(); ?>
	<?php echo form_open_multipart('admin/page_add_act');?>	
	<div class="row">
		<div class="col-md-9">							
			<?php echo validation_errors(); ?>

			<div class="form-group">					
				<input type="text" name="page_tittle" class="form-control" placeholder="Page Tittle">
			</div>			
			<div class="form-group">					
				<textarea name="page_content" class="ckeditor form-control"></textarea>
			</div>						

		</div>

		<div class="col-md-3">		
			<div class="panel">
				<div class="panel-heading">
					<header>Page's Image Cover</header>
				</div>			
				<div class="panel-body">	
					<div class="tampil-image-cover"></div>						
					<a class="btn-hapus-cover">Hapus Gambar Cover</a>		
					<input type="file" name="page_cover" class="btn-image-cover">
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
</form>

<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
