<div class="content">

	<!-- Dashboard content -->
	<div class="row">
		<?php show_alert(); ?>
		<div class="col-md-4">	
			<div class="panel panel-flat">
				<div class="panel-heading">				
					<h6 class="panel-title">Add New Category<a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>	
				</div>			
				<div class="panel-body">	

					<?php echo validation_errors(); ?>
					<form action="<?php echo base_url().'admin/category_act' ?>" method="post">				
						<div class="form-group">
							<label>Category Name</label>			
							<input type="text" class="form-control" placeholder="Category Name .." name="category">  
						</div>				
						<div class="form-group">						
							<input type="submit" class="btn btn-primary btn-sm" value="Save">  
						</div>
					</form>				
				</div>			
			</div>
		</div>

		
		<div class="col-md-8">		
			<div class="panel panel-flat">
				<div class="panel-heading">				
					<h6 class="panel-title">All Categories<a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
				</div>			
				<div class="panel-body">
					<div class="table-responsive">
					<table class="table table-bordered table-hover tabel-framed">
						<thead>
							<tr>														
								<th>Name</th>
								<!-- <th>Url</th>							 -->
								<th class="col-md-3">Option</th>							
							</tr>
						</thead>
						<tbody>
							<?php 					
							foreach($category as $c){
								?>
								<tr>							
									<td><?php echo $c->category_name ?></td>
									<!-- <td><?php echo $c->category_url ?></td>		 -->
									<td>
										<?php if($c->category_id != "1"){ ?>
										<div class="btn-group">									
											<a class="btn btn-sm btn-default" href="<?php echo base_url().'admin/category_edit/'.$c->category_id ?>"><span class="glyphicon glyphicon-wrench"></span></a>
											<a class="btn btn-sm btn-default btn-delete" id="<?php echo base_url().'admin/category_delete/'.$c->category_id ?>"><span class="glyphicon glyphicon-trash"></span></a>
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


	</div>

	<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
