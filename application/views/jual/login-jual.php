<!DOCTYPE html>
<html lang="en">

<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Masuk - Panel Toko</title>
	<meta name="robots" content="noindex,nofollow">
	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url();?>assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url();?>assets/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url();?>assets/css/core.css" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url();?>assets/css/components.css" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url();?>assets/css/colors.css" rel="stylesheet" type="text/css">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/plugins/loaders/pace.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/core/libraries/jquery.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/core/libraries/bootstrap.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/plugins/loaders/blockui.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/plugins/ui/nicescroll.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/plugins/ui/drilldown.js"></script>
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/plugins/ui/fab.min.js"></script>
	<!-- /core JS files -->


	<!-- Theme JS files -->
	<script type="text/javascript" src="<?php echo base_url();?>assets/js/core/app.js"></script>
	<!-- /theme JS files -->

</head>

<body class="navbar-bottom login-container">
	
	<!-- Page container -->
	<div class="page-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Simple login form -->
				<form action="<?php echo base_url().'petani/login_act' ?>" method="post" class="login-form">
					<div class="panel panel-body">
						<div class="text-center">						
							<br/>
							<h5 class="content-group">Masuk Ke Toko</h5>
							<br/>
						</div>
						<?php show_alert(); ?>
						<div class="form-group has-feedback has-feedback-left">
							<input class="form-control" type="text" name="uname" placeholder="Username">
							<div class="form-control-feedback">
								<i class="icon-user text-muted"></i>
							</div>
							<?php echo form_error('uname','<div class="form-error">','</div>'); ?>
						</div>

						<div class="form-group has-feedback has-feedback-left">
							<input class="form-control" type="password" name="pass" placeholder="Password">
							<div class="form-control-feedback">
								<i class="icon-lock2 text-muted"></i>
							</div>
							<?php echo form_error('pass','<div class="form-error">','</div>'); ?>
						</div>

						<div class="form-group">
							<button type="submit" class="btn bg-blue-400 btn-block">Masuk <i class="icon-circle-right2 position-right"></i></button>
						</div>

                        <br/>
                        
                        <div class="row">

                            <div class="col-lg-4 col-md-4 col-12">
                                <a href="<?php echo base_url(); ?>">
                                       Belanja
                                    </a>
                                </div>
                                <div class="col-lg-8 col-md-4 col-12">
                                <p>
                                    Ayo gabung sekarang
                                <a href="<?php echo base_url().'daftar-petani' ?>">
                                daftar
                                  </a>
    
                                 </p>
                                </div>
                    </div>
					
                        
                      
                        
					</div>
				</form>
				<!-- /simple login form -->

			</div>
			<!-- /main content -->

		</div>
		<!-- /page content -->

	</div>
	<!-- /page container -->

	</html>
