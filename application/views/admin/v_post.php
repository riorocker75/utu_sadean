<div class="content">

	
	<?php show_alert(); ?>
	<div class="row">	
		<div class="col-md-12">		
			<div class="panel">
				<div class="panel-heading">
					<h6 class="panel-title">All Post<a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
				</div>			
				<div class="panel-body">	
					<a href="<?php echo base_url().'admin/post_add' ?>" class="btn btn-primary pull-right"><span class="glyphicon glyphicon-pencil"></span> Add New Post</a>
					<ul class="nav nav-tabs">
						<li class="active"><a href="<?php echo base_url().'admin/posts' ?>">Publish</a></li>
						<li><a href="<?php echo base_url().'admin/posts_draft' ?>">Draft</a></li>
						<li><a href="<?php echo base_url().'admin/posts_trash' ?>">Trash</a></li>
					</ul>
					<br/>

					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="table-datatable">
							<thead>
								<tr>												
									<th class="col-md-2">Author</th>
									<th>Tittle</th>																						
									<th>Category</th>															
									<th class="col-md-2">Option</th>							
								</tr>
							</thead>
							<tbody>
								<?php 			
								foreach($posts as $p){
									?>
									<tr>					
										<td>
											<?php 
											$author = $this->m_dah->get_post_detail($p->post_id)->row();
											if($author->user_name != ""){
												echo $author->user_name;							
											}else{
												echo "No Author";
											}
											echo "<br/>";
											echo "<small><i>".$p->post_date."</i></small>";
											?>
										</td>
										<td><?php echo $p->post_tittle; ?></td>
										<td>
											<i>
												<?php 
												$category = $this->m_dah->get_post_category($p->post_id)->result();
												if(count($category) > 0){								
													foreach($category as $c){
														echo $c->category_name.", ";								
													}
												}else{
													echo "Uncategorized";
												}					
												?>
											</i>
										</td>		
										<td>
											<div class="btn-group">									
												<a class="btn btn-sm btn-default" href="<?php echo base_url().'admin/post_edit/'.$p->post_id ?>"><span class="glyphicon glyphicon-wrench"></span></a>
												<a class="btn btn-sm btn-default btn-delete" id="<?php echo base_url().'admin/post_to_trash/'.$p->post_id ?>"><span class="glyphicon glyphicon-trash"></span></a>
											</div>
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
