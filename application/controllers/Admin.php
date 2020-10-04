<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Admin extends CI_Controller {

	function __construct(){
		parent::__construct();
		date_default_timezone_set('Asia/Jakarta');
		$this->load->helper('url');
		$this->load->helper('dah_helper');
		$this->load->library(array('session','form_validation','cart'));	
		$this->load->model('m_dah');
		if($this->session->userdata('status') != "login"){
			redirect(base_url());
		}
	}	

	public function index(){
		$this->load->database();			
		$data['pageview'] = $this->m_dah->get_pageview(date('Y-m-d'))->num_rows();
		$data['visitor'] = $this->m_dah->get_visitor(date('Y-m-d'))->num_rows();
		$data['ft_visitor'] = $this->m_dah->get_ftvisitor(date('Y-m-d'))->num_rows();
		$data['artikel'] = $this->m_dah->get_data('dah_posts')->num_rows();
		$data['os'] = $this->m_dah->get_group_visitor('dah_visitor','user_os',date('Y-m-d'))->result();
		$data['browser'] = $this->m_dah->get_group_visitor('dah_visitor','user_browser',date('Y-m-d'))->result();
		$data['device'] = $this->m_dah->get_group_visitor('dah_visitor','user_device',date('Y-m-d'))->result();
		$data['referrer'] = $this->m_dah->get_referrer(date('Y-m-d'))->result();
		$this->load->view('admin/v_header');
		$this->load->view('admin/v_index',$data);
		$this->load->view('admin/v_footer');
	}

	function logout(){
		$this->session->sess_destroy();
		redirect(base_url());
	}

	function category(){
		$this->load->database();		
		$data['category'] = $this->m_dah->get_data('dah_category')->result();
		$this->load->view('admin/v_header');
		$this->load->view('admin/v_category',$data);
		$this->load->view('admin/v_footer');
	}	

	function category_act(){
		$this->load->database();		
		$this->form_validation->set_rules('category','Category Name','required');
		if($this->form_validation->run() != true){
			$data['category'] = $this->m_dah->get_data('dah_category')->result();
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_category',$data);
			$this->load->view('admin/v_footer');
		}else{
			$category_name = $this->input->post('category');
			$slug_cat = create_slug($category_name);
			$data = array(
				'category_name' => $category_name,
				'category_url' => $slug_cat,
				'category_parent' => '0'
				);

			$this->m_dah->insert_data($data,'dah_category');
			redirect(base_url().'admin/category/?alert=add');
		}		
	}

	function category_edit($id){
		$this->load->database();	
		if($id == ""){
			redirect('admin/category');
		}else{			
			$where = array(
				'category_id' => $id
				);	
			$data['edit'] = $this->m_dah->edit_data($where,'dah_category')->result();
			$data['category'] = $this->m_dah->get_data('dah_category')->result();
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_category_edit',$data);
			$this->load->view('admin/v_footer');
		}
	}

	function category_update(){
		$this->load->database();		
		$id = $this->input->post('id');
		$this->form_validation->set_rules('category','Category Name','required');
		if($this->form_validation->run() != true){
			$where = array(
				'category_id' => $id
				);	
			$data['edit'] = $this->m_dah->edit_data($where,'dah_category')->result();
			$data['category'] = $this->m_dah->get_data('dah_category')->result();
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_category_edit',$data);
			$this->load->view('admin/v_footer');
		}else{

			$category_name = $this->input->post('category');
			$slug_cat = create_slug($category_name);

			$data = array(
				'category_name' => $category_name,
				'category_url' => $slug_cat,
				'category_parent' => '0'
				);
			
			$w = array(
				'category_id' => $id
				);
			$this->m_dah->update_data($w,$data,'dah_category');
			redirect(base_url().'admin/category/?alert=update');
		}		
	}

	function category_delete($id){
		$this->load->database();
		if($id == ""){
			redirect('admin/category');
		}else{
			$wt = array(
				'taxonomy_child' => $id
				);
			$this->m_dah->delete_data($wt,'dah_taxonomy');

			$where = array(
				'category_id' => $id
				);
			$this->m_dah->delete_data($where,'dah_category');
			redirect('admin/category/?alert=delete');
		}
	}

	function settings(){
		$this->load->database();
		$this->load->view('admin/v_header');
		$this->load->view('admin/v_settings');
		$this->load->view('admin/v_footer');
	}

	function settings_act(){
		$this->load->database();		
		$blog_name = $this->input->post('blog_name');
		$blog_description = $this->input->post('blog_description');		
		$this->m_dah->update_data(array('option_name' => 'blog_name'),array('option_value' => $blog_name),'dah_options');
		$this->m_dah->update_data(array('option_name' => 'blog_description'),array('option_value' => $blog_description),'dah_options');

		$rand = rand();
		$config['upload_path'] = './dah_image/system/';
		$config['allowed_types'] = 'gif|jpg|png';				
		$config['file_name'] = $rand.'_'.$_FILES['blog_logo']['name'];				
		$this->load->library('upload', $config);

		if($_FILES['blog_logo']['name'] != ""){			
			if(!$this->upload->do_upload('blog_logo')){			
				$error = array('error' => $this->upload->display_errors());			
				$this->load->view('admin/v_header');
				$this->load->view('admin/v_settings',$error);
				$this->load->view('admin/v_footer');
			}else{
				$data = array('upload_data' => $this->upload->data());			
				$file_name = $data['upload_data']['file_name'];
				@chmod("./dah_image/system/" . $this->m_dah->get_option('blog_logo'), 0777);
				@unlink('./dah_image/system/' . $this->m_dah->get_option('blog_logo'));
				$this->m_dah->update_data(array('option_name' => 'blog_logo'),array('option_value' => $file_name),'dah_options');			
				redirect('admin/settings/?alert=setting-update');			
			}
		}else{			
			redirect('admin/settings/?alert=setting-update');			
		}		
	}

	// page
	function page(){		
		$this->load->database();		
		$data['page'] = $this->m_dah->get_data('dah_pages')->result();
		$this->load->view('admin/v_header');
		$this->load->view('admin/v_page',$data);
		$this->load->view('admin/v_footer');	
	}

	function page_add(){		
		$this->load->database();					
		$this->load->view('admin/v_header');
		$this->load->view('admin/v_page_add');
		$this->load->view('admin/v_footer');	
	}

	function page_add_act(){		
		$this->load->database();		
		$page_tittle = $this->input->post('page_tittle');
		$page_content = $this->input->post('page_content');
		$page_status = $this->input->post('save');
		$this->form_validation->set_rules('page_tittle','Page Tittle','required');
		if($this->form_validation->run() != true){
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_page_add');
			$this->load->view('admin/v_footer');
		}else{			
			$url = create_slug($page_tittle);	

			// $w = array(
			// 	'page_tittle' => $page_tittle
			// 	);
			// $cek_sama = $this->m_dah->edit_data($w,'dah_pages')->num_rows();
			// if($cek_sama > 0){
			// 	$c = $cek_sama + 1;
			// 	$u = $url.$c;
			// }else{
			// 	$u = $url;
			// }

			$data = array(
				'page_tittle' => $page_tittle,
				'page_url' => $url,
				'page_content' => $page_content,
				'page_status' => $page_status
				);
			$this->m_dah->insert_data($data,'dah_pages');
			$id_terakhir = $this->db->insert_id();			

			// add cover image 
			if($_FILES['page_cover']['name'] == ""){				
				redirect(base_url().'admin/page/?alert=page-saved');
			}else{
				$config['upload_path'] = './dah_image/page/';
				$config['allowed_types'] = 'gif|jpg|png';				
				$this->load->library('upload', $config);
				$this->upload->do_upload('page_cover');
				$data = array('upload_data' => $this->upload->data());			
				$file_name = $data['upload_data']['file_name'];
				$this->m_dah->update_data(array('page_id' => $id_terakhir),array('page_cover' => $file_name),'dah_pages');			
				redirect(base_url().'admin/page/?alert=page-saved');	
			}
			// end add cover image			
		}			
	}

	function page_delete($id){
		$this->load->database();
		if($id == ""){
			redirect('admin/page');
		}else{
			$where = array(
				'page_id' => $id
				);

			$data = $this->m_dah->edit_data($where,'dah_pages')->row();
			@chmod("./dah_image/page/" . $data->page_cover, 0777);
			@unlink('./dah_image/page/' . $data->page_cover);

			$this->m_dah->delete_data($where,'dah_pages');
			redirect('admin/page/?alert=page-delete');
		}
	}

	function page_edit($id){
		$this->load->database();	
		if($id == ""){
			redirect('admin/pages');
		}else{			
			$where = array(
				'page_id' => $id
				);	
			$data['page'] = $this->m_dah->edit_data($where,'dah_pages')->result();			
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_page_edit',$data);
			$this->load->view('admin/v_footer');
		}
	}

	function page_update(){		
		$this->load->database();		
		$page_id = $this->input->post('id');
		$page_tittle = $this->input->post('page_tittle');
		$page_content = $this->input->post('page_content');
		$page_status = $this->input->post('save');
		$where = array(
				'page_id' => $page_id
				);	
		$this->form_validation->set_rules('page_tittle','Page Tittle','required');
		if($this->form_validation->run() != true){			
			$data['page'] = $this->m_dah->edit_data($where,'dah_pages')->result();			
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_page_edit',$data);
			$this->load->view('admin/v_footer');
		}else{			
			$url = create_slug($page_tittle);					
			$data = array(
				'page_tittle' => $page_tittle,
				'page_url' => $url,
				'page_content' => $page_content,
				'page_status' => $page_status
				);
			$this->m_dah->update_data($where,$data,'dah_pages');			
			// add cover image 
			if($_FILES['page_cover']['name'] == ""){				
				redirect(base_url().'admin/page/?alert=page-saved');
			}else{
				$config['upload_path'] = './dah_image/page/';
				$config['allowed_types'] = 'gif|jpg|png';				
				$this->load->library('upload', $config);
				$this->upload->do_upload('page_cover');
				$data = array('upload_data' => $this->upload->data());			
				$file_name = $data['upload_data']['file_name'];
				$this->m_dah->update_data(array('page_id' => $page_id),array('page_cover' => $file_name),'dah_pages');			
				redirect(base_url().'admin/page/?alert=page-saved');	
			}
			// end add cover image			
		}			
	}

	function hapus_cover_page(){
		$this->load->database();
		$id = $this->input->post('id');
		$where = array(
			'page_id' => $id
			);
		$data = $this->m_dah->edit_data($where,'dah_pages')->row();
		@chmod("./dah_image/page/" . $data->page_cover, 0777);
		@unlink('./dah_image/page/' . $data->page_cover);

		$update = array(
			'page_cover' => ""
			);
		$this->m_dah->update_data($where,$update,'dah_pages');
	}
	// end page

	// post
	function posts(){		
		$this->load->database();		
		// $data['posts'] = $this->m_dah->get_data_order('desc','post_id','dah_posts')->result();
		$data['posts'] = $this->m_dah->get_posts('publish')->result();
		$this->load->view('admin/v_header');
		$this->load->view('admin/v_post',$data);
		$this->load->view('admin/v_footer');	
	}

	function posts_draft(){		
		$this->load->database();				
		$data['posts'] = $this->m_dah->get_posts('draft')->result();
		$this->load->view('admin/v_header');
		$this->load->view('admin/v_post_draft',$data);
		$this->load->view('admin/v_footer');	
	}

	function posts_trash(){		
		$this->load->database();				
		$data['posts'] = $this->m_dah->get_posts('trash')->result();
		$this->load->view('admin/v_header');
		$this->load->view('admin/v_post_trash',$data);
		$this->load->view('admin/v_footer');	
	}

	function post_add(){		
		$this->load->database();			
		$data['category']=$this->m_dah->get_data('dah_category')->result();		
		$this->load->view('admin/v_header');
		$this->load->view('admin/v_post_add',$data);
		$this->load->view('admin/v_footer');	
	}

	function post_add_act(){		
		$this->load->database();		
		$post_tittle = $this->input->post('post_tittle');
		$post_content = $this->input->post('post_content');
		$post_status = $this->input->post('save');
		$this->form_validation->set_rules('post_tittle','Post Tittle','required');		
		
		if($this->form_validation->run() != true){
			$data['category']=$this->m_dah->get_data('dah_category')->result();		
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_post_add',$data);
			$this->load->view('admin/v_footer');
		}else{								
			$url = create_slug($post_tittle);					
			$data = array(				
				'post_author' => $this->session->userdata('id'),
				'post_date' => date('Y-m-d'),
				'post_tittle' => $post_tittle,				
				'post_url' => $url,
				'post_content' => $post_content,
				'post_status' => $post_status
				);
			$this->m_dah->insert_data($data,'dah_posts');
			$id_terakhir = $this->db->insert_id();			

			// insert category
			if(isset($_POST['post_cat'])){
				$cat = $_POST['post_cat'];	
				$jumlah_category = count($cat);							
				for($c=0;$c<$jumlah_category;$c++){								
					$taxonomy = array(
						'taxonomy_parent' => $id_terakhir,
						'taxonomy_child' => $cat[$c],
						'taxonomy' => 'post_category'
						);
					$this->m_dah->insert_data($taxonomy,'dah_taxonomy');
				}				
			}else{
				$taxonomy = array(
					'taxonomy_parent' => $id_terakhir,
					'taxonomy_child' => '1',
					'taxonomy' => 'post_category'
					);
				$this->m_dah->insert_data($taxonomy,'dah_taxonomy');
			}								
			// end insert_category			

			// add cover image 
			if($_FILES['post_cover']['name'] == ""){				
				redirect(base_url().'admin/posts/?alert=post-saved');
			}else{
				$config['upload_path'] = './dah_image/post/';
				$config['allowed_types'] = 'gif|jpg|png';				
				$this->load->library('upload', $config);
				$this->upload->do_upload('post_cover');
				$data = array('upload_data' => $this->upload->data());			
				$file_name = $data['upload_data']['file_name'];
				$this->m_dah->update_data(array('post_id' => $id_terakhir),array('post_cover' => $file_name),'dah_posts');			
				redirect(base_url().'admin/posts/?alert=post-saved');	
			}
			// end add cover image			
		}			
	}

	function post_edit($id){
		$this->load->database();	
		if($id == ""){
			redirect('admin/posts');
		}else{			
			$where = array(
				'post_id' => $id
				);	
			$data['category']=$this->m_dah->get_data('dah_category')->result();		
			$data['posts'] = $this->m_dah->edit_data($where,'dah_posts')->result();			
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_post_edit',$data);
			$this->load->view('admin/v_footer');
		}
	}

	function hapus_cover_post(){
		$this->load->database();
		$id = $this->input->post('id');
		$where = array(
			'post_id' => $id
			);
		$data = $this->m_dah->edit_data($where,'dah_posts')->row();
		@chmod("./dah_image/post/" . $data->post_cover, 0777);
		@unlink('./dah_image/post/' . $data->post_cover);

		$update = array(
			'post_cover' => ""
			);
		$this->m_dah->update_data($where,$update,'dah_posts');
	}

	function post_to_trash($id){
		$this->load->database();
		if($id == ""){
			redirect('admin/posts');
		}else{
			$where = array(
				'post_id' => $id
				);
			$data = array(
				'post_status' => "trash"
				);

			$this->m_dah->update_data($where,$data,'dah_posts');
			redirect('admin/posts/?alert=post-trash');
		}
	}

	function post_delete($id){
		$this->load->database();
		if($id == ""){
			redirect('admin/posts');
		}else{
			$where = array(
				'post_id' => $id
				);

			$data = $this->m_dah->edit_data($where,'dah_posts')->row();
			@chmod("./dah_image/post/" . $data->post_cover, 0777);
			@unlink('./dah_image/post/' . $data->post_cover);

			// hapus di taxonomy
			$w = array(
				'taxonomy_parent' => $id,
				'taxonomy' => 'post_category'
				);
			$this->m_dah->delete_data($w,'dah_taxonomy');
			// end hapus di taxonomy

			$this->m_dah->delete_data($where,'dah_posts');
			redirect('admin/posts_trash/?alert=post-delete');
		}
	}

	function post_update(){		
		$this->load->database();		
		$post_id = $this->input->post('id');
		$post_tittle = $this->input->post('post_tittle');
		$post_content = $this->input->post('post_content');
		$post_status = $this->input->post('save');
		$where = array(
			'post_id' => $post_id
			);
		$this->form_validation->set_rules('post_tittle','Post Tittle','required');
		if($this->form_validation->run() != true){						
			$data['posts'] = $this->m_dah->edit_data($where,'dah_posts')->result();			
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_post_edit',$data);
			$this->load->view('admin/v_footer');
		}else{			
			$url = create_slug($post_tittle);					
			$data = array(								
				'post_tittle' => $post_tittle,				
				'post_url' => $url,
				'post_content' => $post_content,
				'post_status' => $post_status
				);
			$this->m_dah->update_data($where,$data,'dah_posts');		

			// insert category
			if(isset($_POST['post_cat'])){
				$cat = $_POST['post_cat'];
				
				// hapus di taxonomy
				$w = array(
					'taxonomy_parent' => $post_id,
					'taxonomy' => 'post_category'
					);
				$this->m_dah->delete_data($w,'dah_taxonomy');
				// end hapus di taxonomy

				$jumlah_category = count($cat);							
				for($c=0;$c<$jumlah_category;$c++){								
					$taxonomy = array(
						'taxonomy_parent' => $post_id,
						'taxonomy_child' => $cat[$c],
						'taxonomy' => 'post_category'
						);
					$this->m_dah->insert_data($taxonomy,'dah_taxonomy');
				}				
			}else{

				// hapus di taxonomy
				$w = array(
					'taxonomy_parent' => $post_id,
					'taxonomy' => 'post_category'
					);
				$this->m_dah->delete_data($w,'dah_taxonomy');
				// end hapus di taxonomy

				$taxonomy = array(
					'taxonomy_parent' => $post_id,
					'taxonomy_child' => '1',
					'taxonomy' => 'post_category'
					);
				$this->m_dah->insert_data($taxonomy,'dah_taxonomy');
			}								
			// end insert_category				

			// add cover image 
			if($_FILES['post_cover']['name'] == ""){				
				redirect(base_url().'admin/posts/?alert=post-saved');
			}else{
				$config['upload_path'] = './dah_image/post/';
				$config['allowed_types'] = 'gif|jpg|png';				
				$this->load->library('upload', $config);
				$this->upload->do_upload('post_cover');
				$data = array('upload_data' => $this->upload->data());			
				$file_name = $data['upload_data']['file_name'];
				$this->m_dah->update_data(array('post_id' => $post_id),array('post_cover' => $file_name),'dah_posts');			
				redirect(base_url().'admin/posts/?alert=post-saved');	
			}
			// end add cover image			
		}			
	}
	// end post

	// menu
	function menu(){
		$this->load->database();
		$data['mother'] = $this->m_dah->get_menu_mother()->result();		
		$data['page'] = $this->m_dah->get_data('dah_pages')->result();
		$data['category'] = $this->m_dah->get_data('dah_category')->result();
		$this->load->view('admin/v_header');
		$this->load->view('admin/v_menu',$data);
		$this->load->view('admin/v_footer');
	}

	function menu_delete(){
		$this->load->database();
		$mother = $this->uri->segment('3');
		if($mother == ""){
			redirect('admin/menu');
		}else{
			$where = array(
				'menu_mother' => $mother
				);			
			$this->m_dah->delete_data($where,'dah_menu');
			redirect('admin/menu/?alert=menu-delete');
		}
	}

	function menu_act(){
		$this->load->database();
		$this->form_validation->set_rules('menu','Menu Name','required');
		if($this->form_validation->run() != true){
			$data['mother'] = $this->m_dah->get_menu_mother()->result();
			$data['page'] = $this->m_dah->get_data('dah_pages')->result();
			$data['category'] = $this->m_dah->get_data('dah_category')->result();
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_menu',$data);
			$this->load->view('admin/v_footer');
		}else{
			$menu_mother = $this->input->post('menu');
			$data = array(
				'menu_mother' => create_slug($menu_mother),
				'menu_name' => "0",
				'menu_url' => "0",
				'menu_parent' => "0",
				'menu_sort' => "0"
				);
			$this->m_dah->insert_data($data,'dah_menu');
			redirect('admin/menu/?alert=menu-saved');
		}		
	}

	function menu_item_act(){
		$this->load->database();
		$this->form_validation->set_rules('menu_item_mother','Menu Item Mother','required');
		$this->form_validation->set_rules('menu_item_name','Menu Item Name','required');
		if($this->form_validation->run() != true){
			$data['mother'] = $this->m_dah->get_menu_mother()->result();
			$data['page'] = $this->m_dah->get_data('dah_pages')->result();
			$data['category'] = $this->m_dah->get_data('dah_category')->result();
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_menu',$data);
			$this->load->view('admin/v_footer');
		}else{
			$menu_name = $this->input->post('menu_item_name');
			$menu_mother = $this->input->post('menu_item_mother');
			$menu_parent = $this->input->post('menu_item_parent');

			$url_page = $this->input->post('menu_item_url_page');
			$url_category = $this->input->post('menu_item_url_category');
			$url_manual = $this->input->post('menu_item_url_manual');

			if($url_page != ""){
				$url = $url_page;
			}else if($url_category != ""){
				$url = $url_category;
			}else{
				$url = $url_manual;
			}

			$where = array(
				'menu_mother' => $menu_mother
				);

			$jumlah_sama = $this->m_dah->edit_data($where,'dah_menu')->num_rows();
			$sort = $jumlah_sama + 1;
			$data = array(
				'menu_mother' => $menu_mother,
				'menu_name' => $menu_name,
				'menu_url' => $url,
				'menu_parent' => $menu_parent,
				'menu_sort' => $sort
				);
			$this->m_dah->insert_data($data,'dah_menu');
			redirect('admin/menu/?alert=menu-saved');
		}		
	}

	function menu_item_delete($id){
		$this->load->database();
		$mother = $this->uri->segment('3');
		if($id == ""){
			redirect('admin/menu');
		}else{
			$where_update = array(
				'menu_parent' => $id
				);
			$data_update = array(
				'menu_parent' => "0"
				);
			$this->m_dah->update_data($where_update,$data_update,'dah_menu');

			$where_delete = array(
				'menu_id' => $id
				);			
			$this->m_dah->delete_data($where_delete,'dah_menu');
			redirect('admin/menu/?alert=menu-delete');
		}
	}

	function menu_item_edit($id){
		$this->load->database();		
		if($id == ""){
			redirect('admin/menu');
		}else{			
			$where = array(
				'menu_id' => $id
				);
			$data['edit'] = $this->m_dah->edit_data($where,'dah_menu')->result();			
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_menu_edit',$data);
			$this->load->view('admin/v_footer');
		}
	}

	function menu_item_update(){
		$this->load->database();	
		$id = $this->input->post('id');
		$name = $this->input->post('menu_item_name');
		$url = $this->input->post('menu_item_url_manual');		
		$where = array(
				'menu_id' => $id
				);
		$this->form_validation->set_rules('menu_item_name','Menu Item Name','required');	
		$this->form_validation->set_rules('menu_item_url_manual','Menu Item Url','required');	
		if($this->form_validation->run() != false){
			$data = array(
				'menu_name' => $name,
				'menu_url' => $url
				);
			$this->m_dah->update_data($where,$data,'dah_menu');
			redirect('admin/menu/?alert=menu-saved');
		}else{						
			$data['edit'] = $this->m_dah->edit_data($where,'dah_menu')->result();			
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_menu_edit',$data);
			$this->load->view('admin/v_footer');
		}
	}
	// end menu

	// user
	function users(){
		$this->load->database();
		$data['users'] = $this->m_dah->get_data('dah_users')->result();
		$this->load->view('admin/v_header');		
		$this->load->view('admin/v_users',$data);		
		$this->load->view('admin/v_footer');		
	}

	function user_add(){
		$this->load->database();		
		$this->load->view('admin/v_header');		
		$this->load->view('admin/v_users_add');		
		$this->load->view('admin/v_footer');		
	}

	function user_add_act(){
		$this->load->database();		
		$this->form_validation->set_rules('name','Name','required');
		$this->form_validation->set_rules('email','email','required');
		$this->form_validation->set_rules('username','username','required');
		$this->form_validation->set_rules('password','password','required');
		if($this->form_validation->run() == false){
			$this->load->view('admin/v_header');		
			$this->load->view('admin/v_users_add');		
			$this->load->view('admin/v_footer');
		}else{			
			$data = array(
				'user_name' => $this->input->post('name'),
				'user_email' => $this->input->post('email'),
				'user_login' => $this->input->post('username'),
				'user_pass' => md5($this->input->post('password')),
				'user_level' => $this->input->post('level'),
				'user_status' => $this->input->post('status')
				);
			$this->m_dah->insert_data($data,'dah_users');			
			redirect('admin/users/?alert=user-add');	
		}		
	}

	function cek_username_ajax(){
		$this->load->database();
		$val = $this->input->post('val');		
		echo $this->m_dah->edit_data(array('user_login' => $val),'dah_users')->num_rows();
	}

	function user_edit($id){
		$this->load->database();	
		if($id == ""){
			redirect('admin/users');
		}else{			
			$where = array(
				'user_id' => $id
				);				
			$data['user'] = $this->m_dah->edit_data($where,'dah_users')->result();			
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_users_edit',$data);
			$this->load->view('admin/v_footer');
		}
	}

	function user_update(){
		$this->load->database();		
		$id = $this->input->post('id');
		$this->form_validation->set_rules('name','Name','required');
		$this->form_validation->set_rules('email','email','required');			
		if($this->form_validation->run() == false){
			$where = array(
				'user_id' => $id
				);				
			$data['user'] = $this->m_dah->edit_data($where,'dah_users')->result();			
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_users_edit',$data);
			$this->load->view('admin/v_footer');
		}else{			
			$password = $this->input->post('password');
			$where = array(
				'user_id' => $id
				);
			if($password != ""){
				$data = array(
					'user_name' => $this->input->post('name'),
					'user_email' => $this->input->post('email'),
					// 'user_login' => $this->input->post('username'),
					'user_pass' => md5($password),
					'user_level' => $this->input->post('level'),
					'user_status' => $this->input->post('status')
					);				
			}else{
				$data = array(
					'user_name' => $this->input->post('name'),
					'user_email' => $this->input->post('email'),
					// 'user_login' => $this->input->post('username'),					
					'user_level' => $this->input->post('level'),
					'user_status' => $this->input->post('status')
					);		
			}			
			$this->m_dah->update_data($where,$data,'dah_users');			
			redirect('admin/users/?alert=user-update');	
		}				
	}

	// end user

	function widget(){
		$this->load->database();		
		$this->load->view('admin/v_header');		
		$this->load->view('admin/v_widget');		
		$this->load->view('admin/v_footer');
	}

	function tambah_widget(){
		$this->load->database();
		$widget = $this->input->post('widget');
		$location = $this->input->post('location');

		$w = array(			
			'widget_position' => $location
			);

		$get = $this->m_dah->edit_data($w,'dah_widget')->num_rows();
		$sort = $get+1;
		$insert = array(
			'widget_name' => $widget,
			'widget_position' => $location,
			'widget_sort' => $sort
			);
		$this->m_dah->insert_data($insert,'dah_widget');		
	}

	function hapus_widget($id){
		$this->load->database();
		$where = array(
			'widget_id' => $id
			);
		$this->m_dah->delete_data($where,'dah_widget');
		redirect('admin/widget/?alert=widget-delete');
	}

	function update_option(){
		$this->load->database();
		$option = $this->input->post('option');
		$value = $this->input->post('value');
		$where = array(
			'option_name' => $option
			);
		$data = array(
			'option_value' => $value
			);
		$this->m_dah->update_data($where,$data,'dah_options');
	}

	function update_sort_widget(){
		$this->load->database();

		$widget = $this->input->post('widget');
		$posisi = $this->input->post('posisi');	
				
		for($x=0;$x<count($widget);$x++){
			$where = array(
				'widget_position' => $posisi,
				'widget_id' => $widget[$x]
				);
			$data = array(
				'widget_sort' => $x
				);
			$this->m_dah->update_data($where,$data,'dah_widget');
		}
	}

	function update_sort_menu(){
		$this->load->database();		
		$menu = $this->input->post('menu');		
		$mother = $this->input->post('mother');

		$mother_tujuan = $this->input->post('mother_tujuan');						
		$selected = $this->input->post('selected');		
		$parent = $this->input->post('parent');		

		// pindah tempat
		$where_selected = array(
			'menu_id' => $selected
			);
		$update_parent = array(
			'menu_parent' => $parent,
			'menu_mother' => $mother_tujuan
			);
		$this->m_dah->update_data($where_selected,$update_parent,'dah_menu');
		$where_anak_parent = array(
			'menu_parent' => $selected
			);
		$update_anak_parent = array(
			'menu_mother' => $mother_tujuan
			);
		$this->m_dah->update_data($where_anak_parent,$update_anak_parent,'dah_menu');
		// pindah tempat

		// urutkan
		for($x=0;$x<count($menu);$x++){
			$where = array(
				'menu_mother' => $mother,
				'menu_id' => $menu[$x]
				);
			$data = array(
				'menu_sort' => $x
				);
			$this->m_dah->update_data($where,$data,'dah_menu');
		}
		// urutkan
		
	}



	// products category
	function product_category(){
		$this->load->database();		
		$w = array('pcat_sub' => 0);
		$data['data'] = $this->m_dah->edit_data($w,'dah_product_category')->result();
		$data['category'] = $this->m_dah->get_data('dah_product_category')->result();
		$this->load->view('admin/v_header');
		$this->load->view('admin/v_product_category',$data);
		$this->load->view('admin/v_footer');
	}	

	function product_category_act(){
		$this->load->database();		
		$this->form_validation->set_rules('nama','Category Name','required');
		if($this->form_validation->run() != true){
			$w = array('pcat_sub' => 0);
		$data['data'] = $this->m_dah->edit_data($w,'dah_product_category')->result();
			$data['category'] = $this->m_dah->get_data('dah_product_category')->result();
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_product_category',$data);
			$this->load->view('admin/v_footer');
		}else{

			$nama = $this->input->post('nama');
			$sub = $this->input->post('sub');			
			$data = array(
				'pcat_name' => $nama,
				'pcat_sub' => $sub				
				);

			$this->m_dah->insert_data($data,'dah_product_category');
			redirect(base_url().'admin/product_category/?alert=add');
		}		
	}

	function product_category_edit($id){
		$this->load->database();	
		if($id == ""){
			redirect('admin/product_category');
		}else{			
			$where = array(
				'pcat_id' => $id
				);	
			$data['edit'] = $this->m_dah->edit_data($where,'dah_product_category')->result();
			$data['category'] = $this->m_dah->get_data('dah_product_category')->result();
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_product_category_edit',$data);
			$this->load->view('admin/v_footer');
		}
	}

	function product_category_update(){
		$this->load->database();		
		$id = $this->input->post('id');
		$this->form_validation->set_rules('nama','Category Name','required');
		if($this->form_validation->run() != true){
			$where = array(
				'pcat_id' => $id
				);	
			$data['edit'] = $this->m_dah->edit_data($where,'dah_product_category')->result();
			$data['category'] = $this->m_dah->get_data('dah_product_category')->result();
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_product_category_edit',$data);
			$this->load->view('admin/v_footer');
		}else{

			$name = $this->input->post('nama');
			$sub = $this->input->post('sub');			

			$data = array(
				'pcat_name' => $name,
				'pcat_sub' => $sub
				);
			
			$w = array(
				'pcat_id' => $id
				);
			$this->m_dah->update_data($w,$data,'dah_product_category');
			redirect(base_url().'admin/product_category/?alert=update');
		}		
	}

	function product_category_delete($id){
		$this->load->database();
		if($id == ""){
			redirect('admin/product_category');
		}else{
			
			$w = array(
				'pcat_sub' => $id
				);
			$d = array(
				'pcat_sub' => 0
				);

			$this->m_dah->update_data($w,$d,'dah_product_category');

			$where = array(
				'pcat_id' => $id
				);
			$this->m_dah->delete_data($where,'dah_product_category');
			redirect('admin/product_category/?alert=delete');
		}
	}


	// product
	function products(){		
		$this->load->database();
		$user_id=$this->session->userdata('id');				
		$data['products'] = $this->m_dah->get_data_order('desc','prod_id','dah_products')->result();		
		$data['produk_user'] = $this->m_dah->get_susun_product($user_id,'Publish')->result();		
		
		$this->load->view('admin/v_header');
		$this->load->view('admin/v_product',$data);
		$this->load->view('admin/v_footer');	
	}

	function product_add(){		
		$this->load->database();			
		$w = array('pcat_sub' => 0);
		$data['category'] = $this->m_dah->edit_data($w,'dah_product_category')->result();			
		$this->load->view('admin/v_header');
		$this->load->view('admin/v_product_add',$data);
		$this->load->view('admin/v_footer');	
	}

	function product_add_act(){		
		$this->load->database();		
		$nama = $this->input->post('nama');
		$deskripsi = $this->input->post('deskripsi');
		$harga = $this->input->post('harga');
		$jumlah = $this->input->post('jumlah');
		$bukalapak = $this->input->post('bukalapak');
		$tokopedia = $this->input->post('tokopedia');
		$berat = $this->input->post('berat');
		$jasa_kirim=$this->input->post('jasa_kirim');
		$lokasi=$this->input->post('lokasi');
		$proses_kirim=$this->input->post('proses_kirim');
		$status="Publish";
		
		$this->form_validation->set_rules('nama','Product Name','required');		
		$this->form_validation->set_rules('berat','Product berat','required');		
		
		if($this->form_validation->run() != true){
				$w = array('pcat_sub' => 0);
				$data['category'] = $this->m_dah->edit_data($w,'dah_product_category')->result();			
				$this->load->view('admin/v_header');
				$this->load->view('admin/v_product_add',$data);
				$this->load->view('admin/v_footer');
		}else{											
			$data = array(				
				'prod_author' => $this->session->userdata('id'),
				'prod_date' => date('Y-m-d'),
				'prod_name' => $nama,				
				'prod_desc' => $deskripsi,				
				'prod_qty' => $jumlah,								
				'prod_price' => $harga,				
				'prod_berat' => $berat,				
				'prod_bukalapak' => $bukalapak,				
				'prod_tokopedia' => $tokopedia,
				'prod_kirim' => $proses_kirim,
				'prod_lokasi' => $lokasi,
				'prod_jasa_kirim' =>$jasa_kirim,
				'prod_status' =>$status

				);

			$this->m_dah->insert_data($data,'dah_products');
			$id_terakhir = $this->db->insert_id();			

			// insert category to taxonomy
			if(isset($_POST['cat_pro'])){
				$cat = $_POST['cat_pro'];	
				$jumlah_category = count($cat);							
				for($c=0;$c<$jumlah_category;$c++){								
					$taxonomy = array(
						'taxonomy_parent' => $id_terakhir,
						'taxonomy_child' => $cat[$c],
						'taxonomy' => 'product_category'
						);
					$this->m_dah->insert_data($taxonomy,'dah_taxonomy');
				}				
			}else{
				$taxonomy = array(
					'taxonomy_parent' => $id_terakhir,
					'taxonomy_child' => '1',
					'taxonomy' => 'product_category'
					);
				$this->m_dah->insert_data($taxonomy,'dah_taxonomy');
			}								
			// end insert_category					



			$data = array();
			if(!empty($_FILES['gambar']['name'])){
				$filesCount = count($_FILES['gambar']['name']);
				for($i = 0; $i < $filesCount; $i++){
					$_FILES['gamba']['name'] = $_FILES['gambar']['name'][$i];
					$_FILES['gamba']['type'] = $_FILES['gambar']['type'][$i];
					$_FILES['gamba']['tmp_name'] = $_FILES['gambar']['tmp_name'][$i];
					$_FILES['gamba']['error'] = $_FILES['gambar']['error'][$i];
					$_FILES['gamba']['size'] = $_FILES['gambar']['size'][$i];
					$rand = rand();
					$uploadPath = './dah_image/products/';
					$config['upload_path'] = $uploadPath;
					$config['allowed_types'] = 'gif|jpg|png';
					$config['file_name'] = $rand.$_FILES['gamba']['name'];

					$this->load->library('upload', $config);
					$this->upload->initialize($config);
					if($this->upload->do_upload('gamba')){
						$fileData = $this->upload->data();
						$rand = rand();
						$x = $i+1;					
						$uploadData[$x]['file_name'] = $fileData['file_name'];
						$this->m_dah->update_data(array('prod_id' => $id_terakhir),array('prod_img'.$x => $uploadData[$x]['file_name']),'dah_products');			
					}
				}
			}
			redirect(base_url().'admin/products/?alert=post-saved');	
		}			
	}

	function product_edit($id){
		$this->load->database();	
		if($id == ""){
			redirect('admin/products');
		}else{			
			$where = array(
				'prod_id' => $id
				);	
			$data['category']=$this->m_dah->get_data('dah_product_category')->result();		
			$data['products'] = $this->m_dah->edit_data($where,'dah_products')->result();			
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_product_edit',$data);
			$this->load->view('admin/v_footer');
		}
	}

	function product_hapus_gambar(){
		$this->load->database();
		$prod_id = $this->uri->segment('3');
		$gambar_ke = $this->uri->segment('4');

		$where = array(
			'prod_id' => $prod_id
			);
		$data = $this->m_dah->edit_data($where,'dah_products')->row();
		@chmod("./dah_image/products/" . $data->prod_img.$gambar_ke, 0777);
		@unlink('./dah_image/products/' . $data->prod_img.$gambar_ke);

		$update = array(
			'prod_img'.$gambar_ke => ""
			);
		$this->m_dah->update_data($where,$update,'dah_products');
		redirect(base_url().'admin/product_edit/'.$prod_id);
	}	

	function product_delete($id){
		$this->load->database();
		if($id == ""){
			redirect('admin/products');
		}else{
			$where = array(
				'prod_id' => $id
				);

			$data = $this->m_dah->edit_data($where,'dah_products')->row();
			@chmod("./dah_image/products/" . $data->prod_img1, 0777);
			@unlink('./dah_image/products/' . $data->prod_img1);

			@chmod("./dah_image/products/" . $data->prod_img2, 0777);
			@unlink('./dah_image/products/' . $data->prod_img2);

			@chmod("./dah_image/products/" . $data->prod_img3, 0777);
			@unlink('./dah_image/products/' . $data->prod_img3);

			@chmod("./dah_image/products/" . $data->prod_img4, 0777);
			@unlink('./dah_image/products/' . $data->prod_img4);

			// hapus di taxonomy
			$w = array(
				'taxonomy_parent' => $id,
				'taxonomy' => 'product_category'
				);
			$this->m_dah->delete_data($w,'dah_taxonomy');
			// end hapus di taxonomy

			$this->m_dah->delete_data($where,'dah_products');
			redirect('admin/products/?alert=post-delete');
		}
	}

	function product_update(){		
		$this->load->database();		

		$id = $this->input->post('id');
		if($id==""){
			redirect(base_url().'admin/products');
		}
		$nama = $this->input->post('nama');
		$deskripsi = $this->input->post('deskripsi');
		$harga = $this->input->post('harga');
		$jumlah = $this->input->post('jumlah');
		$bukalapak = $this->input->post('bukalapak');
		$tokopedia = $this->input->post('tokopedia');
		$berat = $this->input->post('berat');
		$jasa_kirim=$this->input->post('jasa_kirim');
		$lokasi=$this->input->post('lokasi');
		$proses_kirim=$this->input->post('proses_kirim');

		$where = array(
			'prod_id' => $id
			);
		$this->form_validation->set_rules('nama','Product Name','required');
		$this->form_validation->set_rules('berat','berat Name','required');

		if($this->form_validation->run() != true){							
			$where = array(
				'prod_id' => $id
				);
			$data['category']=$this->m_dah->get_data('dah_product_category')->result();		
			$data['products'] = $this->m_dah->edit_data($where,'dah_products')->result();			
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_product_edit',$data);
			$this->load->view('admin/v_footer');
		}else{			
			$data = array(								
				'prod_name' => $nama,				
				'prod_desc' => $deskripsi,				
				'prod_qty' => $jumlah,								
				'prod_price' => $harga,				
				'prod_berat' => $berat,				
				'prod_bukalapak' => $bukalapak,				
				'prod_tokopedia' => $tokopedia,
				'prod_kirim' => $proses_kirim,
				'prod_lokasi' => $lokasi,
				'prod_jasa_kirim' =>$jasa_kirim			
				);

			$this->m_dah->update_data($where,$data,'dah_products');		

			// insert category
			if(isset($_POST['cat_pro'])){
				$cat = $_POST['cat_pro'];
				
				// hapus di taxonomy
				$w = array(
					'taxonomy_parent' => $id,
					'taxonomy' => 'product_category'
					);

				$this->m_dah->delete_data($w,'dah_taxonomy');
				// end hapus di taxonomy

				$jumlah_category = count($cat);							
				for($c=0;$c<$jumlah_category;$c++){								
					$taxonomy = array(
						'taxonomy_parent' => $id,
						'taxonomy_child' => $cat[$c],
						'taxonomy' => 'product_category'
						);
					$this->m_dah->insert_data($taxonomy,'dah_taxonomy');
				}				
			}else{
				// hapus di taxonomy
				$w = array(
					'taxonomy_parent' => $id,
					'taxonomy' => 'product_category'
					);
				$this->m_dah->delete_data($w,'dah_taxonomy');
				// end hapus di taxonomy

				$taxonomy = array(
					'taxonomy_parent' => $id,
					'taxonomy_child' => '1',
					'taxonomy' => 'product_category'
					);
				$this->m_dah->insert_data($taxonomy,'dah_taxonomy');
			}								
			// end insert_category				

 
			// add cover image 
			if($_FILES['gambar1']['name'] != ""){	
				$rand = rand();						
				$config['upload_path'] = './dah_image/products/';
				$config['allowed_types'] = 'gif|jpg|png';				
				$config['file_name'] = $rand.'_'.$_FILES['gambar1']['name'];
				$this->load->library('upload', $config);
				$this->upload->do_upload('gambar1');								
				$data = array('upload_data' => $this->upload->data());			
				$file_name = $data['upload_data']['file_name'];
				$this->m_dah->update_data(array('prod_id' => $id),array('prod_img1' => $file_name),'dah_products');							
			}

			if($_FILES['gambar2']['name'] != ""){	
				$rand = rand();						
				$config['upload_path'] = './dah_image/products/';
				$config['allowed_types'] = 'gif|jpg|png';				
				$config['file_name'] = $rand.'_'.$_FILES['gambar2']['name'];
				$this->load->library('upload', $config);
				$this->upload->do_upload('gambar2');								
				$data = array('upload_data' => $this->upload->data());			
				$file_name = $data['upload_data']['file_name'];
				$this->m_dah->update_data(array('prod_id' => $id),array('prod_img2' => $file_name),'dah_products');							
			}

			if($_FILES['gambar3']['name'] != ""){	
				$rand = rand();						
				$config['upload_path'] = './dah_image/products/';
				$config['allowed_types'] = 'gif|jpg|png';				
				$config['file_name'] = $rand.'_'.$_FILES['gambar3']['name'];
				$this->load->library('upload', $config);
				$this->upload->do_upload('gambar3');								
				$data = array('upload_data' => $this->upload->data());			
				$file_name = $data['upload_data']['file_name'];
				$this->m_dah->update_data(array('prod_id' => $id),array('prod_img3' => $file_name),'dah_products');							
			}

			if($_FILES['gambar4']['name'] != ""){	
				$rand = rand();						
				$config['upload_path'] = './dah_image/products/';
				$config['allowed_types'] = 'gif|jpg|png';				
				$config['file_name'] = $rand.'_'.$_FILES['gambar4']['name'];
				$this->load->library('upload', $config);
				$this->upload->do_upload('gambar4');								
				$data = array('upload_data' => $this->upload->data());			
				$file_name = $data['upload_data']['file_name'];
				$this->m_dah->update_data(array('prod_id' => $id),array('prod_img4' => $file_name),'dah_products');							
			}
			// end add cover image	
			redirect('admin/products/?alert=post-saved');
		}			
	}
	// end product




	function invoice(){		
		$this->load->database();						
		$data['invoice'] = $this->db->query('select * from invoice order by date(tgl) desc')->result();
		$this->load->view('admin/v_header');
		$this->load->view('admin/v_invoice',$data);
		$this->load->view('admin/v_footer');	
	}

	function pembeli(){		
		$this->load->database();						
		$data['pembeli'] = $this->db->query('select * from user order by id desc')->result();
		$this->load->view('admin/v_header');
		$this->load->view('admin/v_pembeli',$data);
		$this->load->view('admin/v_footer');	
	}


	function pembeli_delete($id){
		$this->load->database();
		if($id == ""){
			redirect('admin/pembeli');
		}else{
			$w = array(
				'id' => $id
				);
			$this->m_dah->delete_data($w,'user');
			
			redirect('admin/pembeli/?alert=delete');
		}
	}

	function pembeli_edit($id){
		$this->load->database();	
		if($id == ""){
			redirect('admin/pembeli');
		}else{			
			$where = array(
				'id' => $id
				);	
			$data['pembeli'] = $this->m_dah->edit_data($where,'user')->result();			
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_pembeli_edit',$data);
			$this->load->view('admin/v_footer');
		}
	}

	function pembeli_update(){
		$this->load->database();		
		$id = $this->input->post('id');
		$nama = $this->input->post('nama');				
		$email = $this->input->post('email');
		$alamat = $this->input->post('alamat');
		$provinsi = $this->input->post('provinsi');
		$kota = $this->input->post('kota');
		$kecamatan = $this->input->post('kecamatan');
		$kodepos = $this->input->post('kodepos');
		$telp = $this->input->post('telp');
		$status = $this->input->post('status');
		
		$this->form_validation->set_rules('nama','Nama','required');				

		if($this->form_validation->run()==false){
			$w = array(
				'id' => $id
				);
			$data['pembeli'] = $this->m_dah->edit_data($w,'user')->result();
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_pembeli_edit',$data);
			$this->load->view('admin/v_footer');
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
				'status' => $status,
				'kodepos' => $kodepos
				);
			$this->m_dah->update_data($w,$data,'user');
			redirect(base_url().'admin/pembeli/?alert=update');
		}		
				
	}

	function pembeli_detail($id){
		$this->load->database();	
		if($id == ""){
			redirect('admin/pembeli');
		}else{			
			$where = array(
				'id' => $id
				);	
			$data['pembeli'] = $this->m_dah->edit_data($where,'user')->result();			
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_pembeli_detail',$data);
			$this->load->view('admin/v_footer');
		}
	}

	function invoice_delete($id){
		$this->load->database();
		if($id == ""){
			redirect('admin/invoice');
		}else{
			$ww = array(
				'order_invoice' => $id
				);
			$this->m_dah->delete_data($ww,'orders');

			$w = array(
				'id' => $id
				);
			$this->m_dah->delete_data($w,'invoice');

			
			redirect('admin/invoice/?alert=delete');
		}
	}

	function invoice_edit($id){
		$this->load->database();
		$this->load->helper('ongkir_helper');
		if($id == ""){
			redirect('admin/invoice');
		}else{		
			$w = array(
				'id' => $id
				);
			$data['invoice'] = $this->m_dah->edit_data($w,'invoice')->result();
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_invoice_edit',$data);
			$this->load->view('admin/v_footer');
		}
	}


	function invoice_update(){
		$this->load->database();		
		$id = $this->input->post('id');
		$status = $this->input->post('status');
		$resi = $this->input->post('resi');
		$w = array(
			'id' => $id
			);
		$data = array(
			'status' => $status,
			'resi' => $resi
			);
		$this->m_dah->update_data($w,$data,'invoice');
		redirect(base_url().'admin/invoice/?alert=update');

	}

	function invoice_detail($id){
		$this->load->database();
		$this->load->helper('ongkir_helper');
		if($id == ""){
			redirect('admin/invoice');
		}else{		
			$w = array(
				'id' => $id
				);
			$data['invoice'] = $this->m_dah->edit_data($w,'invoice')->result();
			$data['barang'] = $this->db->query("select * from dah_products,orders where dah_products.prod_id=orders.order_produk and orders.order_invoice='$id'")->result();
			$subtotal = $this->db->query("select * from orders where orders.order_invoice='$id'")->result();		
			$sub = "";
			foreach($subtotal as $s){
				$sub += $s->order_harga * $s->order_jumlah;
			}
			$data['subtotal'] = $sub;
			$this->load->view('admin/v_header');
			$this->load->view('admin/v_invoice_detail',$data);
			$this->load->view('admin/v_footer');
		}
	}
}