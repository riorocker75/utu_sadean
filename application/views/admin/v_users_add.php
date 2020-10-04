<div class="content">
	<div class="panel">
		<div class="panel-heading">
			Users Data
		</div>
		<div class="panel-body">				
			<form class="form-horizontal" action="<?php echo base_url().'admin/user_add_act' ?>" method="post">		
				<div class="form-group">
					<label class="control-label col-md-1">Name</label>
					<div class="col-md-8">					
						<input type="text" name="name" class="form-control col-md-10">
						<?php echo form_error('name', '<div class="form-error">', '</div>'); ?>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-1">Email</label>
					<div class="col-md-8">	
						<input type="email" name="email" class="form-control">
						<?php echo form_error('email', '<div class="form-error">', '</div>'); ?>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-1">Username</label>
					<div class="col-md-5">	
						<input type="text" name="username" class="form-control check-username">
						<?php echo form_error('username', '<div class="form-error">', '</div>'); ?>
					</div>
					<div class="col-md-3">	
						<span class="check-username-output"></span>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-1">Password</label>
					<div class="col-md-5">	
						<input type="password" name="password" class="form-control">
						<?php echo form_error('password', '<div class="form-error">', '</div>'); ?>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-md-1">Level</label>
					<div class="col-md-3">	
						<select class="form-control" name="level">						
							<option value="author">Author</option>					
							<option value="admin">Admin</option>
						</select>		
					</div>					
				</div>
				<div class="form-group">
					<label class="control-label col-md-1">Status</label>
					<div class="col-md-3">	
						<select class="form-control" name="status">						
							<option value="1">Active</option>
							<option value="0">Non-Active</option>				
						</select>	
					</div>
				</div>
				<div class="form-group">					
					<div class="col-md-2 col-md-offset-1">
						<input type="submit" value="Save" class="btn btn-sm btn-primary">
					</div>		
				</div>
			</form>
		</div>
	</div>


	<script type="text/javascript">
		$(document).ready(function(){
			$("input[type='text']").attr("autocomplete","off");
			$('.check-username').keyup(function(){
				var val = $(this).val();
				if(val.length > 0){ 
					var data = "val="+val;
					$.ajax({
						type:"post",
						data:data,
						url:"<?php echo base_url().'admin/cek_username_ajax' ?>",
						success: function(html){					
							if(html > 0){						
								$('.check-username').css("border-color","red");
								$('.check-username-output').html("<span class='label label-danger'>Username Unavailable !</span>");
								$('input[type="submit"]').addClass("disabled");
							}else{
								$('.check-username').css("border-color","green");
								$('.check-username-output').html("<span class='label label-success'>Username Available !</span>");
								$('input[type="submit"]').removeClass("disabled");
							}
						}
					});
				}
			});
		});
	</script>

	<?php echo $this->load->view('admin/v_footer_admin'); ?>

</div>
