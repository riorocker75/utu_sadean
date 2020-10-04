<div class="content">

	<!-- Dashboard content -->
	<div class="row">
		<?php show_alert(); ?>
		<div class="col-md-12">		
			<div class="alert alert-info">
				This template's menu use "menu-satu" and "menu-dua"
			</div>
			<div class="panel panel-flat">
				<div class="panel-heading">
					<header>Add New Menu</header>
				</div>		
				<div class="panel-body">							
					<form action="<?php echo base_url().'admin/menu_act' ?>" method="post">
						<div class="form-group">
							<input type="text" name="menu" class="form-control">				
							<?php echo form_error('menu', '<div class="form-error">', '</div>'); ?>
						</div>
						<div class="form-group">
							<input type="submit" name="" class="btn btn-sm btn-primary" value="Save">
						</div>
					</form>
				</div>	
			</div>		
		</div>

		<div class="row">
			<div class="col-md-12">
				<?php 
				foreach($mother as $mo){
					?>
					<div class="panel panel-flat">
						<div class="panel-heading">
							<header><?php echo $mo->menu_mother ?></header>
						</div>		
						<div class="panel-menu panel-body">
							<div class="row">
								<div class="col-md-4">
									<form action="<?php echo base_url().'admin/menu_item_act' ?>" method="post">
										<div class="form-group">
											<label>Menu Item Name</label>
											<input type="hidden" name="menu_item_mother" value="<?php echo $mo->menu_mother ?>">
											<input type="text" name="menu_item_name" placeholder="Menu Item Name" class="form-control">
											<?php echo form_error('menu_item_name', '<div class="form-error">', '</div>'); ?>
										</div>		

										<div class="form-group">
											<label>Menu Item Parent</label>
											<select type="text" name="menu_item_parent" placeholder="Menu Item Name" class="form-control">
												<option value=""> - Select Menu Item Parent - </option>
												<option value="0"> No Parent </option>
												<?php 						
												$menu_item = $this->m_dah->get_all_menu_item($mo->menu_mother)->result();
												foreach($menu_item as $mi){
													?>
													<option value="<?php echo $mi->menu_id ?>"><?php echo $mi->menu_name ?></option>
													<?php 
												}
												?>
											</select>
											<small>Leave blank if doesn't use page URL</small>
										</div>		

										<div class="form-group">
											<label>Menu Item URL <small> Use only one option</small></label>
											<select type="text" name="menu_item_url_page" placeholder="Menu Item Name" class="form-control">
												<option value=""> - Select Menu URL from page - </option>
												<?php 
												foreach($page as $p){
													?>
													<option value="<?php echo base_url()."page/".$p->page_url ?>"><?php echo $p->page_tittle ?></option>
													<?php 
												}
												?>
											</select>
											<small>Leave blank if doesn't use page URL</small>
										</div>

										<div class="form-group">			
											<select type="text" name="menu_item_url_category" placeholder="Menu Item Name" class="form-control">
												<option value=""> - Select Menu URL from category - </option>
												<?php 
												foreach($category as $c){
													?>
													<option value="<?php echo base_url()."category/".$c->category_url ?>"><?php echo $c->category_name ?></option>
													<?php 
												}
												?>
											</select>
											<small>Leave blank if doesn't use category URL</small>
										</div>

										<div class="form-group">			
											<input type="text" name="menu_item_url_manual" placeholder="Insert Menu Item URL Menual" class="form-control">
										</div>

										<div class="form-group">
											<input type="submit" value="Save" class="btn btn-sm btn-primary">	
											<a href="<?php echo base_url().'admin/menu_delete/'.$mo->menu_mother ?>" class="btn btn-sm btn-danger">Delete</a>							
										</div>
									</form>
								</div>	

								<div class="col-md-8">			
									<ul class="setting-menu sort-menu" id="<?php echo $mo->menu_mother ?>" parent="0">
										<!-- <li class='list-menu-kosong'></li> -->
										<?php 
										$menu_item = $this->m_dah->get_menu_item($mo->menu_mother)->result();
										foreach($menu_item as $mi){
											?>
											<li id="menu_<?php echo $mi->menu_id ?>" ini="<?php echo $mi->menu_id ?>">	
												<div>						
													<?php echo $mi->menu_name ?> <small> <?php echo $mi->menu_url ?></small>
													<a class="pull-right" href="<?php echo base_url().'admin/menu_item_delete/'.$mi->menu_id ?>"> Delete </a>
													<a class="pull-right" href="<?php echo base_url().'admin/menu_item_edit/'.$mi->menu_id?>"> Edit </a>
												</div>					
												<?php display_sub($mi->menu_id,$mi->menu_mother); ?>											
											</li>
											<?php 
										}
										?>
									</ul>			
								</div>	

								<div class="tampil-loader"></div>
							</div>
						</div>	
					</div>

					<?php 
				}
				?>
			</div>
		</div>


	</div>

	<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
