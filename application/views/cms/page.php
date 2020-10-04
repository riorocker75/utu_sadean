<div class="page-content">

	<!-- Main content -->
	<div class="content-wrapper">

		<?php 			
		if(count($page) > 0){
			foreach($page as $p){		
				?>	

				<ul class="breadcrumb">
					<li><a href="<?php echo base_url() ?>"><i class="icon-home2 position-left"></i> Home</a></li>
					<li><a href="<?php echo base_url().'index/page' ?>">Page</a></li>
					<li class="active"><?php echo $p->page_tittle ?></li>
				</ul>
				<?php 
			}
		}
		?>
		<br/>
		<div class="row">
			<?php 			
			if(count($page) > 0){
				foreach($page as $p){		
					?>	
					<div class="panel panel-body single-post">					
						<h2 class="media-heading text-semibold">
							<?php echo ucfirst($p->page_tittle); ?>
						</h2>
						<br/>
						<?php 
						if($p->page_cover != ""){																
							echo "<center><img class='img-cover' src='".base_url().'dah_image/page/'.$p->page_cover."'></img></center>";
						}																			
						?>				
						<?php			
						echo $p->page_content; 
						?>		
					</div>					
					<?php 
				}
			}else{
				echo "<center>";
				echo "<h4>Oppss ! Sepertinya produk tidak tersedia.</h4>";
				echo "<a href='".base_url()."'>Kembali</a'>";
				echo "</center>";
			}	
			?>
		</div>
	
	</div>
	<!-- /main content -->

</div>
