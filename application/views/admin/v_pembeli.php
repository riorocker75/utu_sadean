<div class="content">

	
	<?php show_alert(); ?>
	<div class="row">	
		<div class="col-md-12">		
			<div class="panel">
				<div class="panel-heading">
					<h6 class="panel-title">All Pembeli<a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
				</div>			
				<div class="panel-body">									
					<table class="table table-bordered table-hover" id="table-datatable">
						<thead>
							<tr>							
								<th width="1%">No</th>
								<th>Nama</th>
								<th>Email</th>
								<th>Telp / HP</th>
								<th>Kota</th>																								
								<th class="col-md-1">Option</th>							
							</tr>
						</thead>
						<tbody>
							<?php 
							$no = 1;
							foreach($pembeli as $p){
								?>
								<tr>
									<td><?php echo $no++ ?></td>
									<td><?php echo $p->nama; ?></td>
									<td><?php echo $p->email; ?></td>
									<td><?php echo $p->telp; ?></td>
									<td><?php echo $p->kota; ?></td>		
									<td>
										<?php 
										if($p->status == 0){
											echo "<span class='label label-danger'>Non-Aktif</span>";
										}else if($p->status == 1){
											echo "<span class='label label-primary'>Aktif</span>";			
										}
										?>				
									</td>													
									<td>
										<div class="btn-group">									
											<a class="btn btn-sm btn-default" href="<?php echo base_url().'admin/pembeli_detail/'.$p->id ?>"><span class="glyphicon glyphicon-search"></span></a>
											<a class="btn btn-sm btn-default" href="<?php echo base_url().'admin/pembeli_edit/'.$p->id ?>"><span class="glyphicon glyphicon-wrench"></span></a>
											<a class="btn btn-sm btn-default btn-delete" id="<?php echo base_url().'admin/pembeli_delete/'.$p->id ?>"><span class="glyphicon glyphicon-trash"></span></a>
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

	<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
