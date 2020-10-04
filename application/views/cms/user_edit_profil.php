<!-- breadrumb section -->
<section class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-line">
            <ul>
                <li><a href="<?php echo base_url()?>">Home</a> </li>
                <li><a href="">Ubah Profil</a> </li>
            </ul>
        </div>
    </div>

</section>

<!-- end breadcrumb -->

<section class="user-profile">

  <div class="row">
      <div class="col-lg-10 offset-lg-1 col-sm-10 offset-sm-1 col-12">
          <div class="row">
              <div class="col-lg-3 col-md-3 col-sm-12 col-12">
                <?php include"user_sidebar.php";?>
              </div>

              <div class="col-lg-8 col-md-8 col-sm-12 col-12">
                  <div class="user-sb-main">
                      <div class="user-sb-main-title">
                        <p>
                         <h2>Profil Saya</h2>
                        </p> 
                        </div>
						<?php foreach($profil as $p){ ?>
                      <div class="user-sb-main-body" style="margin-top:10px">
						<form action="<?php echo base_url().'user/user_edit_profil_act' ?>" method="post">
						<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label>Nama Lengkap</label>
										<input type="text" name="nama" value="<?php echo $p->nama ?>" class="form-control">
										<?php echo form_error('nama'); ?>
									</div>
									<div class="col-md-6">
										<label>Email</label>
										<input type="text" name="email" value="<?php echo $p->email ?>" class="form-control">
										<?php echo form_error('email'); ?>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<div class="col-md-12">
										<label>Alamat</label>
										<input type="text" name="alamat" value="<?php echo $p->alamat; ?>" class="form-control">
										<?php echo form_error('alamat') ?>
									</div>										
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<div class="col-md-4">
										<label>Provinsi</label>
										<input type="text" name="provinsi" value="<?php echo $p->provinsi; ?>" class="form-control">
										<?php echo form_error('provinsi'); ?>
									</div>
									<div class="col-md-4">
										<label>Kota</label>
										<input type="text" name="kota" value="<?php echo $p->kota; ?>" class="form-control">
										<?php echo form_error('kota'); ?>
									</div>
									<div class="col-md-4">
										<label>Kecamatan</label>
										<input type="text" name="kecamatan" value="<?php echo $p->kecamatan; ?>" class="form-control">
										<?php echo form_error('kecamatan'); ?>
									</div>
								</div>
							</div>

							<div class="form-group">
								<div class="row">
									<div class="col-md-6">
										<label>Kode Pos</label>
										<input type="text" name="kodepos" value="<?php echo $p->kodepos; ?>" class="form-control">
										<?php echo form_error('kodepos'); ?>
									</div>	
									
									<div class="col-md-6">
										<label>Telpon / HP</label>
										<input type="text" name="telp" value="<?php echo $p->telp; ?>" class="form-control">
										<?php echo form_error('telp'); ?>											
									</div>
								</div>
							</div>

							

							<div class="form-group">
								<div class="row">
									<div class="col-md-6">											
										<input type="submit" class="btn btn-primary" value="Simpan">											
									</div>
								</div>
							</div>		
						</form>
					  </div>
						<?php } ?>
                  </div>
              </div>

          </div>

      </div>
  </div>

</section>