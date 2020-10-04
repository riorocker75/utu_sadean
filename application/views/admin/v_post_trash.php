<div class="content">

	
	<?php show_alert(); ?>			

	<div class="panel">
	<div class="panel-heading">
			<header>All Posts In Trash</header>
		</div>			
		<div class="panel-body">						
			<a href="<?php echo base_url().'admin/post_add' ?>" class="btn btn-primary pull-right"><span class="glyphicon glyphicon-pencil"></span> Add New Post</a>
			<ul class="nav nav-tabs">
				<li><a href="<?php echo base_url().'admin/posts' ?>">Publish</a></li>
				<li><a href="<?php echo base_url().'admin/posts_draft' ?>">Draft</a></li>
				<li class="active"><a href="<?php echo base_url().'admin/posts_trash' ?>">Trash</a></li>
			</ul>
			<br/>
			<div class="table-responsive">
				<table class="table table-bordered table-hover" id="table-datatable">
					<thead>
						<tr>							
							<th>Author</th>
							<th>Tittle</th>
							<!-- <th>Url</th>																 -->
							<th>Category</th>															
							<th class="col-md-1">Option</th>							
						</tr>
					</thead>
					<tbody>
						<?php 
						$no = 1;
						foreach($posts as $p){
							?>
							<tr>
								<td>
									<?php 
									$author = $this->m_dah->get_post_detail($p->post_id)->row();
									echo $author->user_name;
									?>
								</td>
								<td><?php echo $p->post_tittle; ?></td>
								<!-- <td><?php echo $p->post_url; ?></td> -->		
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
										<a class="btn btn-sm btn-default btn-delete" id="<?php echo base_url().'admin/post_delete/'.$p->post_id ?>"><span class="glyphicon glyphicon-trash"></span></a>
									</div>
								</td>					
							</tr>						
							<?php 
						}
						?>
					</tbody>
				</table>
				<br/><br/>
			</div>
		</div>

	</div>	

	<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
