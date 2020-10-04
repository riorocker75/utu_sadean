<div class="content">
	
	<?php show_alert(); ?>
	<div class="panel">
		<div class="panel-heading">
			All Settings
		</div>			
		<div class="panel-body">			
			<?php echo form_open_multipart('admin/settings_act');?>	
			<div class="table-responsive">
				<table class="table">
					<tr>
						<th>Blog Name</th>			
						<td><input type="text" name="blog_name" class="form-control" value="<?php echo $this->m_dah->get_option('blog_name'); ?>"></td>
					</tr>
					<tr>
						<th>Blog Description</th>			
						<td><textarea name="blog_description" class="form-control"><?php echo $this->m_dah->get_option('blog_description'); ?></textarea></td>
					</tr>
					<tr>
						<th>Blog Logo</th>			
						<td>
							<?php 
							if(isset($error)){
								echo $error;
							}
							?>
							<input type="file" name="blog_logo">
							<small>Leave blank if doesn't change</small>
						</td>
					</tr>
					<tr>
						<th><input type="submit" value="Save Settings" class="btn-sm btn-primary btn"></th>
						<td></td>			
					</tr>
				</table>
			</div>			
		</form>			
	</div>
	
</div>

<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
