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
					<div class="table-responsive">
						<form action="<?php echo base_url().'admin/invoice_update' ?>" method="post">			
							<table class="table table-bordered table-hover">			
								<tbody>
									<?php 
									$no = 1;
									foreach($invoice as $i){
										?>				
										<tr>
											<th class="col-md-3">No. Invoice</th>
											<td><?php echo $i->no; ?></td>
										</tr>
										<tr>
											<th>Tanggal</th>
											<td>
												<?php
												$date = strtotime($i->tgl); 
												echo date('d-M-Y',$date);
												?>						
											</td>
										</tr>
										<tr>
											<th>Pembeli</th>
											<td><a target="_blank" href="<?php echo base_url().'admin/pembeli_detail/'.$i->user_id; ?>"><?php echo $i->nama; ?></a></td>
										</tr>
										<tr>
											<th>Alamat Tujuan</th>
											<td>
												<ul class="list-condensed list-unstyled">
													<li><h5><?php echo $i->nama; ?></h5></li>
													<li><span class="text-semibold"><?php echo $i->alamat; ?></span></li>
													<li>Provinsi : <?php echo tampil_provinsi($i->provinsi); ?></li>
													<li>Kota / Kab : <?php echo tampil_kota($i->kota); ?></li>
													<li>Kecamatan : <?php echo $i->kecamatan; ?></li>
													<li>Kode Pos : <?php echo $i->kodepos; ?></li>
													<li>Tlp/HP : <?php echo $i->telp; ?></li>									
												</ul>
											</td>
										</tr>
										<tr>
											<th>Status</th>
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
													echo "<span class='label label-success'>Di bayar</span>";			
												}
												?>				
											</td>
										</tr>
										<tr>
											<th>Update Status</th>
											<td>
												<input type="hidden" name="id" value="<?php echo $i->id; ?>">
												<select class="form-control" name="status">
													<option <?php if($i->status=="0"){echo "selected='selected'";} ?> value="0">Menunggu pembayaran</option>
													<option <?php if($i->status=="1"){echo "selected='selected'";} ?> value="1">Menunggu konfirmasi</option>
													<option <?php if($i->status=="2"){echo "selected='selected'";} ?> value="2">Tolak</option>
													<option <?php if($i->status=="3"){echo "selected='selected'";} ?> value="3">Proses</option>
													<option <?php if($i->status=="4"){echo "selected='selected'";} ?> value="4">Selesai</option>
												</select>	
											</td>
										</tr>
										<tr>
											<th>Resi</th>
											<td>
												<input type="text" name="resi" class="form-control" value="<?php echo $i->resi; ?>">
												<?php if($i->resi==""){echo "Belum di input";}else{echo $i->resi;} ?>

											</td>
										</tr>	
										<tr>
											<th>Slip Bukti Pembayaran</th>
											<td>
												<?php 
												if($i->slip==""){
													echo "Belum di bayar";
												}else{
													?>
													<img style="width: 100%;" src="<?php echo base_url().'dah_image/slip/'.$i->slip; ?>">
													<?php
												} 
												?>
											</td>
										</tr>				

										<?php 
									}
									?>
								</tbody>
							</table>
							<br/>
							<div class="form-group">
							<input type="submit" class="btn btn-sm btn-primary btn-block" value="Update">
							</div>
						</form>	
					</div>	
				</div>								
			</div>
		</div>


	</div>

	<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
