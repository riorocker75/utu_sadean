<div class="content">

	<!-- Dashboard content -->
	<div class="row">
		<?php show_alert(); ?>
		<div class="col-md-6">		
			<div class="panel panel-flat">
				<div class="panel-heading">				
					<h6 class="panel-title">Detail invoice<a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
				</div>			
				<div class="panel-body">									
					<?php foreach($invoice as $i){ ?>

					<div class="table-responsive">
						<table class="table table-striped">
							<tr>
								<th>No. INVOICE</th>
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
								<td><?php echo $i->nama; ?></td>
							</tr>
							<tr>
								<th>Alamat Tujuan</th>
								<td>
									<ul class="list-condensed list-unstyled">
										<li><?php echo $i->nama; ?></li>
										<li><?php echo $i->alamat; ?></li>
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
								<th>Kurir</th>
								<td>									
									<?php echo $i->kurir; ?>
								</td>
							</tr>							
							<tr>
								<th>Resi</th>
								<td>
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
										<img style="width: 50%;" src="<?php echo base_url().'dah_image/slip/'.$i->slip; ?>">
										<?php
									} 
									?>
								</td>
							</tr>	
						</table>
					</div>		

					<?php } ?>
				</div>	
			</div>
		</div>

		<div class="col-md-6">		
			<div class="panel panel-flat">
				<div class="panel-heading">				
					<h6 class="panel-title">Detail invoice<a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>
				</div>			
				<div class="panel-body">									
					<?php 
					$w = array(
						'order_invoice' => $i->id
						);
					$order = $this->m_dah->edit_data($w,'orders')->result();
					?>
					<table class="table">
						<tr>												
							<th>Produk</th>												
							<th>Harga</th>
							<th>Jumlah</th>
							<th>Total Harga</th>
						</tr>
						<?php 								
						foreach($barang as $b){
							?>								
							<tr>
								<td>
									<h6 class="no-margin"><?php echo $b->prod_name; ?></h6>
									<span class="text-muted"></span>
								</td>
								<td class="text-center"><?php echo "Rp. ". number_format($b->order_harga)." ,-"; ?></td>
								<td class="text-center"><?php echo $b->order_jumlah; ?></td>
								<td class="text-center"><span class="text-semibold"><?php echo "Rp. ".number_format($b->order_jumlah*$b->order_harga)." ,-"; ?></span></td>									
							</tr>
							<?php } ?>
						</table>

						<table class="table">
							<tbody>
								<tr>
									<th>Subtotal :</th>
									<td class="text-right"><?php if($subtotal>0){echo "Rp. ".number_format($subtotal)." ,-";} ?></td>
								</tr>
								<tr>
									<th>Ongkir :</th>
									<td class="text-right"><?php echo "Rp. ".number_format($i->ongkir)." ,-"; ?></td>
								</tr>
								<tr>
									<th>Total Pembayaran:<br/><span class="text-muted">(Subtotal + Ongkir)</span></th>
									<td class="text-right text-primary"><h5 class="text-semibold"><?php echo "Rp. ".number_format($i->ongkir+$subtotal)." ,-"; ?></h5></td>
								</tr>
							</tbody>
						</table>
				</div>	
			</div>
		</div>

	</div>

	<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
