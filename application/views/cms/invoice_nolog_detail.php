<!-- breadrumb section -->
<section class="breadcrumbs">
    <div class="container">
        <div class="breadcrumbs-line">
            <ul>
                <li><a href="<?php echo base_url()?>">Home</a> </li>
                <li><a href="">Invoice Pembelian</a> </li>
            </ul>
        </div>
    </div>

</section>

<!-- end breadcrumb -->

<section class="user-profile">
	
      <div class="container">
          <div class="row">
             
              <div class="col-lg-12 col-md-12 col-sm-12 col-12">
					<?php show_alert(); ?>

                  <div class="user-sb-main">
                      <div class="user-sb-main-title">
							<p>
							<h2>Invoice Bayar</h2>
							</p> 
						
						</div>
						<?php foreach($invoice as $i){ ?>

						<?php if($i->status != "3" && $i->status != "4" ){ ?>	
							<div class="user-sb-main-body" style="margin-top:-10px">
								<p>Terima Kasih. Pesanan anda telah kami terima </p>
							</div>
					  <?php } ?>
					
					  <!-- info invoice -->

					  <div class="user-sb-main-body" style="margin-top:-10px">
							<div class="row">
								<div class="col-lg-3 col-md-3 col-12">
									<b class="tx-14">Kode Pesanan</b>
									<p class="tx-14" style="color: rgb(66, 69, 97);"><?php echo $i->no?></p>
								</div>
								<div class="col-lg-3 col-md-3 col-12">
									<b class="tx-14">Tanggal</b>
									<p class="tx-14"  style="color: rgb(66, 69, 97);">	
										<?php
											$phpdate = strtotime($i->tgl);
											$mysqldate = date( 'd M Y', $phpdate );
											echo $mysqldate;
										?>
									</p>
								</div>
								<div class="col-lg-3 col-md-3 col-12">
								<?php
								foreach($barang as $b){
									$total_order += $b->order_jumlah;
								}
								?>
									<b class="tx-14">Total</b>
									<p class="tx-14"  style="color: rgb(66, 69, 97);"><?php echo "Rp. ".number_format($i->ongkir+$subtotal); ?></p>
								</div>
								<div class="col-lg-3 col-md-3 col-12">
									<b class="tx-14">Metode Bayar</b>
									<p class="tx-14"  style="color: rgb(66, 69, 97);">Transfer Bank</p>
								</div>
							</div>
					<div class="panel-body no-padding-bottom">
						<div style="margin:20px 0">
							<h2 class="tx-22">Detail Pesanan</h2>
						</div>	
					<table class="det-pr">
						<tbody>
							<tr>
								<td>Total Produk</td>
								<td><?php echo $total_order?></td>
							</tr>
							<tr>
								<td>Tanggal Pesan </td>
								<td><?php echo $mysqldate; ?></td>
							</tr>

							<tr>
								<td>Alamat Pengiriman&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><?php echo $i->alamat; ?>,  <?php echo $i->kecamatan; ?>, <?php echo tampil_kota($i->kota); ?>, <?php echo tampil_provinsi($i->provinsi); ?></td>
							</tr>

							<tr>
								<td>Kurir</td>
								<td><?php echo $i->kurir; ?></td>
							</tr>
						</tbody>
					</table>
						
					</div>

					<div style="margin:20px 0">
							<h2 class="tx-22">Total Belanja</h2>
						</div>
					
						<table class="det-pr">
						<tbody>
							<tr>
								<td>Sub Total</td>
								<td><?php if($subtotal>0){echo "Rp. ".number_format($subtotal);} ?></td>
							</tr>
							<tr>
								<td>Rekening Pembayaran&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td>
									<?php if($i->rek_bank == "bm1"){?>
											<span class="text-semibold">Bank Mandiri (8653362)</span>
										<?php }elseif($i->rek_bank =="bm2"){?>
											<span class="text-semibold">Bank BRI (936723145099)</span>
										<?php }elseif($i->rek_bank =="bm3"){?>
											<span class="text-semibold">Bank BNI (1312567890)</span>
										<?php }?>	
								</td>
							</tr>
							<tr>
								<td>Biaya Kirim</td>
								<td>Rp. <?php echo number_format($i->ongkir) ?></td>
							</tr>

							<tr>
								<td>Total Bayar</td>
								<td>
								<?php echo "Rp. ".number_format($i->ongkir+$subtotal); ?>
								</td>
							</tr>
						</tbody>
					</table>

					

						<div class="panel-body" style="margin-top:90px">
							<div class="row invoice-payment">
								<div class="col-sm-7">

								</div>

								
							</div>

							<h6>Informasi penting</h6>
							<p class="text-muted tx-13">
								Terima kasih sudah berbelanja website kami ini adalah invoice atau faktur pesanan kamu. Kamu bisa melakukan pembayaran untuk tagihan invoice ini dengan cara mentransfer ke rekening yang tertera di atas sejumlah nominal total pembayaran yang tertera.
								Selanjutnya kamu tinggal mengupload slip bukti pembayaran untuk selanjutnya di periksa dan di konfirmasi oleh Tim kami.
								Jika ada yang kurang jelas, kamu bisa langsung berkonsultasi dengan CS kami melalui nomor hp yang tertera di atas.
								Pertanyaan kamu bisa kamu sampaikan melalui SMS, Telpon atau WA. Terima kasih.	</p>
							</div>
						</div>
					  
					
						</div>
					  <!-- end foreach -->
						<?php } ?>
                  </div>
              </div>

          </div>

      </div>

</section>