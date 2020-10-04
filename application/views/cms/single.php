<!-- Page content -->
<div class="page-content">	

	<!-- Main sidebar -->
	<div class="sidebar sidebar-main sidebar-default sidebar-separate">
		<div class="sidebar-content">	

			<!-- Latest post -->
			<div class="panel panel-white">
				<div class="panel-heading">
					<div class="panel-title text-semibold">
						<i class="icon-history position-left"></i>
						Kategori Posting
					</div>
				</div>

				<div class="list-group no-border">					
					<?php foreach($kategori as $k){ ?>					
					<a href="<?php echo base_url()."index/category/".$k->category_id."/".create_slug($k->category_name);?>" class="list-group-item">
						<?php echo $k->category_name; ?>						
					</a>
					<?php } ?>
				</div>
			</div>
			<!-- /latest post -->					

			<!-- Latest post -->
			<div class="panel panel-white">
				<div class="panel-heading">
					<div class="panel-title text-semibold">
						<i class="icon-history position-left"></i>
						Posting terbaru
					</div>
				</div>

				<div class="list-group no-border">
				<?php foreach($terbaru as $t){ ?>
					<a href="<?php echo base_url().'blog/'.$t->post_id.'-'.create_slug($t->post_tittle)?>" class="list-group-item">
						<?php echo ucfirst($t->post_tittle); ?>

						<?php 
						$category = $this->m_dah->get_post_category($t->post_id)->result();
						if(count($category) > 0){
							echo " <div class='text-muted text-size-small'> ";								
							foreach($category as $c){
								echo $c->category_name ." . ";	
							}
							echo "</div>";
						}else{
							echo "<div class='text-muted text-size-small'>Uncategorized</div>";							
						}					
						?>						
					</a>
					<?php } ?>
				</div>
			</div>
			<!-- /latest post -->

		</div>
	</div>
	<!-- /main sidebar -->


	<!-- Main content -->
	<div class="content-wrapper">

		<!-- Cards layout -->
		<ul class="media-list content-group">	
			<?php 		
			if(count($single) > 0){	
			foreach($single as $p){				
				?>
				<div class="panel panel-body single-post">					
					<h6 class="media-heading text-semibold">
						<?php echo ucfirst($p->post_tittle); ?>
					</h6>

					<ul class="list-inline list-inline-separate text-muted mb-10">

						<?php 
						$author = $this->m_dah->get_post_detail($p->post_id)->row();
						if($author->user_name != ""){
							echo "<li>Oleh <a class='text-muted' href='".base_url()."index/author/".$author->post_author."/".create_slug($author->user_name)."'>".$author->user_name."</a></li>";													
						}else{
							echo "<li><a class='text-muted'>No Author</a></li>";
						}
						?>						
						<li>
							<?php 
							$category = $this->m_dah->get_post_category($p->post_id)->result();
							if(count($category) > 0){
								echo " di ";								
								foreach($category as $c){
									echo "<a class='text-muted' href='".base_url()."index/category/".$c->category_id."/".create_slug($c->category_name)."'>".$c->category_name."</a>, ";								
								}
							}else{
								echo "<a class='text-muted' href='".base_url()."index/category/1/uncategorized'>Uncategorized</a>";
							}					
							?>
						</li>	
						<li><span class="text-muted"><?php echo date('d F Y',strtotime($p->post_date));?></span></li>

					</ul>
					<?php 
					if($p->post_cover != ""){
						?>								

						<?php 																		
						echo "<center><img class='img-cover responsive-image' src='".base_url().'dah_image/post/'.$p->post_cover."'></img></center>";																			
						?>						

						<?php } ?>
						<?php echo $p->post_content; ?>
						
					</div>
					<?php 
				}
			}else{
				echo "<center>";
				echo "<h4>Oppss ! Sepertinya artikel tidak tersedia.</h4>";
				echo "<a href='".base_url()."'>Kembali</a'>";
				echo "</center>";
			}
				?>

			</ul>
			<!-- /cards layout -->

		</div>
		<!-- /main content -->

	</div>
	<!-- /page content -->





























