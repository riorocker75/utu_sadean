<div class="content">

	<!-- Dashboard content -->
	<div class="row">
		<?php show_alert(); ?>
		
		<?php 
		foreach($edit as $mo){
			?>
			<div class="col-md-4">		
				<div class="panel panel-flat">
					<div class="panel-heading">
						<header>Edit Item Menu</header>
					</div>		
					<div class="panel-body">					
						<form action="<?php echo base_url().'admin/menu_item_update' ?>" method="post">			
							<div class="form-group">
								<label>Menu Item Name</label>
								<input type="hidden" name="id" value="<?php echo $mo->menu_id ?>">
								<input type="text" name="menu_item_name" placeholder="Menu Item Name" class="form-control" value="<?php echo $mo->menu_name ?>">
								<?php echo form_error('menu_item_name', '<div class="form-error">', '</div>'); ?>
							</div>											
							<div class="form-group">
								<label>Menu URL</label>			
								<input type="text" name="menu_item_url_manual" placeholder="Insert Menu Item URL Menual" class="form-control" value="<?php echo $mo->menu_url ?>">
								<?php echo form_error('menu_item_url_manual', '<div class="form-error">', '</div>'); ?>
							</div>
							<div class="form-group">
								<input type="submit" value="Save" class="btn btn-sm btn-primary">						
							</div>
						</form>						
					</div>	
				</div>
			</div>
			<?php 
		} 
		?>
	</div>

	<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
