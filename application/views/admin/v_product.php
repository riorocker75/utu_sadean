<div class="content">
	<a href="<?php echo base_url().'admin/product_add' ?>" class="btn btn-sm btn-primary pull-right"><span class="glyphicon glyphicon-plus"></span> Add New Product</a>
	<br/>
	<br/>
	<br/>
	<?php show_alert(); ?>			
	<div class="panel">
	<div class="panel-heading">		
			<h6>All Published Produk</h6>
		</div>
		<div class="panel-body">										
			<div class="table-responsive">
				<table class="table table-bordered table-hover" id="table-datatable">
					<thead>
						<tr>												
							<th>Penjual</th>
							<th>Nama Produk</th>
							<th>Jumlah</th>																
							<th>Harga</th>															
							<th class="col-md-2">Option</th>							
						</tr>
					</thead>

					<?php if($this->session->userdata('level') == "admin"){?>
						<tbody>
						<?php 			
						foreach($products as $ap){
							?>
							<tr>					
								<td class="col-md-2">
									<?php 
									$author = $this->m_dah->get_product_detail($ap->prod_id)->row();
									if($author->user_name != ""){
										echo $author->user_name;							
									}else{
										echo "No Author";
									}
									echo "<br/>";
									echo "<small><i>".$ap->prod_date."</i></small>";
									?>
								</td>
								<td>
									<div class="col-md-3">
										<?php if($ap->prod_img1!=""){ 
											echo "<img class='col-md-12' src='".base_url().'dah_image/products/'.$ap->prod_img1."'>";
										}else{ 
											echo "<img class='col-md-12' src='".base_url()."dah_image/default/no_product.jpg'>";
										}
										?>
									</div>
									<div class="col-md-9">
										<?php echo $ap->prod_name; ?>
										<br/>
										<small>
											<i>
												<?php 
												$category = $this->m_dah->get_product_category($ap->prod_id)->result();
												if(count($category) > 0){								
													foreach($category as $c){
														echo $c->pcat_name."<br/>";								
													}
												}else{
													echo "Uncategorized";
												}					
												?>
											</i>
										</small>								
									</div>								
								</td>
								<td><?php echo $ap->prod_qty; ?></td>								
								<td><?php echo $ap->prod_price; ?></td>
								<td>
									<div class="btn-group">									
										<a class="btn btn-sm btn-default" href="<?php echo base_url().'admin/product_edit/'.$ap->prod_id ?>"><span class="glyphicon glyphicon-wrench"></span></a>
										<a class="btn btn-sm btn-default btn-delete" id="<?php echo base_url().'admin/product_delete/'.$ap->prod_id ?>"><span class="glyphicon glyphicon-trash"></span></a>
									</div>
								</td>					
							</tr>						
							<?php 
						}
						?>
					</tbody>	
					<?php }else{?>	
					<tbody>
						<?php 			
						foreach($produk_user as $p){
							?>
							<tr>					
								<td class="col-md-2">
									<?php 
									$author = $this->m_dah->get_product_detail($p->prod_id)->row();
									if($author->user_name != ""){
										echo $author->user_name;							
									}else{
										echo "No Author";
									}
									echo "<br/>";
									echo "<small><i>".$p->prod_date."</i></small>";
									?>
								</td>
								<td>
									<div class="col-md-3">
										<?php if($p->prod_img1!=""){ 
											echo "<img class='col-md-12' src='".base_url().'dah_image/products/'.$p->prod_img1."'>";
										}else{ 
											echo "<img class='col-md-12' src='".base_url()."dah_image/default/no_product.jpg'>";
										}
										?>
									</div>
									<div class="col-md-9">
										<?php echo $p->prod_name; ?>
										<br/>
										<small>
											<i>
												<?php 
												$category = $this->m_dah->get_product_category($p->prod_id)->result();
												if(count($category) > 0){								
													foreach($category as $c){
														echo $c->pcat_name."<br/>";								
													}
												}else{
													echo "Uncategorized";
												}					
												?>
											</i>
										</small>								
									</div>								
								</td>
								<td><?php echo $p->prod_qty; ?></td>								
								<td><?php echo $p->prod_price; ?></td>
								<td>
									<div class="btn-group">									
										<a class="btn btn-sm btn-default" href="<?php echo base_url().'admin/product_edit/'.$p->prod_id ?>"><span class="glyphicon glyphicon-wrench"></span></a>
										<a class="btn btn-sm btn-default btn-delete" id="<?php echo base_url().'admin/product_delete/'.$p->prod_id ?>"><span class="glyphicon glyphicon-trash"></span></a>
									</div>
								</td>					
							</tr>						
							<?php 
						}
						?>
					</tbody>

					<?php }?>	
				</table>	
				<br/>	
				<br/>
			</div>	
		</div>		
	</div>	

	<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
