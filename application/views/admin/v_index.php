<div class="content">

	<!-- Dashboard content -->
	<div class="row">
		<div class="panel panel-flat">
			<div class="panel-heading">
				<h6 class="panel-title">Latest posts<a class="heading-elements-toggle"><i class="icon-more"></i></a></h6>							
			</div>

			<div class="panel-body">
				<?php echo $this->m_dah->get_option('blog_name'); ?>
				<br/>	
				<br/>		
				<br/>	
				<br/>	
				<br/>	
				<?php print_r($this->session->all_userdata()); ?>

			</div>
		</div>

	</div>

	<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
			