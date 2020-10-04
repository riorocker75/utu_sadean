<div class="content">

	<!-- Dashboard content -->
	<div class="row">
		<?php show_alert(); ?>
		<div class="col-md-12">		
			<div class="panel panel-flat">
				<div class="panel-heading">				
					<h6 class="panel-title">All invoices<a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
				</div>			
				<div class="panel-body">
					<br/><br/>	
					<div class="table-responsive">
						<table class="table table-bordered table-hover" id="table-datatable">
							<thead>
								<tr>							
								<th>No</th>
									<th>No. Invoice</th>
									<th>Tanggal</th>
									<th>Pembeli</th>
									<th>Status</th>															
									<th>Resi</th>																				
									<th>Option</th>							
								</tr>
							</thead>
							<tbody>
								<?php 
								$no = 1;
								foreach($invoice as $i){
									?>
									<tr>
										<td><?php echo $no++ ?></td>
										<td><a href="<?php echo base_url().'admin/invoice_detail/'.$i->id; ?>"><?php echo $i->no; ?></a></td>
										<td><?php echo $i->tgl; ?></td>
										<td><?php echo $i->nama; ?></td>		
										<td>
											<?php 
											if($i->status == 0){
												echo "<span class='label label-warning'>Menunggu pembayaran</span>";
											}else if($i->status == 1){
												echo "<span class='label label-default'>Menunggu konfirmasi</span>";			
											}else if($i->status == 2){
												echo "<span class='label label-danger'>Di tolak</span>";			
											}else if($i->status == 3){
												echo "<span class='label label-primary'>Di proses</span>";			
											}else if($i->status == 4){
												echo "<span class='label label-success'>Di bayar & Selesai</span>";			
											}
											?>				
										</td>							
										<td><?php if($i->resi==""){echo "Belum di input";}else{echo $i->resi;} ?></td>		
										<td>
											<div class="btn-group">									
												<a class="btn btn-sm btn-default" href="<?php echo base_url().'admin/invoice_edit/'.$i->id ?>"><span class="glyphicon glyphicon-wrench"></span></a>
												<a class="btn btn-sm btn-default btn-delete" id="<?php echo base_url().'admin/invoice_delete/'.$i->id ?>"><span class="glyphicon glyphicon-trash"></span></a>
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
