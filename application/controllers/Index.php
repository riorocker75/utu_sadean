<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Index extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->helper(array('url','dah_helper'));
		$this->load->model('m_dah');
		$this->load->library(array('user_agent','cart','form_validation','session'));
	}

	function notfound(){
		$this->load->database();
		$this->load->view('cms/header');
		$this->load->view('v_notfound');
		$this->load->view('cms/footer');


	}

	public function index(){
		$this->load->database();
		$this->load->library('pagination');
		$id=$this->session->userdata('user_id');
		$posts = $this->m_dah->get_data_order('desc','prod_id','dah_products');
		$data['notif_invoice'] = $this->m_dah->get_susun_invoice($id,0)->num_rows();

		$config['base_url'] = base_url().'/index/index/page/';
		$config['total_rows'] = $posts->num_rows();
		$config['per_page'] = 8;
		$config['first_link'] = 'First';
		$config['first_tag_open'] = '<ul class="pagination">';
		$config['first_tag_close'] = '  </ul>';
		$config['last_link'] = 'Last';
		$config['last_tag_open'] = '<div>';
		$config['last_tag_close'] = '</div>';
		$config['uri_segment'] = 4;
		$this->pagination->initialize($config);
		$dari = $this->uri->segment('4');
		$data['products'] = $this->m_dah->get_product_paging($config['per_page'],$dari)->result();

		$data['category_product'] = $this->db->query("select * from dah_product_category where pcat_sub='0' order by pcat_name asc")->result();
		$this->load->view('cms/header',$data);
		$this->load->view('cms/index',$data);
		$this->load->view('cms/footer');
	}

	public function shop(){
		$this->load->database();
		$this->load->library('pagination');
		$posts = $this->m_dah->get_data_order('desc','prod_id','dah_products');
		$data['kategori_product'] = $this->m_dah->get_data('dah_product_category')->result();

		$config['base_url'] = base_url().'/index/shop/page/';
		$config['total_rows'] = $posts->num_rows();
		$config['per_page'] = 12;
		$config['first_link'] = 'First';
		$config['first_tag_open'] = '<div>';
		$config['first_tag_close'] = '</div>';
		$config['last_link'] = 'Last';
		$config['last_tag_open'] = '<div>';
		$config['last_tag_close'] = '</div>';
		$config['uri_segment'] = 4;
		$this->pagination->initialize($config);
		$dari = $this->uri->segment('4');

		$data['products'] = $this->m_dah->get_product_paging($config['per_page'],$dari)->result();
		$data['category_product'] = $this->db->query("select * from dah_product_category where pcat_sub='0' order by pcat_name asc")->result();
		$this->load->view('cms/header',$data);
		$this->load->view('cms/shop',$data);
		$this->load->view('cms/footer');
	}

	public function blog(){
		$this->load->database();
		$this->load->library('pagination');
		$posts = $this->m_dah->get_posts('publish');
		$config['base_url'] = base_url().'/index/blog/page/';
		$config['total_rows'] = $posts->num_rows();
		$config['per_page'] = 5;
		$config['first_link'] = 'First';
		$config['first_tag_open'] = '<div>';
		$config['first_tag_close'] = '</div>';
		$config['last_link'] = 'Last';
		$config['last_tag_open'] = '<div>';
		$config['last_tag_close'] = '</div>';
		$config['uri_segment'] = 4;
		$this->pagination->initialize($config);
		$dari = $this->uri->segment('4');
		$data['posts'] = $this->m_dah->get_posts_paging('publish',$config['per_page'],$dari)->result();
		$data['kategori'] = $this->m_dah->get_data('dah_category')->result();
		$data['terbaru'] = $this->m_dah->get_post_limit('publish',4)->result();
		$this->load->view('cms/header');
		$this->load->view('cms/blog',$data);
		$this->load->view('cms/footer');
	}



	public function product_detail($prod){
		$this->load->database();
		$this->load->helper('ongkir_helper');
		if($prod == ""){
			redirect(base_url());
		}else{
			$where = array(
				'prod_id' => $prod
				);
			$data['product'] = $this->m_dah->edit_data($where,'dah_products')->result();
			$this->load->view('cms/header');
			$this->load->view('cms/product_detail',$data);
			$this->load->view('cms/footer');
		}
	}

	public function kategori_produk($id){
		$this->load->database();
		$this->load->library('pagination');
		if($id==""){
			redirect(base_url());
		}
		

		$posts = $this->m_dah->product_in_category($id);
		$config['base_url'] = base_url().'/index/index/kategori_produk/page/';
		$config['total_rows'] = $posts->num_rows();
		$config['per_page'] = 12;
		$config['first_link'] = 'First';
		$config['first_tag_open'] = '<div>';
		$config['first_tag_close'] = '</div>';
		$config['last_link'] = 'Last';
		$config['last_tag_open'] = '<div>';
		$config['last_tag_close'] = '</div>';
		$config['uri_segment'] = 4;
		$this->pagination->initialize($config);
		$dari = $this->uri->segment('4');
		if($dari==""){
			$dari=0;
		}
		$x = $config['per_page'];


		$w = array('pcat_id' => $id);
		$ww=$this->m_dah->edit_data($w,'dah_product_category')->row();

		if(count($ww)>0){
			$data['kategori_produk'] = $ww->pcat_name;
			$data['products'] = $this->db->query("select * from dah_taxonomy,dah_product_category,dah_products where dah_taxonomy.taxonomy_child='$id' and dah_taxonomy.taxonomy='product_category' and dah_taxonomy.taxonomy_child=dah_product_category.pcat_id and dah_taxonomy.taxonomy_parent=dah_products.prod_id limit $dari, $x")->result();
			$data['category_product'] = $this->db->query("select * from dah_product_category where pcat_sub='0' order by pcat_name asc")->result();
			$this->load->view('cms/header',$data);
			$this->load->view('cms/category_product',$data);
			$this->load->view('cms/footer');
		}else{
			redirect(base_url());
		}
	}

	public function single($post){
		$this->load->database();
		if($post == ""){
			redirect(base_url());
		}else{
			$where = array(
				'post_status' => 'publish',
				'post_id' => $post
				);
			$data['single'] = $this->m_dah->edit_data($where,'dah_posts')->result();
			$data['kategori'] = $this->m_dah->get_data('dah_category')->result();
			$data['terbaru'] = $this->m_dah->get_post_limit('publish',4)->result();
			$this->load->view('cms/header');
			$this->load->view('cms/single',$data);
			$this->load->view('cms/footer');
		}
	}

	public function page(){
		$this->load->database();
		$page = $this->uri->segment('3');
		if($page == ""){
			redirect(base_url());
		}else{
			$where = array(
				'page_status' => 'publish',
				'page_id' => $page
				);
			$data['page'] = $this->m_dah->edit_data($where,'dah_pages')->result();
			$this->load->view('cms/header');
			$this->load->view('cms/page',$data);
			$this->load->view('cms/footer');
		}
	}

	public function category(){
		$this->load->database();
		$category = $this->uri->segment('3');
		if($category == ""){
			redirect(base_url());
		}else{
			$data['kategori'] = $this->m_dah->get_data('dah_category')->result();
			$data['posts'] = $this->m_dah->post_in_category($category)->result();
			$data['terbaru'] = $this->m_dah->get_post_limit('publish',4)->result();
			$this->load->view('cms/header');
			$this->load->view('cms/category',$data);
			$this->load->view('cms/footer');
		}
	}

	public function cat_produk(){
		$this->load->database();
		$category = $this->uri->segment('3');
		if($category == ""){
			redirect(base_url());
		}else{
			$data['category_product'] = $this->db->query("select * from dah_product_category where pcat_sub='0' order by pcat_name asc")->result();
		
			$data['posts'] = $this->m_dah->post_in_category($category)->result();
			$data['terbaru'] = $this->m_dah->get_post_limit('publish',4)->result();
			$this->load->view('cms/header');
			$this->load->view('cms/category_product',$data);
			$this->load->view('cms/footer');
		}
	}
	function addtocart(){
		$this->load->database();
		$id = $this->input->post('id');
		if($id == ""){
			redirect(base_url());
		}
		$w = array('prod_id'=> $id);
		$data = $this->m_dah->edit_data($w,'dah_products');
		$produk = $data->result();
		foreach($produk as $p){
			$data = array(
				'id' => $p->prod_id,
				'name' => $p->prod_name,
				'price' => $p->prod_price,
				'qty' => 1,
				'options' => array('gambar'=> $p->prod_img1)
				);
			$this->cart->product_name_rules = '[:print:]';
			$this->cart->insert($data);
		}
	}

	function addtocart2(){
		$this->load->database();
		$id = $this->input->post('id');
		$jumlah_produk=$this->input->post('jumlah_produk');
		$stock_hasil=$this->input->post('stock_hasil');

		if($id == ""){
			redirect(base_url());
		}
		$w = array('prod_id'=> $id);
		$data = $this->m_dah->edit_data($w,'dah_products');
		$produk = $data->result();
		foreach($produk as $p){
			$data = array(
				'id' => $p->prod_id,
				'name' => $p->prod_name,
				'price' => $p->prod_price,
				'qty' => $jumlah_produk,
				'options' => array('gambar'=> $p->prod_img1)
				);
			$this->cart->product_name_rules = '[:print:]';
			$this->cart->insert($data);
		}
	}

	

	function removefromcart($rowid){
		$data = array(
			'rowid' => $rowid,
			'qty' => 0
			);
		$this->cart->product_name_rules = '[:print:]';
		$this->cart->update($data);
		redirect(base_url().'index/keranjang/?alert=remove-cart');
	}

	function removefromnotifcart($rowid){
		$data = array(
			'rowid' => $rowid,
			'qty' => 0
			);
		$this->cart->product_name_rules = '[:print:]';
		$this->cart->update($data);
		redirect($_SERVER['HTTP_REFERER']);
	}


	function keranjang(){
		$this->load->database();
		$this->load->view('cms/header');
		$this->load->view('cms/keranjang');
		$this->load->view('cms/footer');
	}

	function kosongkan_keranjang(){
		$this->cart->destroy();
		redirect(base_url().'index/keranjang');
	}

	function tracking(){
		$this->load->database();
		$this->load->view('cms/header');
		$this->load->view('cms/tracking');
		$this->load->view('cms/footer');
	}










	// user
	function user_daftar(){
		$this->load->database();
		if($this->session->userdata('user_status')=='login'){
			redirect(base_url());
		}
		$email = $this->input->post('email');
		$nama = $this->input->post('nama');
		$password = $this->input->post('password');

		$this->form_validation->set_rules('nama','Nama','required');
		$this->form_validation->set_rules(
			'email', 'Email',
			'trim|required|is_unique[user.email]|valid_email',
			array(
				'required'      => 'Harus di isi.',
				'is_unique'     => 'Sudah ada yang mendaftar dengan email ini.'
				)
			);
		$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[6]');
		if($this->form_validation->run()==true){
			$data = array(
				'nama'=>$nama,
				'email'=>$email,
				'password'=>md5($password),
				'status'=>1
				);
			$this->m_dah->insert_data($data,'user');

			// email config
			$this->load->library('email');
			$subyek="Pengingat Pembayaran";
			$pesan="
			<html>
			<head>

		<style type='text/css'>
		 	@media only screen and (min-width: 1200px){
			.seti{
		    width:731px;height:40px;color:#fff; background-color: #ec5624; padding: 15px 32px; text-align: center;
			text-decoration: none; display: inline-block;
			font-size: 20px;
			border-radius:12px;
			box-shadow:0 4px 5px 0 rgba(0, 0, 0, 0.14),
			0 1px 10px 0 rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.2);
				}
				
			}
			@media only screen and (max-width: 400px){
				.seti{
				font-weight:800;color:#00c853;
				font-size: 28px;
					}		
				}
		
			
		</style>
		</head>
		<body>
		<div style=' padding-left:80px;padding-right:80px'>
			<p class='seti '>
			Sadean
			</p>
			<p style='font-size:18px; font-weight:600;margin-top:15px;'>
			Selamat bergabung menjadi pengguna sadean
			</p>

			<p style='font-size:16px; font-weight:400;margin-top:15px;'>
			Hai <b>$nama</b> semoga kamu menikmati layanan terbaik kami di sadean ini
			</p>
		

		</div>

		</body>
		</html>
	
			";

			$this->m_dah->kirim_email($email,$subyek,$pesan);

			if($this->email->send())
			{
				redirect(base_url().'index/userlogin/?alert=daftar-sukses');
			}else
			{
				echo "gagal";
			}	

			// end send email
			
		}else{
			$this->load->view('cms/header');
			$this->load->view('cms/daftar');
			$this->load->view('cms/footer');
		}
	}

	function userlogin(){
		$this->load->database();
		if($this->session->userdata('user_status')!='login'){
			$this->load->view('cms/header');
			$this->load->view('cms/login');
			$this->load->view('cms/footer');
		}else{
			redirect(base_url());
		}
	}

	function user_login(){
		$this->load->database();
		if($this->session->userdata('user_status')!='login'){
			$email = $this->input->post('email');
			$password = $this->input->post('password');

			$this->form_validation->set_rules(
				'email', 'Email',
				'trim|required|valid_email'
				);
			$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[6]');
			if($this->form_validation->run()==true){
				$data = array(
					'email'=>$email,
					'password'=>md5($password),
					'status'=>1
					);
				$cek = $this->m_dah->edit_data($data,'user');
				if($cek->num_rows() > 0){
					$u_data = $cek->row();
					$session = array(
						'user_id' => $u_data->id,
						'user_nama' => $u_data->nama,
						'user_email' => $u_data->email,
						'user_telp' => $u_data->telp,
						'user_alamat' => $u_data->alamat,
						'user_status' => 'login'
						);
					$this->session->set_userdata($session);
					redirect(base_url().'user');
				}else{
					redirect(base_url().'index/userlogin/?alert=login-gagal');
				}

			}else{
				$this->load->view('cms/header');
				$this->load->view('cms/login');
				$this->load->view('cms/footer');
			}
		}else{
			redirect(base_url());
		}
	}

	function user_login_static(){
		$this->load->database();
		if($this->session->userdata('user_status')!='login'){
			$email = $this->input->post('email');
			$password = $this->input->post('password');

			$this->form_validation->set_rules(
				'email', 'Email',
				'trim|required|valid_email'
				);
			$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[6]');
			if($this->form_validation->run()==true){
				$data = array(
					'email'=>$email,
					'password'=>md5($password),
					'status'=>1
					);
				$cek = $this->m_dah->edit_data($data,'user');
				if($cek->num_rows() > 0){
					$u_data = $cek->row();
					$session = array(
						'user_id' => $u_data->id,
						'user_nama' => $u_data->nama,
						'user_email' => $u_data->email,
						'user_status' => 'login'
						);
					$this->session->set_userdata($session);
					redirect($_SERVER['HTTP_REFERER']);
				}else{
					redirect(base_url().'index/userlogin/?alert=login-gagal');
				}

			}else{
				$this->load->view('cms/header');
				$this->load->view('cms/login');
				$this->load->view('cms/footer');
			}
		}else{
			redirect(base_url());
		}
	}

	function update_cart(){
		$rowid = $this->input->post('rowid');
		$jumlah_produk = $this->input->post('jumlah_produk');

		for($a=0;$a<count($rowid);$a++){
			$data = array(
				'rowid'  => $rowid[$a],
				'qty'    => $jumlah_produk[$a]
				);
			$this->cart->update($data);
		}

		redirect(base_url().'index/keranjang/?alert=update-cart');
	}

	function pembayaran(){
		$this->load->database();
		$id = $this->session->userdata('user_id');
		$w = array(
			'id' => $id
			);
		$data['profil'] = $this->m_dah->edit_data($w,'user')->result();
		$this->load->helper('ongkir_helper');

		$this->load->view('cms/header');
		$this->load->view('cms/pembayaran');
		$this->load->view('cms/footer');
	}

	
	function pembayaran_nolog(){
		$this->load->database();
	
		$this->load->helper('ongkir_helper');
		$this->load->view('cms/header');
		$this->load->view('cms/pembayaran_nolog');
		$this->load->view('cms/footer');
	}

	function pembayaran_user_login(){
		$this->load->database();
		if($this->session->userdata('user_status')!='login'){
			$email = $this->input->post('email');
			$password = $this->input->post('password');

			$this->form_validation->set_rules(
				'email', 'Email',
				'trim|required|valid_email'
				);
			$this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[6]');
			if($this->form_validation->run()==true){
				$data = array(
					'email'=>$email,
					'password'=>md5($password),
					'status'=>1
					);
				$cek = $this->m_dah->edit_data($data,'user');
				if($cek->num_rows() > 0){
					$u_data = $cek->row();
					$session = array(
						'user_id' => $u_data->id,
						'user_nama' => $u_data->nama,
						'user_email' => $u_data->email,
						'user_status' => 'login'
						);
					$this->session->set_userdata($session);
					redirect(base_url().'index/pembayaran');
				}else{
					redirect(base_url().'index/pembayaran_user_login/?alert=login-gagal');
				}

			}else{
				$this->load->view('cms/header');
				$this->load->view('cms/pembayaran');
				$this->load->view('cms/footer');
			}
		}else{
			redirect(base_url());
		}
	}


	function order(){
		if($this->session->userdata('user_status') != "login"){
			redirect(base_url());
		}

		if(count($this->cart->contents())==0){
			redirect(base_url());
		}

		$this->load->database();
		$nama = $this->input->post('nama');
		$email = $this->input->post('email');
		$alamat = $this->input->post('alamat');
		$kecamatan = $this->input->post('kecamatan');
		$kodepos = $this->input->post('kodepos');
		$catatan = $this->input->post('catatan');
		$telp = $this->input->post('telp');
		// $metode = $this->input->post('metode');
		$prov_origin = $this->input->post('prov_origin');
		$city_origin = $this->input->post('city_origin');

		$pembayaran = $this->input->post('pembayaran');
		$ongkir = $this->input->post('ongkir');
		$kurir = $this->input->post('kurir');
		$rek_bank = $this->input->post('rek_bank');

		$pengiriman_dari = 23;

		$this->form_validation->set_rules('nama','Nama','required');
		$this->form_validation->set_rules('email','Email','required');

		$this->form_validation->set_rules('ongkir','ongkir','required');
		$this->form_validation->set_rules('alamat','Alamat','required');
		$this->form_validation->set_rules('kecamatan','Kecamatan','required');
		$this->form_validation->set_rules('kodepos','kodepos','required');
		$this->form_validation->set_rules('telp','telp','required');
		$this->form_validation->set_rules('prov_origin','prov_origin','required');
		$this->form_validation->set_rules('city_origin','city_origin','required');
		$this->form_validation->set_rules('pembayaran','pembayaran','required');

		$this->form_validation->set_rules('kurir','kurir','required');


		if($this->form_validation->run()==false){
			$this->load->helper('ongkir_helper');
			$this->load->view('cms/header');
			$this->load->view('cms/pembayaran');
			$this->load->view('cms/footer');
		}else{
			$inv = array(
				'user_id' => $this->session->userdata('user_id'),
				'nama' => $nama,
				'email' => $email,
				'tgl' => date('Y-m-d'),
				'telp' => $telp,
				'alamat' => $alamat,
				'kecamatan' => $kecamatan,
				'kodepos' => $kodepos,
				'kota' => $city_origin,
				'provinsi' => $prov_origin,
				'kurir' => $kurir,
				'ongkir' => $ongkir,
				'pembayaran' => $pembayaran,
				'rek_bank' => $rek_bank,
				'status' => 0
				);
			$this->m_dah->insert_data($inv,'invoice');
			$id_terakhir = $this->db->insert_id();
			$no = "#SXD-00".$id_terakhir;
			$w = array(
				'id' => $id_terakhir
				);
			$inv = array(
				'no' => $no
				);
			$this->m_dah->update_data($w,$inv,'invoice');

			foreach($this->cart->contents() as $item){
				$order = array(
					'order_invoice' => $id_terakhir,
					'order_produk' => $item['id'],
					'order_harga' => $item['price'],
					'order_jumlah' => $item['qty']
					);
				$this->m_dah->insert_data($order,'orders');
			}
			$this->cart->destroy();

			// email config
			$this->load->library('email');
			$subyek="Pengingat Pembayaran";
			$pesan="
			<html>
			<head>

		<style type='text/css'>
		 	@media only screen and (min-width: 1200px){
			.seti{
		    width:731px;height:40px;color:#fff; background-color: #ec5624; padding: 15px 32px; text-align: center;
			text-decoration: none; display: inline-block;
			font-size: 20px;
			border-radius:12px;
			box-shadow:0 4px 5px 0 rgba(0, 0, 0, 0.14),
			0 1px 10px 0 rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.2);
				}
				
			}
			@media only screen and (max-width: 400px){
				.seti{
				font-weight:800;color:#00c853;
				font-size: 28px;
					}		
				}
		
			
		</style>
		</head>
		<body>
		<div style=' padding-left:80px;padding-right:80px'>
			<p class='seti '>
			Sadean
			</p>
			<p style='font-size:18px; font-weight:600;margin-top:15px;'>
			Tagihan Transaksi <b>$no</b>
			</p>

			<p style='font-size:16px; font-weight:400;margin-top:15px;'>
			Hai <b>$nama</b> ! Silahkan melakukan pembayaran untuk tagihan pemesanan
			</p>
			<p style='font-weight:600;font-size:16px'>$no</p>

			<p style='font-size:18px; font-weight:600;margin-top:25px;'>
			Detail Pemesanan
			</p>
			<p style='border-bottom:2px solid #c1c2c3;margin-bottom:20px'></p>
			
			<p style='font-size:14px;color:#999!important'>Total harga</p>
			<p style='font-size:18px;font-weight:600;'>Rp.$pembayaran</p>

			<p style='font-size:14px;color:#999!important;margin-top:20px'>Metode pembayaran</p>
			<p style='font-size:18px;font-weight:600;'>Transfer Rekening Bank</p>

		</div>

		</body>
		</html>
	
			";

			$this->m_dah->kirim_email($email,$subyek,$pesan);

			if($this->email->send())
			{
				redirect(base_url().'user/invoice/?alert=order-sukses');
			}else
			{
				echo "gagal";
			}
			

			// end email

			// redirect(base_url().'user/invoice/?alert=order-sukses');

			// status
			// 0 belum bayar
			// 1 sudah bayar dan nunggu konfirmasi
			// 2 pembayaran dan order di tolak
			// 3 di terima dan di proses
		}
	}
// end order dengan log

// order nolog
function order_nolog(){

	if(count($this->cart->contents())==0){
		redirect(base_url());
	}

	$this->load->database();
	$fake_id=mt_rand(1000, 9999);
	$nama = $this->input->post('nama');
	$email = $this->input->post('email');
	$alamat = $this->input->post('alamat');
	$kecamatan = $this->input->post('kecamatan');
	$kodepos = $this->input->post('kodepos');
	$catatan = $this->input->post('catatan');
	$telp = $this->input->post('telp');
	// $metode = $this->input->post('metode');
	$prov_origin = $this->input->post('prov_origin');
	$city_origin = $this->input->post('city_origin');

	$pembayaran = $this->input->post('pembayaran');
	$ongkir = $this->input->post('ongkir');
	$kurir = $this->input->post('kurir');
	$rek_bank = $this->input->post('rek_bank');

	$pengiriman_dari = 23;

	$this->form_validation->set_rules('nama','Nama','required');
	$this->form_validation->set_rules('email','Email','required');

	$this->form_validation->set_rules('ongkir','ongkir','required');
	$this->form_validation->set_rules('alamat','Alamat','required');
	$this->form_validation->set_rules('kecamatan','Kecamatan','required');
	$this->form_validation->set_rules('kodepos','kodepos','required');
	$this->form_validation->set_rules('telp','telp','required');
	$this->form_validation->set_rules('prov_origin','prov_origin','required');
	$this->form_validation->set_rules('city_origin','city_origin','required');
	$this->form_validation->set_rules('pembayaran','pembayaran','required');

	$this->form_validation->set_rules('kurir','kurir','required');


	if($this->form_validation->run()==false){
		$this->load->helper('ongkir_helper');
		$this->load->view('cms/header');
		$this->load->view('cms/pembayaran_nolog');
		$this->load->view('cms/footer');
	}else{
		$inv = array(
			'user_id' => $fake_id,
			'nama' => $nama,
			'email' => $email,
			'tgl' => date('Y-m-d'),
			'telp' => $telp,
			'alamat' => $alamat,
			'kecamatan' => $kecamatan,
			'kodepos' => $kodepos,
			'kota' => $city_origin,
			'provinsi' => $prov_origin,
			'kurir' => $kurir,
			'ongkir' => $ongkir,
			'pembayaran' => $pembayaran,
			'rek_bank' => $rek_bank,
			'status' => 0
			);
		$this->m_dah->insert_data($inv,'invoice');
		$id_terakhir = $this->db->insert_id();
		$no = "#SXS-000".$id_terakhir;
		$w = array(
			'id' => $id_terakhir
			);
		$inv = array(
			'no' => $no
			);
		$this->m_dah->update_data($w,$inv,'invoice');

		foreach($this->cart->contents() as $item){
			$order = array(
				'order_invoice' => $id_terakhir,
				'order_produk' => $item['id'],
				'order_harga' => $item['price'],
				'order_jumlah' => $item['qty']
				);
			$this->m_dah->insert_data($order,'orders');
		}
		$this->cart->destroy();

		// email config
		$this->load->library('email');
		$subyek="Pengingat Pembayaran";
		$pesan="
		<html>
		<head>

	<style type='text/css'>
		 @media only screen and (min-width: 1200px){
		.seti{
		width:731px;height:40px;color:#fff; background-color: #ec5624; padding: 15px 32px; text-align: center;
		text-decoration: none; display: inline-block;
		font-size: 20px;
		border-radius:12px;
		box-shadow:0 4px 5px 0 rgba(0, 0, 0, 0.14),
		0 1px 10px 0 rgba(0, 0, 0, 0.12), 0 2px 4px -1px rgba(0, 0, 0, 0.2);
			}
			
		}
		@media only screen and (max-width: 400px){
			.seti{
			font-weight:800;color:#00c853;
			font-size: 28px;
				}		
			}
	
		
	</style>
	</head>
	<body>
	<div style=' padding-left:80px;padding-right:80px'>
		<p class='seti '>
		Sadean
		</p>
		<p style='font-size:18px; font-weight:600;margin-top:15px;'>
		Tagihan Transaksi <b>$no</b>
		</p>

		<p style='font-size:16px; font-weight:400;margin-top:15px;'>
		Hai <b>$nama</b> ! Silahkan melakukan pembayaran untuk tagihan pemesanan
		</p>

		<p style='font-weight:400;font-size:14px'>Harap di simpan Kode pembeli dan order dibawah ini:</p>
		<p style='font-weight:400;font-size:16px'>Kode Pembeli:&nbsp; <b>$fake_id</b></p>
		<p style='font-weight:400;font-size:16px'>Kode Order:&nbsp; <b>$no</b></p>

		<p style='font-weight:400;font-size:14px'>Gunakan Kode diatas untuk melakukan check pesanan!!:</p>

		<p style='font-size:18px; font-weight:600;margin-top:25px;'>
		Detail Pemesanan
		</p>
		<p style='border-bottom:2px solid #c1c2c3;margin-bottom:20px'></p>
		
		<p style='font-size:14px;color:#999!important'>Total harga</p>
		<p style='font-size:18px;font-weight:600;'>Rp.$pembayaran</p>

		<p style='font-size:14px;color:#999!important;margin-top:20px'>Metode pembayaran</p>
		<p style='font-size:18px;font-weight:600;'>Transfer Rekening Bank</p>

	</div>

	</body>
	</html>

		";

		$this->m_dah->kirim_email($email,$subyek,$pesan);

		if($this->email->send())
		{
			$where_inc = array(
				'user_id' => $fake_id,
				'no' => $no
				);
				$data = $this->m_dah->edit_data($where_inc,'invoice');
				if($data->num_rows() > 0){
					$mydata = $data->row();
					$session = array(
						'kode_id' => $mydata->id,
						'kode_beli' => $mydata->user_id,
						'kode_order' => $mydata->no,
						'kode_nama' => $mydata->nama,
						'kode_email' => $mydata->email,
						'kode_telp' => $mydata->telp,
						'kode_alamat' => $mydata->alamat,
						'kode_kurir' => $mydata->kurir,
						'kode_harga' => $mydata->pembayaran,
						'kode_ongkir' => $mydata->ongkir,
						'kode_resi' => $mydata->resi,
						'kode_tgl' => $mydata->tgl,
						'kode_status' => $mydata->status,
						'status_inolog' => 'kode_benar',
						);
					$this->session->set_userdata($session);
					redirect(base_url().'index/invoice_nolog/?alert=order-sukses');
				
				}
		}else
		{
			echo "gagal";
		}
		

		// end email

		// redirect(base_url().'user/invoice_nolog/?alert=order-sukses');

		// status
		// 0 belum bayar
		// 1 sudah bayar dan nunggu konfirmasi
		// 2 pembayaran dan order di tolak
		// 3 di terima dan di proses
	}
}

// end order nolog


	// rajaongkir
	function get_provinsi(){
		$curl = curl_init();

		curl_setopt_array($curl, array(
			CURLOPT_URL => "http://api.rajaongkir.com/starter/province?id=12",
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
			echo $response;
		}
	}


	function get_kota(){
		$curl = curl_init();
		$provinsi = $this->input->post('provinsi');
		curl_setopt_array($curl, array(
			CURLOPT_URL => "http://api.rajaongkir.com/starter/city?province=$provinsi",
			// CURLOPT_URL => "http://api.rajaongkir.com/starter/city?id=39&province=12",
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
			// echo $response;
			$city_ori = json_decode($response, TRUE);
			echo "<select name='city_origin' required class='form-control form-control-sm form-kota' id='city_origin'>";
			echo "<option class='' selected>Pilih Kota</option>";
			for ($x=1; $x < count($city_ori['rajaongkir']['results']); $x++) {
				echo "<option value='".$city_ori['rajaongkir']['results'][$x]['city_id']."' class='". $city_ori['rajaongkir']['results'][$x]['province_id']."' >".$city_ori['rajaongkir']['results'][$x]['type']." ".$city_ori['rajaongkir']['results'][$x]['city_name']."</option>";
			}
			echo "</select>";
		}
	}


	function get_cost(){
		$this->load->database();

		$kota = $this->input->post('kota');
		$id_prod = $this->input->post('id_prod');

		$w = array(
			'prod_id'=>$id_prod
			);
		$x = $this->m_dah->edit_data($w,'dah_products')->row();
		$weight = $x->prod_berat;

		$curl1 = curl_init();

		curl_setopt_array($curl1, array(
			CURLOPT_URL => "http://api.rajaongkir.com/starter/cost",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 30,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => "POST",
			CURLOPT_POSTFIELDS => "origin=23&destination=".$kota."&weight=".$weight."&courier=pos",

			CURLOPT_HTTPHEADER => array(
				"content-type: application/x-www-form-urlencoded",
				"key: 8f22875183c8c65879ef1ed0615d3371"
				),
			));

		$response1 = curl_exec($curl1);

		$curl2 = curl_init();

		curl_setopt_array($curl2, array(
			CURLOPT_URL => "http://api.rajaongkir.com/starter/cost",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 30,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => "POST",
			CURLOPT_POSTFIELDS => "origin=23&destination=".$kota."&weight=".$weight."&courier=tiki",

			CURLOPT_HTTPHEADER => array(
				"content-type: application/x-www-form-urlencoded",
				"key: 8f22875183c8c65879ef1ed0615d3371"
				),
			));

		$response2 = curl_exec($curl2);

		$curl3 = curl_init();

		curl_setopt_array($curl3, array(
			CURLOPT_URL => "http://api.rajaongkir.com/starter/cost",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 30,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => "POST",
			CURLOPT_POSTFIELDS => "origin=23&destination=".$kota."&weight=".$weight."&courier=jne",

			CURLOPT_HTTPHEADER => array(
				"content-type: application/x-www-form-urlencoded",
				"key: 8f22875183c8c65879ef1ed0615d3371"
				),
			));

		$response3 = curl_exec($curl3);

		$err1 = curl_error($curl1);
		$err2 = curl_error($curl2);
		$err3 = curl_error($curl3);

		curl_close($curl1);
		curl_close($curl2);
		curl_close($curl3);

		if ($err1) {
			echo "cURL Error #:" . $err1;
		}if ($err2) {
			echo "cURL Error #:" . $err2;
		}if ($err3) {
			echo "cURL Error #:" . $err3;
		} else {

			$data = json_decode($response1, true);
			for($k=0; $k < count($data['rajaongkir']['results']); $k++) {
				?>

				<div title="<?php echo strtoupper($data['rajaongkir']['results'][$k]['name']);?>">
					<h4>POS INDONESIA</h4>
					<table class="table table-striped table-bordered table-hover">
						<tr>
							<th class="text-center col-md-1">No.</th>
							<th>Jenis Layanan</th>
							<th class="text-center">ETD</th>
							<th class="text-center">Tarif</th>
						</tr>
						<?php
						for ($l=0; $l < count($data['rajaongkir']['results'][$k]['costs']); $l++) {
							?>
							<tr>
								<td class="text-center"><?php echo $l+1;?></td>
								<td>
									<b><p><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['service'];?></b><br/>
									<small><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['description'];?></small></p>
								</td>
								<td class="text-center"><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['cost'][0]['etd'];?> days</td>
								<td class="text-center"><?php echo number_format($data['rajaongkir']['results'][$k]['costs'][$l]['cost'][0]['value']);?></td>
							</tr>
							<?php
						}
						?>
					</table>
				</div>
				<?php
			}

			$data = json_decode($response2, true);
			for($k=0; $k < count($data['rajaongkir']['results']); $k++) {
				?>

				<div title="<?php echo strtoupper($data['rajaongkir']['results'][$k]['name']);?>">
					<h4>TIKI</h4>
					<table class="table table-striped table-bordered table-hover">
						<tr>
							<th class="text-center col-md-1">No.</th>
							<th>Jenis Layanan</th>
							<th class="text-center">ETD</th>
							<th class="text-center">Tarif</th>
						</tr>
						<?php
						for ($l=0; $l < count($data['rajaongkir']['results'][$k]['costs']); $l++) {
							?>
							<tr>
								<td class="text-center"><?php echo $l+1;?></td>
								<td>
									<b><p><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['service'];?></b><br/>
									<small><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['description'];?></small></p>
								</td>
								<td class="text-center"><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['cost'][0]['etd'];?> days</td>
								<td class="text-center"><?php echo number_format($data['rajaongkir']['results'][$k]['costs'][$l]['cost'][0]['value']);?></td>
							</tr>
							<?php
						}
						?>
					</table>
				</div>
				<?php
			}

			$data = json_decode($response3, true);
			for($k=0; $k < count($data['rajaongkir']['results']); $k++) {
				?>

				<div title="<?php echo strtoupper($data['rajaongkir']['results'][$k]['name']);?>">
					<h4>JNE</h4>
					<table class="table table-striped table-bordered table-hover">
						<tr>
							<th class="text-center col-md-1">No.</th>
							<th>Jenis Layanan</th>
							<th class="text-center">ETD</th>
							<th class="text-center">Tarif</th>
						</tr>
						<?php
						for ($l=0; $l < count($data['rajaongkir']['results'][$k]['costs']); $l++) {
							?>
							<tr>
								<td class="text-center"><?php echo $l+1;?></td>
								<td>
									<b><p><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['service'];?></b><br/>
									<small><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['description'];?></small></p>
								</td>
								<td class="text-center"><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['cost'][0]['etd'];?> days</td>
								<td class="text-center"><?php echo number_format($data['rajaongkir']['results'][$k]['costs'][$l]['cost'][0]['value']);?></td>
							</tr>
							<?php
						}
						?>
					</table>
				</div>
				<?php
			}

		}
	}


	function get_cost2(){
		$this->load->database();

		$kota = $this->input->post('kota');

		$weight = "";
		foreach ($this->cart->contents() as $i) {
			$id = $i['id'];
			$w = array(
				'prod_id'=>$id
				);
			$data = $this->m_dah->edit_data($w,'dah_products')->row();
			$weight += $data->prod_berat;
		}

		$curl1 = curl_init();

		curl_setopt_array($curl1, array(
			CURLOPT_URL => "http://api.rajaongkir.com/starter/cost",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 30,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => "POST",
			CURLOPT_POSTFIELDS => "origin=23&destination=".$kota."&weight=".$weight."&courier=pos",

			CURLOPT_HTTPHEADER => array(
				"content-type: application/x-www-form-urlencoded",
				"key: 8f22875183c8c65879ef1ed0615d3371"
				),
			));

		$response1 = curl_exec($curl1);

		$curl2 = curl_init();

		curl_setopt_array($curl2, array(
			CURLOPT_URL => "http://api.rajaongkir.com/starter/cost",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 30,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => "POST",
			CURLOPT_POSTFIELDS => "origin=23&destination=".$kota."&weight=".$weight."&courier=tiki",

			CURLOPT_HTTPHEADER => array(
				"content-type: application/x-www-form-urlencoded",
				"key: 8f22875183c8c65879ef1ed0615d3371"
				),
			));

		$response2 = curl_exec($curl2);

		$curl3 = curl_init();

		curl_setopt_array($curl3, array(
			CURLOPT_URL => "http://api.rajaongkir.com/starter/cost",
			CURLOPT_RETURNTRANSFER => true,
			CURLOPT_ENCODING => "",
			CURLOPT_MAXREDIRS => 10,
			CURLOPT_TIMEOUT => 30,
			CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
			CURLOPT_CUSTOMREQUEST => "POST",
			CURLOPT_POSTFIELDS => "origin=23&destination=".$kota."&weight=".$weight."&courier=jne",

			CURLOPT_HTTPHEADER => array(
				"content-type: application/x-www-form-urlencoded",
				"key: 8f22875183c8c65879ef1ed0615d3371"
				),
			));

		$response3 = curl_exec($curl3);

		$err1 = curl_error($curl1);
		$err2 = curl_error($curl2);
		$err3 = curl_error($curl3);

		curl_close($curl1);
		curl_close($curl2);
		curl_close($curl3);

		if ($err1) {
			echo "cURL Error #:" . $err1;
		}if ($err2) {
			echo "cURL Error #:" . $err2;
		}if ($err3) {
			echo "cURL Error #:" . $err3;
		} else {

			$data = json_decode($response1, true);
			for($k=0; $k < count($data['rajaongkir']['results']); $k++) {
				?>
			<!-- pt pos indonesia -->
				<div title="<?php echo strtoupper($data['rajaongkir']['results'][$k]['name']);?>">
					<h4 class="tx-16"><img src="<?php echo base_url()?>dah_image/system/logo-pos.png" style="width:100px;height:40px"></h4>
					<table class="table table-striped table-bordered table-hover">
						<tr class="tx-14">
							<th class="text-center col-md-1">No.</th>
							<th>Jenis Layanan</th>
							<th class="text-center">ETD</th>
							<th class="text-center">Tarif</th>
							<th class="text-center">Pilih Kurir</th>
						</tr>
						<?php
						for ($l=0; $l < count($data['rajaongkir']['results'][$k]['costs']); $l++) {
							?>
							<tr>
								<td class="text-center"><?php echo $l+1;?></td>
								<td>
									<b><p><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['service'];?></b><br/>
									<small><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['description'];?></small></p>
								</td>
								<td class="text-center"><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['cost'][0]['etd'];?></td>
								<td class="text-center tx-bold-600">Rp. <?php echo number_format($data['rajaongkir']['results'][$k]['costs'][$l]['cost'][0]['value']);?></td>
								<td class="text-center"><div class="radio"><label><input type="radio" name="kurir" class="pilih-kurir" id="<?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['cost'][0]['value'];?>" required="required" value="<?php echo $data['rajaongkir']['results'][$k]['code'];?> - <?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['service'];?>"><span> pilih</span></label></div></td>
							</tr>
							<?php
						}
						?>
					</table>
				</div>
				<?php
			}

			$data = json_decode($response2, true);
			for($k=0; $k < count($data['rajaongkir']['results']); $k++) {
				?>
				<!-- tiki -->
				<div title="<?php echo strtoupper($data['rajaongkir']['results'][$k]['name']);?>">
					<h4 class="tx-16"><img src="<?php echo base_url()?>dah_image/system/logo-tiki.png" style="width:100px;height:40px"></h4>
					<table class="table table-striped table-bordered table-hover">
						<tr class="tx-14">
							<th class="text-center col-md-1">No.</th>
							<th>Jenis Layanan</th>
							<th class="text-center">ETD</th>
							<th class="text-center">Tarif</th>
							<th class="text-center">Pilih Kurir</th>
						</tr>
						<?php
						for ($l=0; $l < count($data['rajaongkir']['results'][$k]['costs']); $l++) {
							?>
							<tr>
								<td class="text-center"><?php echo $l+1;?></td>
								<td>
									<b><p><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['service'];?></b><br/>
									<small><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['description'];?></small></p>
								</td>
								<td class="text-center"><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['cost'][0]['etd'];?> hari</td>
								<td class="text-center tx-bold-600">Rp. <?php echo number_format($data['rajaongkir']['results'][$k]['costs'][$l]['cost'][0]['value']);?></td>
								<td class="text-center"><div class="radio"><label><input type="radio" name="kurir" class="pilih-kurir" id="<?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['cost'][0]['value'];?>" required="required" value="<?php echo $data['rajaongkir']['results'][$k]['code'];?> - <?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['service'];?>"><span> pilih</span></label></div></td>
							</tr>
							<?php
						}
						?>
					</table>
				</div>
				<?php
			}

			$data = json_decode($response3, true);
			for($k=0; $k < count($data['rajaongkir']['results']); $k++) {
				?>

				<div title="<?php echo strtoupper($data['rajaongkir']['results'][$k]['name']);?>">
					<h4 class="tx-16"><img src="<?php echo base_url()?>dah_image/system/logo-jne.png" style="width:100px;height:40px"></h4>
					<table class="table table-striped table-bordered table-hover">
						<tr class="tx-14">
							<th class="text-center col-md-1">No.</th>
							<th>Jenis Layanan</th>
							<th class="text-center">ETD</th>
							<th class="text-center">Tarif</th>
							<th class="text-center">Pilih Kurir</th>
						</tr>
						<?php
						for ($l=0; $l < count($data['rajaongkir']['results'][$k]['costs']); $l++) {
							?>
							<tr>
								<td class="text-center"><?php echo $l+1;?></td>
								<td>
									<b><p><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['service'];?></b><br/>
									<small><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['description'];?></small></p>
								</td>
								<td class="text-center"><?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['cost'][0]['etd'];?> hari</td>
								<td class="text-center tx-bold-600">Rp. <?php echo number_format($data['rajaongkir']['results'][$k]['costs'][$l]['cost'][0]['value']);?></td>
								<td class="text-center"><div class="radio"><label><input type="radio" name="kurir" class="pilih-kurir" id="<?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['cost'][0]['value'];?>" required="required" value="<?php echo $data['rajaongkir']['results'][$k]['code'];?> - <?php echo $data['rajaongkir']['results'][$k]['costs'][$l]['service'];?>"><span> pilih</span></label></div></td>
							</tr>
							<?php
						}
						?>
					</table>
				</div>
				<?php
			}

		}
	}

	function get_kota2(){
		$curl = curl_init();
		$provinsi = $this->input->post('provinsi');
		curl_setopt_array($curl, array(
			CURLOPT_URL => "http://api.rajaongkir.com/starter/city?province=$provinsi",
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
			// echo $response;
			$city_ori = json_decode($response, TRUE);
			echo "<select name='city_origin' required class='form-control form-control-sm form-kota2' id='city_origin'>";
			echo "<option class='' selected>Pilih Kota</option>";
			for ($x=1; $x < count($city_ori['rajaongkir']['results']); $x++) {
				echo "<option value='".$city_ori['rajaongkir']['results'][$x]['city_id']."' class='". $city_ori['rajaongkir']['results'][$x]['province_id']."' >".$city_ori['rajaongkir']['results'][$x]['type']." ".$city_ori['rajaongkir']['results'][$x]['city_name']."</option>";
			}
			echo "</select>";
		}
	}

// start cari
public function cari($rowno=0){
	$this->load->database();
	$this->load->library('session');
	$this->load->library('pagination');		

	$search_text = "";
	if($this->input->post('submit') != NULL ){
	  $search_text = $this->input->post('item');
	  $this->session->set_userdata(array("search"=>$search_text));
	}else{
	  if($this->session->userdata('search') != NULL){
		$search_text = $this->session->userdata('search');
	  }
	}

	 // Row per page
	 $rowperpage = 8;
   
	 // Row position
	 if($rowno != 0){
	   $rowno = ($rowno-1) * $rowperpage;
	 }
	 // All records count
	 $allcount = $this->m_dah->getrecordProduct('Publish',$search_text);

	 // Get records
	 $users_record = $this->m_dah->search_product('Publish',$rowno,$rowperpage,$search_text)->result();

	 $config['first_link']       = '<i class="fa fa-angle-left"></i><i class="fa fa-angle-left"></i>';
	 $config['last_link']        = '<i class="fa fa-angle-right"></i><i class="fa fa-angle-right"></i>';
	 $config['next_link']        = '<i class="material-icons">chevron_right</i>';
	 $config['prev_link']        = '<i class="material-icons">chevron_left</i>';
	 $config['full_tag_open']    = '<ul class="pagination ">';
	 $config['full_tag_close']   = '</ul>';
	 $config['num_tag_open']     = '<li class="waves-effect">';
	 $config['num_tag_close']    = '</li>';
	 $config['cur_tag_open']     = '<li class="waves-effect active"><a class="page-link">';
	 $config['cur_tag_close']    = '</a></li>';
	 $config['next_tag_open']    = '<li class="waves-effect">';
	 $config['next_tagl_close']  = '</li>';
	 $config['prev_tag_open']    = '<li class="waves-effect">';
	 $config['prev_tagl_close']  = '/li>';
	 $config['first_tag_open']   = '<li class="waves-effect">';
	 $config['first_tagl_close'] = '</li>';
	 $config['last_tag_open']    = '<li class="waves-effect">';
	 $config['last_tagl_close']  = '</li>';				
		// Pagination Configuration
		$config['base_url'] = base_url().'index/cari';
		$config['use_page_numbers'] = TRUE;
		$config['total_rows'] = $allcount;
		$config['per_page'] = $rowperpage;

		// Initialize
		$this->pagination->initialize($config);
	
		$data['pagination'] = $this->pagination->create_links();
		$data['products'] = $users_record;
		$data['row'] = $rowno;
		$data['search'] = $search_text;
						
		$data['post'] = $this->m_dah->get_posts('Publish')->result();
		$data['title'] = "Produk - ".get_option('blog_name');
		$data['meta_description'] = strip_tags("Kumpulan source code aplikasi gratis terlengkap, sangat cocok untuk tugas kuliah, aplikasi tugas akhir dan aplikasi kerja praktek");
		$data['meta_keywords'] = strip_tags("Kumpulan source code aplikasi gratis terlengkap");		
		// $data['jumlah_product']=$this->m_dah->get_total_product()->row()->total;
		$data['category_product'] = $this->db->query("select * from dah_product_category where pcat_sub='0' order by pcat_name asc")->result();
			

		$this->load->view('cms/header',$data);	
		$this->load->view('cms/cari_page',$data);
		$this->load->view('cms/footer');


}

// end cari


function tentang(){
        $this->load->database();
    	$this->load->view('cms/header');	
		$this->load->view('cms/tentang_ini');
		$this->load->view('cms/footer');
}


// invoice no log start

function inolog_cek(){
	$this->load->database();

	$this->load->view('cms/header');
	$this->load->view('cms/invoice_nolog_page');
	$this->load->view('cms/footer');
}

function cek_inolog_act(){
		
		$this->load->database();
		$this->load->helper('ongkir_helper');
		$this->form_validation->set_rules('kode_beli','Kode Beli','required');
		$this->form_validation->set_rules('kode_order','Kode Order','required');
		
		if($this->form_validation->run() != true){
            $this->load->view('index/inolog_cek');
		}else{
			$kode_beli = $this->input->post('kode_beli');
			$kode_order = $this->input->post('kode_order');
			$where = array(
				'user_id' => $kode_beli,
				'no' => $kode_order
				);
				$data = $this->m_dah->edit_data($where,'invoice');
				if($data->num_rows() > 0){
					$mydata = $data->row();
					$session = array(
						'kode_id' => $mydata->id,
						'kode_beli' => $mydata->user_id,
						'kode_order' => $mydata->no,
						'kode_nama' => $mydata->nama,
						'kode_email' => $mydata->email,
						'kode_telp' => $mydata->telp,
						'kode_alamat' => $mydata->alamat,
						'kode_kurir' => $mydata->kurir,
						'kode_harga' => $mydata->pembayaran,
						'kode_ongkir' => $mydata->ongkir,
						'kode_resi' => $mydata->resi,
						'kode_tgl' => $mydata->tgl,
						'kode_status' => $mydata->status,
						'status_inolog' => 'kode_benar',
						);
					$this->session->set_userdata($session);
					redirect('index/invoice_nolog');
				}else{
					redirect(base_url().'index/inolog_cek/?alert=kode-failed');
				}		

		}	
	}

function invoice_nolog(){
	$this->load->database();
	if($this->session->userdata('status_inolog') != "kode_benar"){
		redirect(base_url());
	}
	$this->load->helper('ongkir_helper');
	$this->load->view('cms/header');
	$this->load->view('cms/invoice_nolog');
	$this->load->view('cms/footer');
}

function invoice_nolog_detail($id){
	if($this->session->userdata('status_inolog') != "kode_benar"){
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
		'user_id' => $this->session->userdata('kode_beli'),
		'id' => $id
		);
	$data['invoice'] = $this->m_dah->edit_data($w,'invoice')->result();

	if(count($data)>0){
		$this->load->view('cms/header');
		$this->load->view('cms/invoice_nolog_detail',$data);
		$this->load->view('cms/footer');
	}else{
		redirect(base_url());
	}
}


// upload slip nolog
function upload_slip_nolog(){
	if($this->session->userdata('status_inolog') != "kode_benar"){
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
			$this->load->view('cms/invoice_nolog_detail',$data);
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
			redirect(base_url().'index/invoice_nolog/?alert=slip-error');
		}else{
			$data = array('upload_data' => $this->upload->data());
			$file_name = $data['upload_data']['file_name'];
			$this->m_dah->update_data(array('id' => $id),array('slip' => $file_name,'status'=>1),'invoice');
			redirect(base_url().'index/invoice_nolog/?alert=slip-upload');
		}
	}
}

// end upload slip nolog



// end invoice nolog







// end index each }
}
