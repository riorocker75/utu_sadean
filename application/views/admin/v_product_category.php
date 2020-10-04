<div class="content">
	<?php show_alert(); ?>
	<div class="row">	
		<div class="col-md-4">	
			<div class="panel">
				<div class="panel-heading">
					<header>Add New Category</header>
				</div>			
				<div class="panel-body">	

					<?php echo validation_errors(); ?>
					<form action="<?php echo base_url().'admin/product_category_act' ?>" method="post">				
						<div class="form-group">
							<label>Category Name</label>			
							<input type="text" class="form-control" placeholder="Category Name .." name="nama">  
						</div>
						<div class="form-group">
							<label>Category Parent Sub</label>	
							<select class="form-control" name="sub">
								<option value="0">- Select Sub Parent -</option>
								<?php foreach($category as $cc){ ?>
								<option value="<?php echo $cc->pcat_id; ?>"><?php echo $cc->pcat_name; ?></option>
								<?php } ?>
							</select>								
						</div>				
						<div class="form-group">						
							<input type="submit" class="btn btn-primary btn-sm" value="Save">  
						</div>
					</form>				
				</div>			
			</div>
		</div>

		<div class="col-md-8">		
			<div class="panel">
				<div class="panel-heading">
					<header>All Categories</header>
				</div>			
				<div class="panel-body">		

					<ul>
						<?php 				
						foreach($data as $c){ 
							?>
							<li><?php echo $c->pcat_name; ?></li>				
							<?php 
							sub_catpro($c->pcat_id);
						} 
						?>
					</ul>

					<table class="table table-bordered table-hover">
						<thead>
							<tr>														
								<th>Name</th>
								<th>Sub</th>
								<th class="col-md-3">Option</th>							
							</tr>
						</thead>
						<tbody>
							<?php 					
							foreach($category as $c){
								?>
								<tr>							
									<td><?php echo $c->pcat_name ?></td>

									<?php if($c->pcat_sub==0){ ?>
									<td><center>-</center></td>
									<?php }else{ ?>
									<td>
										<?php 
							// $ww = array('pcat_sub' => $c->pcat_id);
										echo $c->pcat_sub;
										?>
									</td>
									<?php } ?>

									<td>					
										<?php if($c->pcat_id != 1){ ?>				
										<div class="btn-group">									
											<a class="btn btn-sm btn-default" href="<?php echo base_url().'admin/product_category_edit/'.$c->pcat_id ?>"><span class="glyphicon glyphicon-wrench"></span></a>
											<a class="btn btn-sm btn-default btn-delete" id="<?php echo base_url().'admin/product_category_delete/'.$c->pcat_id ?>"><span class="glyphicon glyphicon-trash"></span></a>
										</div>		
										<?php } ?>						
									</td>					
								</tr>						
								<?php 
							}
							?>
						</tbody>
					</table>
				</div>	
			</div>
		</div>
	</div>

	<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
