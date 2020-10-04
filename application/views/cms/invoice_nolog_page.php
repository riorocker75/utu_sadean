	<!-- Page content -->
	<div class="page-content">

		<!-- Main content -->
		<div class="content-wrapper">

			<!-- Advanced login -->
			<form action="<?php echo base_url().'index/cek_inolog_act'; ?>" method="post">
				<div class="row">
					<div class="col-lg-4 offset-lg-4 col-sm-8 offset-sm-2 col-10 offset-1">
							<div class="main-login-form">

<div class="mlg-title">
	<h2>Lacak Pesanan</h2>
</div>
<?php show_alert()?>

		<div class="form-group">
		<label for="exampleInputEmail1" style="opacity:0.6">Kode Pembeli</label>
		<input type="text" class="form-control" name="kode_beli" required>
			<small class="form-text text-muted"><span class="text-danger"><?php echo form_error('kode_beli'); ?></span></small>
		</div>

		<div class="form-group">
		<label for="namalengkap" style="opacity:0.6">Kode Order</label>
		<input type="text" class="form-control" name="kode_order" required>
		<small class="form-text text-muted"><span class="text-danger"><?php echo form_error('kode_order'); ?></span></small>

		</div>

		<div  style="margin-top:30px;">
			<button class="btn-login-fullwidth bor-daftar"> Lacak Pesanan <i class="fa fa-eye" aria-hidden="true"></i></button>

		</div>

		<div class="col-lg-10 offset-lg-1 col-sm-12 col-12 tx-14" style="opacity:0.8;margin-top:10px;margin-bottom:-10px;text-align:center">
			Khusus pelanggan tanpa login
			
		</div>
</div>

						
						
					</div>
				</div>
			</form>
			<!-- /advanced login -->

		</div>
		<!-- /main content -->

	</div>
		<!-- /page content -->