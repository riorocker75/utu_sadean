<div class="content">
	<?php echo form_open(base_url().'index/cek_biaya_pengiriman'); ?>	
	<?php echo form_open(base_url().'index/biaya'); ?>

	<div class="col-md-12 col-sm-12">
		<h1 style="text-align:center;">Cek Ongkir TIKI, JNE, POS INDONESIA</h1>
		<br><br>
		<?php echo $this->session->flashdata('message'); ?>		
	</div>

	<div class="col-md-12 col-sm-12">
		<div class="col-md-6 col-sm-6">
			<label>Provinsi Asal</label>
			<?php
			$province_ori = json_decode(GetProv(), TRUE);					
			echo "<select name='prov_origin' required class='form-control form-control-sm' id='prov_origin'>";
			echo "<option value=''>Pilih Provinsi...!!!</option>";
			for ($i=1; $i < count($province_ori['rajaongkir']['results']); $i++) {
				echo "<option value='".$province_ori['rajaongkir']['results'][$i]['province_id']."' class='jne tiki pos all' >".$province_ori['rajaongkir']['results'][$i]['province']."</option>";
			}
			echo "</select>";
			?>
		</div>

		<div class="col-md-12 col-sm-12">
			<label>Kota Asal</label>
			<?php
			$city_ori = json_decode(GetCity(), TRUE);
			echo "<select name='city_origin' required class='form-control form-control-sm' id='city_origin'>";
			echo "<option class='' selected>Pilih Kota Asal...!!!</option>";
			for ($x=1; $x < count($city_ori['rajaongkir']['results']); $x++) {
				echo "<option value='".$city_ori['rajaongkir']['results'][$x]['city_id']."' class='". $city_ori['rajaongkir']['results'][$x]['province_id']."' >".$city_ori['rajaongkir']['results'][$x]['type']." ".$city_ori['rajaongkir']['results'][$x]['city_name']."</option>";
			}
			echo "</select>";
			?>			
		</div>
	</div>

	<div class="col-md-12 col-sm-12"><br>

		<div class="col-md-6 col-sm-6">
			<?php
			$province_ori = json_decode(GetProv(), TRUE);
			echo "<select name='prov_destination' required class='form-control form-control-sm' id='prov_destination'>";
			echo "<option value=''>Pilih Provinsi...!!!</option>";
			for ($i=1; $i < count($province_ori['rajaongkir']['results']); $i++) {
				echo "<option value='".$province_ori['rajaongkir']['results'][$i]['province_id']."' class='jne tiki pos all' >".$province_ori['rajaongkir']['results'][$i]['province']."</option>";
			}
			echo "</select>";
			?>
		</div>

		<div class="col-md-12 col-sm-6">
			<label>Kota Tujuan</label>
			<?php
			$city_ori = json_decode(GetCity(), TRUE);
			echo "<select name='city_destination' required class='form-control form-control-sm' id='city_destination'>";
			echo "<option class='' selected>Pilih Kota Tujuan...!!!</option>";
			for ($x=1; $x < count($city_ori['rajaongkir']['results']); $x++) {
				echo "<option value='".$city_ori['rajaongkir']['results'][$x]['city_id']."' class='". $city_ori['rajaongkir']['results'][$x]['province_id']."' >".$city_ori['rajaongkir']['results'][$x]['type']." ".$city_ori['rajaongkir']['results'][$x]['city_name']."</option>";
			}
			echo "</select>";
			?>			
		</div>		
	</div>
	<br/>
	<br/>
	<br/>
	<div class="col-md-12">

		<div class="col-md-12 col-sm-12">
			<label>Berat Barang Kiriman (gram)</label>
			<input type='text' name='weight' id='weight' required class='form-control form-control-sm' placeholder='Ketik Angka Saja' ><br>
		</div>
		
	</div>
	<div class="col-md-12">
		<div class="col-md-6 col-sm-6">
			<br>
			<input type='submit' class='btn btn-info-outline' name="cek" value='Cek Ongkir'>
			<br><br>
		</div>
	</div>
</div>
<?php echo form_close(); ?>



<?php 
// if(isset($_POST['cek'])){
// 	function GetCost($origin = '', $destination = '', $weight = '') {
// 		echo $city_origin;
// 		echo $city_destination;
// 		echo $weight;
// 		print_r(GetCost($city_origin,$city_destination,$weight));
// 	}
// }
?>


</div>


