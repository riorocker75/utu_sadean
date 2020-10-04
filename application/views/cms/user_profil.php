<div class="page-content">
	<!-- Main content -->
	<div class="content-wrapper">		
		<!-- User profile -->
		<div class="row">
			<div class="col-lg-3">

								
				<?php $this->load->view('cms/user_sidebar'); ?>
			</div>
			<div class="col-lg-9">
				<div class="panel panel-flat timeline-content">
					<div class="panel-heading">
						<h6 class="panel-title">Profil Saya</h6>
						<div class="heading-elements">
							<a href="<?php echo base_url().'user/edit_profil'; ?>" class="btn btn-primary btn-xs">&nbsp;  EDIT &nbsp; <i class="icon-wrench"></i></a>
						</div>
					</div>

					<div class="panel-body">
					<?php show_alert(); ?>
						<div class="table-responsive">
							<?php foreach($profil as $p){ ?>
							<table class="table table-bordered">								
								<tr>
								<td class="col-md-3">Nama</td>
									<td><?php echo $p->nama; ?></td>
								</tr>
								<tr>
									<td>Alamat</td>
									<td><?php echo $p->alamat; ?></td>
								</tr>
								<tr>
									<td>Provinsi</td>
									<td><?php echo $p->provinsi; ?></td>
								</tr>
								<tr>
									<td>Kota</td>
									<td><?php echo $p->kota; ?></td>
								</tr>
								<tr>
									<td>Kecamatan</td>									
									<td><?php echo $p->kecamatan; ?></td>
								</tr>
								<tr>
									<td>Kode Pos</td>
									<td><?php echo $p->kodepos; ?></td>
								</tr>
								<tr>
									<td>Email</td>
									<td><?php echo $p->email; ?></td>
								</tr>
								<tr>
									<td>Telpon / HP</td>
									<td><?php echo $p->telp; ?></td>
								</tr>
								<tr>
								</tr>
								
							</table>
							<?php } ?>
						</div>
					</div>
				</div>				
			</div>			
		</div>
		<!-- /user profile -->

	</div>
	<!-- /main content -->

</div>
