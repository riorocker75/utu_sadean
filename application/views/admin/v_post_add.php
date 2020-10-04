<div class="content">

	<?php show_alert(); ?>
	<?php echo form_open_multipart('admin/post_add_act');?>	
	<div class="row">
		<div class="col-md-9">			
			<?php echo validation_errors(); ?>			
			<div class="form-group">					
				<input type="text" name="post_tittle" class="form-control" placeholder="Post Tittle">
			</div>			
			<div class="form-group">					
				<textarea name="post_content" class="ckeditor form-control"></textarea>					
			</div>						
		</div>

		<div class="col-md-3">	
			<div class="panel">
				<div class="panel-heading">
					<header>Post Category</header>
				</div>			
				<div class="panel-body">	
					<?php 
					foreach($category as $c){
						?>
						<input type="checkbox" name="post_cat[]" value="<?php echo $c->category_id ?>"> <?php echo $c->category_name; ?><br/>
						<?php						
					}
					?>				
				</div>				
			</div>

			<div class="panel">
				<div class="panel-heading">
					<header>Post Image Cover</header>
				</div>			
				<div class="panel-body">	
					<div class="tampil-image-cover"></div>						
					<a class="btn-hapus-cover">Hapus Gambar Cover</a>		
					<input type="file" name="post_cover" class="btn-image-cover">
				</div>				
			</div>

			<div class="panel">
				<div class="panel-heading">
					<header>Publish</header>
				</div>			
				<div class="panel-body">												
					<input type="submit" name="save" value="Publish" class="btn btn-sm btn-primary">
					<input type="submit" name="save" value="Draft" class="btn btn-sm btn-default">
				</div>				
			</div>
		</div>
	</div>
</form>

	<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
