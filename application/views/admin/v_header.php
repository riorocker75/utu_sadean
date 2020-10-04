<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Panel Toko Serbaumbi</title>
<!--<link rel="icon" type="image/png" href="<?php echo base_url().'dah_image/system/logo.png' ?>">-->
	<!-- Global stylesheets -->
	<link href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url(); ?>assets/css/dahcode.css" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url(); ?>assets/css/icons/icomoon/styles.css" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url(); ?>assets/css/bootstrap.css" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url(); ?>assets/css/core.css" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url(); ?>assets-adm/css/components.css" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url(); ?>assets/css/colors.css" rel="stylesheet" type="text/css">
	<link href="<?php echo base_url(); ?>assets/css/dah.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="<?php echo base_url().'assets-lama/plugin/datatable/datatables.css' ?>">
	<!-- /global stylesheets -->

	<!-- Core JS files -->
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/plugins/loaders/pace.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/core/libraries/jquery.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/core/libraries/bootstrap.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/plugins/loaders/blockui.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/plugins/ui/nicescroll.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/plugins/ui/drilldown.js"></script>
	<!-- <script type="text/javascript" src="<?php echo base_url(); ?>assets/js/plugins/ui/fab.min.js"></script> -->
	<!-- /core JS files -->

	<!-- Theme JS files -->
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/plugins/forms/styling/switchery.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/plugins/forms/styling/uniform.min.js"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/plugins/media/fancybox.min.js"></script>

	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/core/app.js"></script>
	<script type="text/javascript" src="<?php echo base_url(); ?>assets/js/pages/components_thumbnails.js"></script>
	<!-- <script type="text/javascript" src="<?php echo base_url(); ?>assets/js/dah.js"></script> -->

	<script type="text/javascript" src="<?php echo base_url().'assets-lama/js/jquery-ui/jquery-ui.js' ?>"></script>	
	<script type="text/javascript" src="<?php echo base_url().'assets-lama/plugin/datatable/jquery.dataTables.js' ?>"></script>
	<script type="text/javascript" src="<?php echo base_url().'assets-lama/plugin/datatable/datatables.js' ?>"></script>
	<script type="text/javascript" src="<?php echo base_url().'assets-lama/plugin/ckeditor/ckeditor.js' ?>"></script>
	<!-- /theme JS files -->
</head>

<body>

	<!-- Main navbar -->
	<div class="navbar navbar-inverse">
		<div class="navbar-header">
			<!--<a class="navbar-brand" href="<?php echo base_url(); ?>"><img src="<?php echo base_url() ?>dah_image/system/logo2.png"></a>-->

			<ul class="nav navbar-nav visible-xs-block">
				<li><a data-toggle="collapse" data-target="#navbar-mobile"><i class="icon-tree5"></i></a></li>
				<li><a class="sidebar-mobile-main-toggle"><i class="icon-paragraph-justify3"></i></a></li>
			</ul>
		</div>

		<div class="navbar-collapse collapse" id="navbar-mobile">
			<ul class="nav navbar-nav">
				<li><a class="sidebar-control sidebar-main-toggle hidden-xs"><i class="icon-paragraph-justify3"></i></a></li>
			</ul>

			<p class="navbar-text"><span class="label bg-success">Online</span></p>

			<ul class="nav navbar-nav navbar-right">				

				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="icon-bubbles4"></i>
						<span class="visible-xs-inline-block position-right">Messages</span>
						<span class="badge bg-warning-400">2</span>
					</a>
					
					<div class="dropdown-menu dropdown-content width-350">
						<div class="dropdown-content-heading">
							Messages
							<ul class="icons-list">
								<li><a href="#"><i class="icon-compose"></i></a></li>
							</ul>
						</div>

						<ul class="media-list dropdown-content-body">
							<li class="media">
								<div class="media-left">
									<img src="<?php echo base_url() ?>assets/images/demo/users/face10.jpg" class="img-circle img-sm" alt="">
									<span class="badge bg-danger-400 media-badge">5</span>
								</div>

								<div class="media-body">
									<a href="#" class="media-heading">
										<span class="text-semibold">James Alexander</span>
										<span class="media-annotation pull-right">04:58</span>
									</a>

									<span class="text-muted">who knows, maybe that would be the best thing for me...</span>
								</div>
							</li>

							<li class="media">
								<div class="media-left"><img src="<?php echo base_url() ?>assets/images/demo/users/face25.jpg" class="img-circle img-sm" alt=""></div>
								<div class="media-body">
									<a href="#" class="media-heading">
										<span class="text-semibold">Richard Vango</span>
										<span class="media-annotation pull-right">Mon</span>
									</a>
									
									<span class="text-muted">Other travelling salesmen live a life of luxury...</span>
								</div>
							</li>
						</ul>

						<div class="dropdown-content-footer">
							<a href="#" data-popup="tooltip" title="All messages"><i class="icon-menu display-block"></i></a>
						</div>
					</div>
				</li>

				<li class="dropdown dropdown-user">
					<a class="dropdown-toggle" data-toggle="dropdown">
						<img src="<?php echo base_url() ?>dah_image/default/pembeli.jpg" alt="">
						<span><?php echo $this->session->userdata('name'); ?></span>
						<i class="caret"></i>
					</a>

					<ul class="dropdown-menu dropdown-menu-right">
						<li><a href="#"><i class="icon-user-plus"></i> My profile</a></li>
						<li><a href="#"><i class="icon-coins"></i> My balance</a></li>
						<li><a href="#"><span class="badge bg-teal-400 pull-right">58</span> <i class="icon-comment-discussion"></i> Messages</a></li>
						<li class="divider"></li>
						<li><a href="#"><i class="icon-cog5"></i> Account settings</a></li>
						<li><a href="#"><i class="icon-switch2"></i> Logout</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	<!-- /main navbar -->


	<!-- Page container -->
	<div class="page-container">

		<!-- Page content -->
		<div class="page-content">

			<!-- Main sidebar -->
			<div class="sidebar sidebar-main">
				<div class="sidebar-content">

					<!-- User menu -->
					<div class="sidebar-user">
						<div class="category-content">
							<div class="media">
								<a href="#" class="media-left"><img src="<?php echo base_url() ?>dah_image/default/pembeli.jpg" class="img-circle img-sm" alt=""></a>
								<div class="media-body">
									<span class="media-heading text-semibold"><?php echo $this->session->userdata('name') ?></span>
									<div class="text-size-mini text-muted">
										<i class="icon-pin text-size-small"></i> &nbsp;Aceh Barat, Indonesia
									</div>
								</div>							
							</div>
						</div>
					</div>
					<!-- /user menu -->


					<!-- Main navigation -->
					<div class="sidebar-category sidebar-category-visible" style="min-height:100vh">
						<div class="category-content no-padding">
							<ul class="navigation navigation-main navigation-accordion">

								<!-- Main -->
								<li class="navigation-header"><span>SHOP</span> <i class="icon-menu" title="Main pages"></i></li>
								
								<li><a href="<?php echo base_url().'admin' ?>"><i class="icon-home4"></i> <span> Dashboard</span></a></li>
								
								<li><a href="#"><i class="icon-cube4"></i> <span> Produk</span></a>
									<ul>
										<li><a href="<?php echo base_url().'admin/products' ?>"> Semua Produk</a></li>
										<li><a href="<?php echo base_url().'admin/product_add' ?>"> Produk baru</a></li>
										<li><a href="<?php echo base_url().'admin/product_category' ?>"> Kategori Produk</a></li>
									</ul>
								</li>

								<li><a href="#"><i class="icon-coin-dollar"></i> <span> Penjualan</span></a>
									<ul>
										<li><a href="<?php echo base_url().'admin/invoice' ?>"> Invoice</a></li>
										<li><a href="<?php echo base_url().'admin/pembeli' ?>"> User</a></li>						
									</ul>
								</li>

								<li class="navigation-header"><span>Main</span> <i class="icon-menu" title="Main pages"></i></li>
								
								<li><a href="#"><i class="icon-copy3"></i> <span> Posting</span></a>
									<ul>
										<li><a href="<?php echo base_url().'admin/posts' ?>"> Semua Posting</a></li>
										<li><a href="<?php echo base_url().'admin/post_add' ?>"> Posting Baru</a></li>
										<li><a href="<?php echo base_url().'admin/category' ?>"> Kategori Posting</a></li>
									</ul>
								</li>
								<?php 
								if($this->session->userdata('level') == "admin"){
								?>
								<li><a href="#"><i class="icon-file-empty"></i> <span> Halaman</span></a>
									<ul>
										<li><a href="<?php echo base_url().'admin/page' ?>"> Semua Halaman</a></li>
										<li><a href="<?php echo base_url().'admin/page_add' ?>"> Halaman Baru</a></li>
									</ul>
								</li>
								<li><a href="#"><i class="icon-design"></i> <span> Appearance</span></a>
									<ul>
										<li><a href="<?php echo base_url().'admin/menu' ?>"> Menu</a></li>
										<li><a href="<?php echo base_url().'admin/widget' ?>"> Widget</a></li>
									</ul>
								</li>
								<li><a href="<?php echo base_url().'admin/users' ?>"><i class="icon-users"></i> <span> Pengguna Sistem</span></a></li>
								<li><a href="<?php echo base_url().'admin/settings' ?>"><i class="icon-hammer-wrench"></i> <span> Pengaturan</span></a></li>			
								<?php } ?>								
								
								<li><a href="<?php echo base_url().'admin/logout' ?>"><i class="icon-exit2"></i> <span>Log Out</span></a></li>

							</ul>
						</div>
					</div>
					<!-- /main navigation -->

				</div>
			</div>
			<!-- /main sidebar -->


			<!-- Main content -->
			<div class="content-wrapper">

				<!-- Page header -->
				<div class="page-header page-header-default">
					<div class="page-header-content">
						<div class="page-title">
							<h4><i class="icon-arrow-left52 position-left"></i> <span class="text-semibold">Home</span> - Dashboard</h4>
						</div>

						<div class="heading-elements">
							<div class="heading-btn-group">
								<a href="#" class="btn btn-link btn-float has-text"><i class="icon-bars-alt text-primary"></i><span>Statistics</span></a>
								<a href="#" class="btn btn-link btn-float has-text"><i class="icon-calculator text-primary"></i> <span>Invoices</span></a>
								<a href="#" class="btn btn-link btn-float has-text"><i class="icon-calendar5 text-primary"></i> <span>Schedule</span></a>
							</div>
						</div>
					</div>

					<div class="breadcrumb-line">
						<ul class="breadcrumb">
							<li><a href="index.html"><i class="icon-home2 position-left"></i> Home</a></li>
							<li class="active">Dashboard</li>
						</ul>

						<ul class="breadcrumb-elements">
							<li><a href="#"><i class="icon-comment-discussion position-left"></i> Support</a></li>
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">
									<i class="icon-gear position-left"></i>
									Settings
									<span class="caret"></span>
								</a>

								<ul class="dropdown-menu dropdown-menu-right">
									<li><a href="#"><i class="icon-user-lock"></i> Account security</a></li>
									<li><a href="#"><i class="icon-statistics"></i> Analytics</a></li>
									<li><a href="#"><i class="icon-accessibility"></i> Accessibility</a></li>
									<li class="divider"></li>
									<li><a href="#"><i class="icon-gear"></i> All settings</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<!-- /page header -->



		