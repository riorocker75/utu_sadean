<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class petani extends CI_Controller {	

	function __construct(){
		parent::__construct();
		$this->load->model('m_dah');
		$this->load->helper('dah_helper');
		$this->load->library(array('session','form_validation'));
	}

	function index(){		
		$this->load->database();
		$this->load->model('m_dah');
        $this->load->helper('dah_helper');

        $this->load->view('jual/login-jual');
        
	}

	function login_act(){
		$this->load->database();			
		$this->form_validation->set_rules('uname','Username','required');	
		$this->form_validation->set_rules('pass','Password','required');	
		if($this->form_validation->run() != true){
            $this->load->view('jual/login-jual');
		}else{
			$uname = $this->input->post('uname');
			$pass = md5($this->input->post('pass'));
			$where = array(
				'user_login' => $uname,
				'user_pass' => $pass,
				'user_status' => '1'
				);
			$data = $this->m_dah->edit_data($where,'dah_users');
			if($data->num_rows() > 0){
				$mydata = $data->row();
				$session = array(
					'id' => $mydata->user_id,
					'username' => $mydata->user_login,
					'name' => $mydata->user_name,
					'level' => $mydata->user_level,
					'status' => 'login',
					);
				$this->session->set_userdata($session);
				redirect('admin');
			}else{
				redirect(base_url().'xlog/?alert=login-failed');
			}
		}
	}
	// end login-act


    // dafta act
    function daftar_petani(){		
		$this->load->database();
        $this->load->view('jual/daftar-jual');
        
    }
    
    function daftar_petani_act(){		
        $this->load->database();
		if($this->session->userdata('status')=='login'){
			redirect(base_url().'petani');
		}
		$email = $this->input->post('email');
        $user_name = $this->input->post('uname');
        $nama = $this->input->post('nama_lengkap');
		$level = "author";
        
        
		$password = $this->input->post('pass');

        $this->form_validation->set_rules('nama_lengkap','User Name','required');
		$this->form_validation->set_rules('uname',' Nama','required');
        
		$this->form_validation->set_rules(
			'email', 'Email',
			'trim|required|is_unique[dah_users.user_email]|valid_email',
			array(
				'required'      => 'Harus di isi.',
				'is_unique'     => 'Sudah ada yang mendaftar dengan email ini.'
				)
			);
		$this->form_validation->set_rules('pass', 'Password', 'trim|required|min_length[6]');
		if($this->form_validation->run()==true){
			$data = array(
				'user_name'=>$nama,
				'user_login'=>$user_name,
                'user_email'=>$email,
				'user_pass'=>md5($password),
                'user_status'=>1,
                'user_level' =>$level,
				);
			$this->m_dah->insert_data($data,'dah_users');
			redirect(base_url().'daftar-petani/?alert=daftar-sukses');
		}else{
            $this->load->view('jual/daftar-jual');

		}
        

     

	}

    // end daftar

























}
