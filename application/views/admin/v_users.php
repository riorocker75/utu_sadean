<div class="content">
	<a class="pull-right btn btn-sm btn-primary" href="<?php echo base_url().'admin/user_add' ?>"><span class="glyphicon glyphicon-plus"></span> Add User</a>
	<br/><br/>
	<?php echo show_alert(); ?>
	<div class="panel">
		<div class="panel-heading">
			<header>Users Data</header>
		</div>
		<div class="panel-body">
			<div class="table-responsive">
				<table class="table table-datatable">
					<thead>
						<tr>
							<th>Name</th>
							<th>Email</th>
							<th>Username</th>
							<th>Level</th>
							<th>Status</th>
							<th>Option</th>
						</tr>
					</thead>
					<tbody>
						<?php 
						foreach($users as $u){
							?>
							<tr>
								<td><?php echo $u->user_name ?></td>
								<td><?php echo $u->user_email ?></td>
								<td><?php echo $u->user_login ?></td>
								<td><?php echo $u->user_level ?></td>
								<td>
									<?php 
									if($u->user_status == "1"){
										echo "Active";
									}else if($u->user_status == "0"){
										echo "Non-Active";
									}						
									?>
								</td>
								<td>
									<div class="btn-group">
										<a class="btn btn-sm btn-default" href="<?php echo base_url().'admin/user_edit/'.$u->user_id ?>"><span class="glyphicon glyphicon-wrench"></span></a>
										<!-- <a class="btn btn-sm btn-default" href="<?php echo base_url().'admin/user_delete/'.$u->user_id ?>"><span class="glyphicon glyphicon-trash"></span></a> -->
									</div>					
								</td>
							</tr>
							<?php } ?>
						</tbody>
					</table>
				</div>
			</div>
		</div>

		<?php echo $this->load->view('admin/v_footer_admin'); ?>

	</div>
