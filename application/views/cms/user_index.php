<!-- breadrumb section -->
<section class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-line">
            <ul>
                <li><a href="<?php echo base_url()?>">Laman Depan</a> </li>
                <li><a href="">Profil</a> </li>
            </ul>
        </div>
    </div>

</section>

<!-- end breadcrumb -->

<section class="user-profile">

      <div class="container">
          <div class="row">
              <div class="col-lg-3 col-sm-12 col-12">
                <?php include"user_sidebar.php";?>
              </div>

              <div class="col-lg-8 col-md-12 col-sm-12 col-12">
                <?php show_alert()?>
                  <div class="user-sb-main">
                      <div class="user-sb-main-title">
                        <p>
                         <h2> Data Profil Saya</h2>

                        <a href="<?php echo base_url().'user/edit_profil'; ?>" class="btn btn-bordered bor-danger  float-right" style="margin-top:-40px;">Ubah Profil &nbsp;<i class="fa fa-wrench" ></i></a>
                        </p>    
                    
                        </div>

                      <div class="user-sb-main-body">
                            <div class="table-responsive" style="padding:20px 15px 15px 15px;">
                                <?php foreach($profil as $p){ ?>
                                <table class="table " cellpadding="0" cellspacing="0" >								
                                  <tr >
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

  </div>

</section>