<?php
defined('BASEPATH') OR exit('No direct script access allowed');
if ( ! function_exists('GetApi')) {
	function GetApi() {
  		$Api = "key: 8f22875183c8c65879ef1ed0615d3371"; // => Api Keymu
  		return $Api;		
	}
}
// ------------------------------------------------------------------------ //
if ( ! function_exists('GetCity')) { // Ambil Data Kota / Kabupaten
	function GetCity() {
		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => "http://api.rajaongkir.com/starter/city",
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => "",
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "GET",
		  CURLOPT_HTTPHEADER => array(
		    getApi(), "JSON"
		  ),
		));
		  $response = curl_exec($curl);
		  $err = curl_error($curl);
		  curl_close($curl);
		  return $response;
	}
}
// ------------------------------------------------------------------------ //
if ( ! function_exists('GetProv')) { // Ambil Data Provinsi
	function GetProv() {
		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => "http://api.rajaongkir.com/starter/province",
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => "",
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "GET",
		  CURLOPT_HTTPHEADER => array(
		    getApi(), "JSON"
		  ),
		));
			$response = curl_exec($curl);
			$err = curl_error($curl);
			curl_close($curl);
		 return $response;
	}
}
// ------------------------------------------------------------------------ //
if ( ! function_exists('GetCost')) { // Post Harga / Biaya Ongkos Kirim
	function GetCost($origin, $destination, $weight) {
		$curl = curl_init();
		curl_setopt_array($curl, array(
		  CURLOPT_URL => "http://api.rajaongkir.com/starter/cost",
		  CURLOPT_RETURNTRANSFER => true,
		  CURLOPT_ENCODING => "",
		  CURLOPT_MAXREDIRS => 10,
		  CURLOPT_TIMEOUT => 30,
		  CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		  CURLOPT_CUSTOMREQUEST => "POST",
		  CURLOPT_POSTFIELDS => "origin=".$origin."&destination=".$destination."&weight=".$weight."&courier=all",
		  CURLOPT_HTTPHEADER => array("content-type: application/x-www-form-urlencoded", getApi() ),
		));
		$response = curl_exec($curl);
		$err = curl_error($curl);
		curl_close($curl);
		return $response;
	}
}
// ------------------------------------------------------------------------ //


function tampil_kota($city){
	$curl = curl_init();
	$ci = & get_instance();
	curl_setopt_array($curl, array(
		CURLOPT_URL => "http://api.rajaongkir.com/starter/city?id=$city",			
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_ENCODING => "",
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 30,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => "GET",
		CURLOPT_HTTPHEADER => array(
			"key: 8f22875183c8c65879ef1ed0615d3371"
			),
		));

	$response = curl_exec($curl);
	$err = curl_error($curl);

	curl_close($curl);

	if ($err) {
		echo "cURL Error #:" . $err;
	} else {		
		$city_ori = json_decode($response, TRUE);
		return $city_ori['rajaongkir']['results']['city_name'];
	}
}

function tampil_provinsi($province){
	$curl = curl_init();
	$ci = & get_instance();	
	curl_setopt_array($curl, array(
		CURLOPT_URL => "http://api.rajaongkir.com/starter/province?id=$province",			
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_ENCODING => "",
		CURLOPT_MAXREDIRS => 10,
		CURLOPT_TIMEOUT => 30,
		CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
		CURLOPT_CUSTOMREQUEST => "GET",
		CURLOPT_HTTPHEADER => array(
			"key: 8f22875183c8c65879ef1ed0615d3371"
			),
		));

	$response = curl_exec($curl);
	$err = curl_error($curl);

	curl_close($curl);

	if ($err) {
		echo "cURL Error #:" . $err;
	} else {		
		$city_ori = json_decode($response, TRUE);
		return $city_ori['rajaongkir']['results']['province'];
	}
}