<div class="content">

	<!-- Dashboard content -->
	<a href="<?php echo base_url().'admin/page_add' ?>" class="btn btn-sm btn-primary pull-right"><span class="glyphicon glyphicon-plus"></span> Add New Page</a>							
	<br/><br/>
	<div class="row">
		<?php show_alert(); ?>
		<div class="col-md-12">		
			<div class="panel panel-flat">
				<div class="panel-heading">				
					<h6 class="panel-title">All Page<a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
				</div>			
				<div class="panel-body">		
					<br/><br/>
					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="table-datatable">
							<thead>
								<tr>							
									<th width="1%">No</th>
									<th>Page Tittle</th>
									<th>Page Url</th>															
									<th class="col-md-2">Page Status</th>															
									<th class="col-md-2">Option</th>							
								</tr>
							</thead>
							<tbody>
								<?php 
								$no = 1;
								foreach($page as $p){
									?>
									<tr>
										<td><?php echo $no++ ?></td>
										<td><?php echo $p->page_tittle; ?></td>
										<td><?php echo $p->page_url; ?></td>		
										<td><center><i><?php echo $p->page_status; ?></i></center></td>		
										<td>
											<div class="btn-group">									
												<a class="btn btn-sm btn-default" href="<?php echo base_url().'admin/page_edit/'.$p->page_id ?>"><span class="glyphicon glyphicon-wrench"></span></a>
												<a class="btn btn-sm btn-default btn-delete" id="<?php echo base_url().'admin/page_delete/'.$p->page_id ?>"><span class="glyphicon glyphicon-trash"></span></a>
											</div>
										</td>					
									</tr>						
									<?php 
								}
								?>
							</tbody>
						</table>
						<br/>
						<br/>
					</div>
				</div>	
			</div>
		</div>


	</div>

	<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
