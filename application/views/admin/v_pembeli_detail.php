<div class="content">
	<a href="<?php echo base_url().'admin/pembeli' ?>" class="btn btn-xs btn-primary">Kembali</a>
	<br/>
	<br/>
	<div class="row">	
		<?php echo show_alert(); ?>	
		<div class="col-lg-12">
			<div class="panel panel-flat">
				<div class="panel-heading">
					<h6 class="panel-title">Profil Pembeli</h6>						
				</div>

				<div class="panel-body">						
					<?php foreach($pembeli as $p){ ?>

					<div class="table-responsive">
						<table class="table table-framed">
							<tr>
								<th class="col-md-3">Nama Lengkap</th>
								<td><?php echo $p->nama ?></td>
							</tr>
							<tr>
								<th>Email</th>
								<td><?php echo $p->email ?> </td>
							</tr>
							<tr>
								<th>Alamat</th>
								<td><?php echo $p->alamat; ?></td>
							</tr>
							<tr>
								<th>Provinsi</th>
								<td><?php echo $p->kota; ?></td>
							</tr>
							<tr>
								<th>Kecamatan</th>
								<td><?php echo $p->kecamatan; ?></td>
							</tr>
							<tr>
								<th>Kode Pos</th>
								<td><?php echo $p->kodepos; ?> </td>
							</tr>
							<tr>
								<th>Telpon / HP</th>
								<td><?php echo $p->telp; ?></td>
							</tr>
						</table>
					</div>
					<?php } ?>
				</div>
			</div>				
		</div>			
	</div>

	<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
