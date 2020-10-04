<div class="content">
	<?php show_alert(); ?>


	<div class="row">	
		<div class="panel col-md-10 col-md-offset-1">					
			<div class="col-md-12 template">						
				<div class="col-md-12 menu">
					<center>Menu Navigation (menu-satu)</center>
					<select class="update-option" id="show_menu_satu">
						<option <?php if(get_option('show_menu_satu') == "1"){echo "selected='selected'";} ?> value="1">Active</option>
						<option <?php if(get_option('show_menu_satu') == "0"){echo "selected='selected'";} ?> value="0">Non-Active</option>
					</select>
					<div class="lokasi"></div>
				</div>

				<div class="col-md-2 logo">
					<p class="desc">logo</p>				
					<a href="<?php echo base_url().'admin/settings' ?>">Edit</a>
				</div>
				<div class="col-md-10 info">
					<p>Blog Info</p>				
					<a href="<?php echo base_url().'admin/settings' ?>">Edit</a>
				</div>			

				<div class="col-md-12 menu">
					<center>Menu Navigation (menu-dua)</center>
					<select class="update-option" id="show_menu_dua">
						<option <?php if(get_option('show_menu_dua') == "1"){echo "selected='selected'";} ?> value="1">Active</option>
						<option <?php if(get_option('show_menu_dua') == "0"){echo "selected='selected'";} ?> value="0">Non-Active</option>
					</select>
					<div class="lokasi"></div>
				</div>

				<div class="col-md-12 top">
					<center>Top (main page only)</center>
					<?php 
					$ww=array(
						'widget_position' => 'top'
						);
					$widget = $this->m_dah->get_widget($ww,'dah_widget')->result();
					?>				
					<ul class="widget sort-widget" id="top">								
						<?php  
						foreach($widget as $w){
							?>
							<li id="widget_<?php echo $w->widget_id ?>">						
								<?php echo str_replace("_"," ",strtoupper($w->widget_name)); ?>
								<a href="<?php echo base_url().'admin/hapus_widget/'.$w->widget_id ?>" class="glyphicon glyphicon-remove remove-widget"></a>
							</li>
							<?php } ?>	
						</ul>

						<div class="tambah-widget" id="top">				
							<span class="glyphicon glyphicon-plus"></span>									
						</div>	
					</div>

					<div class="col-md-9 content">
						<center>Content</center>
						<?php 
						$ww=array(
							'widget_position' => 'content'
							);
						$widget = $this->m_dah->get_widget($ww,'dah_widget')->result();
						?>				
						<ul class="widget sort-widget" id="content">	
							<?php  
							foreach($widget as $w){
								?>
								<li id="widget_<?php echo $w->widget_id ?>">						
									<?php echo str_replace("_"," ",strtoupper($w->widget_name)); ?>
									<a href="<?php echo base_url().'admin/hapus_widget/'.$w->widget_id ?>" class="glyphicon glyphicon-remove remove-widget"></a>
								</li>							
								<?php } ?>	
							</ul>

							<div class="tambah-widget" id="content">				
								<span class="glyphicon glyphicon-plus"></span>									
							</div>	
						</div>

						<div class="col-md-3 sidebar">
							<center>Sidebar</center>
							<?php 
							$ww=array(
								'widget_position' => 'sidebar'
								);
							$widget = $this->m_dah->get_widget($ww,'dah_widget')->result();
							?>				
							<ul class="widget sort-widget" id="sidebar">	
								<?php  
								foreach($widget as $w){
									?>
									<li id="widget_<?php echo $w->widget_id?>">						
										<?php echo str_replace("_"," ",strtoupper($w->widget_name)); ?>
										<a href="<?php echo base_url().'admin/hapus_widget/'.$w->widget_id ?>" class="glyphicon glyphicon-remove remove-widget"></a>
									</li>							
									<?php } ?>	
								</ul>
								<div class="tambah-widget" id="sidebar">				
									<span class="glyphicon glyphicon-plus"></span>									
								</div>			
							</div>


							<div class="col-md-12 footer-top">
								<?php 
								$ww=array(
									'widget_position' => 'footer'
									);
								$widget = $this->m_dah->get_widget($ww,'dah_widget')->result();
								?>		

								<ul class="widget-footer sort-widget" id="footer">	
									<?php  
									foreach($widget as $w){
										?>
										<li id="widget_<?php echo $w->widget_id?>">					
											<?php echo strtoupper(str_replace("_"," ",$w->widget_name)); ?>	
											<a href="<?php echo base_url().'admin/hapus_widget/'.$w->widget_id ?>" class="glyphicon glyphicon-remove remove-widget"></a>
										</li>			
										<?php } ?>
										<li class="tambah-widget tambah-widget-footer" id="footer">				
											<span class="glyphicon glyphicon-plus"></span>							
										</li>				
									</ul>

								</div>
								<div class="col-md-12 footer-bottom">
									<center>footer</center>
								</div>
							</div>
						</div>
					</div>

					<!-- Modal -->
					<div class="modal fade" id="modalwidget" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
									<h4 class="modal-title" id="myModalLabel">Widget <span class="muncul_lokasi"></span></h4>
								</div>
								<div class="modal-body">
									<div class="list-group">
										<a class="list-group-item btn-tambah-widget" id="calendar">Calendar</a>
										<a class="list-group-item btn-tambah-widget" id="text">Text</a>
										<a class="list-group-item btn-tambah-widget" id="related_post">Related Article</a>      		
										<a class="list-group-item btn-tambah-widget" id="category">Post Category</a>      		
										<a class="list-group-item btn-tambah-widget" id="pages">Pages</a>      		
										<a class="list-group-item btn-tambah-widget" id="slider">Slider</a>      		
										<a class="list-group-item btn-tambah-widget" id="social">Social Media</a>      		
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>        
								</div>
							</div>
						</div>
					</div>

					<?php echo $this->load->view('admin/v_footer_admin'); ?>

				</div>
