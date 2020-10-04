<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->helper(array('url','dah_helper'));
		$this->load->model('m_dah');
		$this->load->library(array('user_agent','cart','form_validation','session'));
		if($this->session->userdata('user_status') != "login"){
			redirect(base_url());
		}
	}

	public function index(){
		$this->load->database();
		$id = $this->session->userdata('user_id');
		$w = array(
			'id' => $id
			);
		$data['profil'] = $this->m_dah->edit_data($w,'user')->result();
		$data['notif_invoice'] = $this->m_dah->get_susun_invoice($id,0)->num_rows();

		$this->load->view('cms/header');
		$this->load->view('cms/user_index',$data);
		$this->load->view('cms/footer');
	}

	function user_logout(){
		$this->session->sess_destroy();
		redirect(base_url());
	}

	function user_profil(){
		$this->load->database();
		$id = $this->session->userdata('user_id');
		$w = array(
			'id' => $id
			);
		$data['profil'] = $this->m_dah->edit_data($w,'user')->result();
		$this->load->view('cms/header');
		$this->load->view('cms/user_profil',$data);
		$this->load->view('cms/footer');
	}

	function edit_profil(){
		if($this->session->userdata('user_status') != "login"){
			redirect(base_url());
		}
		$this->load->database();
		$id = $this->session->userdata('user_id');
		$w = array(
			'id' => $id
			);
		$data['profil'] = $this->m_dah->edit_data($w,'user')->result();
		$this->load->view('cms/header');
		$this->load->view('cms/user_edit_profil',$data);
		$this->load->view('cms/footer');
	}

	function user_edit_profil_act(){
		if($this->session->userdata('user_status') != "login"){
			redirect(base_url());
		}

		$this->load->database();
		$id = $this->session->userdata('user_id');
		$nama = $this->input->post('nama');
		$email = $this->input->post('email');
		$alamat = $this->input->post('alamat');
		$provinsi = $this->input->post('provinsi');
		$kota = $this->input->post('kota');
		$kecamatan = $this->input->post('kecamatan');
		$kodepos = $this->input->post('kodepos');
		$telp = $this->input->post('telp');

		$this->form_validation->set_rules('nama','Nama','required');
		$this->form_validation->set_rules('email', 'Email','trim|required');
		$this->form_validation->set_rules('alamat','Alamat','required');
		$this->form_validation->set_rules('provinsi','provinsi','required');
		$this->form_validation->set_rules('kota','kota','required');
		$this->form_validation->set_rules('kecamatan','kecamatan','required');
		$this->form_validation->set_rules('kodepos','kodepos','required|is_numeric');
		$this->form_validation->set_rules('telp','telpon','required');

		if($this->form_validation->run()==false){
			$w = array(
				'id' => $id
				);
			$data['profil'] = $this->m_dah->edit_data($w,'user')->result();
			$this->load->view('cms/header');
			$this->load->view('cms/user_edit_profil',$data);
			$this->load->view('cms/footer');
		}else{
			$w = array(
				'id' => $id
				);
			$data = array(
				'nama' => $nama,
				'alamat' => $alamat,
				'provinsi' => $provinsi,
				'email' => $email,
				'telp' => $telp,
				'kota' => $kota,
				'kecamatan' => $kecamatan,
				'kodepos' => $kodepos
				);
			$this->m_dah->update_data($w,$data,'user');
			redirect(base_url().'user/?alert=update');
		}
	}


	function invoice(){
		if($this->session->userdata('user_status') != "login"){
			redirect(base_url());
		}
		$this->load->database();
		$this->load->helper('ongkir_helper');
		$w = array(
			'user_id' => $this->session->userdata('user_id')
			);
		$data['invoice'] = $this->m_dah->edit_data_order($w,'invoice','id','desc')->result();
		
		$this->load->view('cms/header');
		$this->load->view('cms/user_invoice',$data);
		$this->load->view('cms/footer');
	}



	function invoice_detail($id){
		if($this->session->userdata('user_status') != "login"){
			redirect(base_url());
		}
		if($id==""){
			redirect(base_url());
		}
		$this->load->database();
		$this->load->helper('ongkir_helper');

		$data['barang'] = $this->db->query("select * from dah_products,orders where dah_products.prod_id=orders.order_produk and orders.order_invoice='$id'")->result();
		$subtotal = $this->db->query("select * from orders where orders.order_invoice='$id'")->result();
		$sub = "";
		foreach($subtotal as $s){
			$sub += $s->order_harga * $s->order_jumlah;
		}
		$data['subtotal'] = $sub;

		$w = array(
			'user_id' => $this->session->userdata('user_id'),
			'id' => $id
			);
		$data['invoice'] = $this->m_dah->edit_data($w,'invoice')->result();

		if(count($data)>0){
			$this->load->view('cms/header');
			$this->load->view('cms/user_invoice_detail',$data);
			$this->load->view('cms/footer');
		}else{
			redirect(base_url());
		}
	}

	function upload_slip(){
		if($this->session->userdata('user_status') != "login"){
			redirect(base_url());
		}
		$this->load->database();
		$this->load->helper('ongkir_helper');
		$id = $this->input->post('id_inv');
		$slip = $this->input->post('slip');
		if($id==""){
			redirect(base_url());
		}

		$this->form_validation->set_rules('id_inv','xx','required');
		if (empty($_FILES['slip']['name'])){
			$this->form_validation->set_rules('slip','Bukti Pembayaran','required');
		}

		if($this->form_validation->run() != true){
			$data['barang'] = $this->db->query("select * from dah_products,orders where dah_products.prod_id=orders.order_produk and orders.order_invoice='$id'")->result();
			$subtotal = $this->db->query("select sum(order_harga) as subtotal from orders where orders.order_invoice='$id'")->row();
			$data['subtotal'] = $subtotal->subtotal;

			$w = array(
				'user_id' => $this->session->userdata('user_id'),
				'id' => $id
				);
			$data['invoice'] = $this->m_dah->edit_data($w,'invoice')->result();

			if(count($data)>0){
				$this->load->view('cms/header');
				$this->load->view('cms/user_invoice_detail',$data);
				$this->load->view('cms/footer');
			}else{
				redirect(base_url());
			}
		}else{
			$config['upload_path'] = './dah_image/slip/';
			$config['allowed_types'] = 'gif|jpg|png';
			$config['encrypt_name'] = TRUE;

			$this->load->library('upload', $config);

			if (!$this->upload->do_upload('slip',FALSE)){
				redirect(base_url().'user/invoice/?alert=slip-error');
			}else{
				$data = array('upload_data' => $this->upload->data());
				$file_name = $data['upload_data']['file_name'];
				$this->m_dah->update_data(array('id' => $id),array('slip' => $file_name,'status'=>1),'invoice');
				redirect(base_url().'user/invoice/?alert=slip-upload');
			}
		}
	}

}
