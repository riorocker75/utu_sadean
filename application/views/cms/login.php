	<!-- Page content -->
	<div class="page-content">

		<!-- Main content -->
		<div class="content-wrapper">
	
			<!-- Advanced login -->
			<form action="<?php echo base_url().'index/user_login'; ?>" method="post">
				<div class="row">
					<div class="col-lg-4 offset-lg-5 col-sm-8 offset-sm-2 col-10 offset-1">
					
							<div class="main-login-form">
		
							<div class="mlg-title">
								<h2>Masuk</h2>

							</div>
							<?php show_alert()?>
									<div class="form-group">

									<input type="email" class="input-control" name="email" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Email">
									<!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
									</div>

									<div class="form-group">

									<input type="password" class="input-control" name="password" id="exampleInputPassword1" placeholder="Password">
									</div>

									<div style="margin-top:10px;">
										<button class="btn-login-fullwidth bor-login"> Masuk <i class="fas fa-sign-in-alt"></i></button>

									</div>

									<div class="col-12 d-flex justify-content-center tx-14" style="opacity:0.8;margin-top:10px;margin-bottom:-10px">
										Belum punya akun? 
											<a href="<?php echo base_url().'index/user_daftar'?>" class="blue-text text-darken-2 tx-bold-600">&nbsp;daftar</a>
									
									</div>
							</div>
							<br>
							<br>
						</div>
					
				</div>
			</form>
			<!-- /advanced login -->

		</div>
		<!-- /main content -->

	</div>
		<!-- /page content -->