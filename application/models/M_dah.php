<?php 
class M_dah extends CI_Model{
	// general
	function edit_data($where,$table){
		return $this->db->get_where($table,$where);
	}

	function edit_data_order($where,$table,$column,$order){
		$this->db->order_by($column, $order);
		return $this->db->get_where($table,$where);
	}

	function get_data($table){
		return $this->db->get($table);
	}

	function insert_data($data,$table){
		$this->db->insert($table,$data);
	}

	function update_data($where,$data,$table){
		$this->db->where($where);
		$this->db->update($table,$data);
	}

	function delete_data($where,$table){
		$this->db->where($where);
		$this->db->delete($table);
	}	

	function get_data_order($order,$column,$table){
		$this->db->order_by($column, $order); 
		return $this->db->get($table);
	}

	function get_group($table,$group){
		return $this->db->query("select * from $table group by $group");
	}

	function get_group_visitor($table,$group,$date){
		return $this->db->query("select * from $table where date(time_visit)='$date' group by $group");
	}
	// end general

	// cms
	function get_posts($post_status){
		$this->db->order_by('post_id', 'desc');
		$this->db->where(array('post_status'=> $post_status));
		return $this->db->get('dah_posts');
	}

	function get_posts_paging($post_status,$sampai,$dari){		
		$this->db->order_by('post_id', 'desc');
		$this->db->where(array('post_status'=> $post_status));
		return $this->db->get('dah_posts',$sampai,$dari);	
	}

	function get_post_limit($post_status,$limit){
		$this->db->limit($limit);
		$this->db->order_by('post_id', 'desc');
		$this->db->where(array('post_status'=> $post_status));
		return $this->db->get('dah_posts');
	}	

	function get_post_category($id_post){
		return $this->db->query("select * from dah_taxonomy,dah_category where dah_taxonomy.taxonomy_parent='$id_post' and dah_taxonomy.taxonomy='post_category' and dah_taxonomy.taxonomy_child=dah_category.category_id ");
	}

	function post_in_category($id_category){
		return $this->db->query("select * from dah_taxonomy,dah_category,dah_posts where dah_taxonomy.taxonomy_child='$id_category' and dah_taxonomy.taxonomy='post_category' and dah_taxonomy.taxonomy_child=dah_category.category_id and dah_taxonomy.taxonomy_parent=dah_posts.post_id");
	}

	function get_post_detail($id_post){
		return $this->db->query("select * from dah_posts,dah_users where dah_posts.post_author=dah_users.user_id and dah_posts.post_id='$id_post'");
	}

	function get_tot_cat($id){
		return $this->db->query("select * from dah_taxonomy where taxonomy_child='$id'");
	}

	// end cms


	// get options
	function get_option($option_name){		
		$query = $this->db->query("select option_value from dah_options where option_name='$option_name'")->row();
		return $query->option_value;
	}
	// end get option

	// menu
	function get_menu_mother(){
		return $this->db->query("select * from dah_menu where menu_mother != '0' and menu_name='0' and menu_url='0' and menu_parent='0' and menu_sort='0'");
	}

	function get_menu_item($mother){
		return $this->db->query("select * from dah_menu where menu_mother = '$mother' and menu_name!='0' and menu_parent='0' order by menu_sort asc");
	}

	function get_all_menu_item($mother){
		return $this->db->query("select * from dah_menu where menu_mother = '$mother' and menu_name!='0' order by menu_sort asc");
	}	
	// end menu

	function get_widget($where,$table){
		$this->db->order_by('widget_sort','asc');
		return $this->db->get_where($table,$where);
	}



	// visitor
	function get_pageview($date){
		return $this->db->query("select * from dah_visitor where date(time_visit)='$date'");
	}

	function get_visitor($date){
		return $this->db->query("select * from dah_visitor where date(time_visit)='$date' group by user_ip");
	}

	function get_ftvisitor($date){
		return $this->db->query("select * from dah_visitor where date(time_visit)='$date' and user_ip not in(select user_ip from dah_visitor)");
	}

	function page_view($date){
		return $this->db->query("select count(page) as page_view, page from dah_visitor where date(time_visit)='$date' group by page order by page_view desc");
	}

	function get_referrer($date){
		return $this->db->query("select distinct user_referrer from dah_visitor where date(time_visit)='$date' and user_referrer!=''");
	}	


	// product
	function get_product_detail($id_product){		
		return $this->db->query("select * from dah_products,dah_users where dah_products.prod_author=dah_users.user_id and dah_products.prod_id='$id_product'");
	}	

	function get_product_category($id_product){
		return $this->db->query("select * from dah_taxonomy,dah_product_category where dah_taxonomy.taxonomy_parent='$id_product' and dah_taxonomy.taxonomy='product_category' and dah_taxonomy.taxonomy_child=dah_product_category.pcat_id");
	}

	function get_product_paging($sampai,$dari){		
		$this->db->order_by('prod_id', 'desc');		
		return $this->db->get('dah_products',$sampai,$dari);	
	}

	// function get_product_category_paging($sampai,$dari){		
	// 	$this->db->order_by('prod_id', 'desc');		
	// 	return $this->db->get('dah_products',$sampai,$dari);	
	// 	return $this->db->query("select * from dah_taxonomy,dah_product_category,dah_products where dah_taxonomy.taxonomy_child='$id_category' and dah_taxonomy.taxonomy='product_category' and dah_taxonomy.taxonomy_child=dah_product_category.pcat_id and dah_taxonomy.taxonomy_parent=dah_products.prod_id");
	// }

	function product_in_category($id_category){
		return $this->db->query("select * from dah_taxonomy,dah_product_category,dah_products where dah_taxonomy.taxonomy_child='$id_category' and dah_taxonomy.taxonomy='product_category' and dah_taxonomy.taxonomy_child=dah_product_category.pcat_id and dah_taxonomy.taxonomy_parent=dah_products.prod_id");
	}

	function product_author_detail($id_author){
		return $this->db->query("select * from dah_products,dah_users where dah_users.user_id=dah_products.prod_author and prod_author='$id_author' ");
	}

	// pencarian strat
	function search_product($product_status,$rowno,$rowperpage,$search=""){
		$this->db->order_by('prod_id', 'desc');
		if($search != ''){
		$this->db->like('prod_name', $search);
		// $this->db->or_like('content', $search);
		}
		$this->db->where(array('prod_status'=> $product_status));
		return $this->db->get('dah_products',$rowperpage, $rowno);	
	}

	public function getrecordProduct($product_status,$search = '') {
		$this->db->select('count(*) as allcount');
		$this->db->from('dah_products');
		
		if($search != ''){
			$this->db->like('prod_name', $search);
			//$this->db->or_like('content', $search);
		  }
		  $this->db->where(array('prod_status'=> $product_status));
  
	  $query = $this->db->get();
	  $result = $query->result_array();
   
	  return $result[0]['allcount'];
	}

	// end pencarian

	// susun product

	function get_susun_product($product_author,$status){
		
		return $this->db->query("select * from dah_products where (prod_author = '$product_author') and (prod_status = '$status')  order by prod_date desc");

	}

	function get_susun_invoice($id_buyer,$status){
		
		return $this->db->query("select * from invoice where (user_id = '$id_buyer') and (status = '$status')  order by tgl desc");

	}

	// end susun poduct

	// email pembayaran login

	function kirim_email($email,$subyek,$pesan){

		$this->load->library('email');
				$config = array();
				$config['charset'] = 'utf-8';
				$config['useragent'] = 'Codeigniter';
				$config['protocol']= "http"; //khusus buat di hosting
				// $config['protocol']= "smtp"; 
	
				$config['mailtype']= "html";
				$config['smtp_port']= "587"; //khusus buat di hosting ada sslnya
				$config['smtp_host']= "smtp.gmail.com"; //khusus buat di hosting
				// $config['smtp_port']=  465;
				// $config['smtp_host']= "ssl://smtp.gmail.com";
	
				$config['smtp_timeout']= "10";
				$config['smtp_user']= "bantuansadean@gmail.com"; // isi dengan email kamu
				$config['smtp_pass']= "maktab1234"; // isi dengan password kamu
				$config['crlf']="\r\n"; 
				$config['newline']="\r\n"; 
				$config['wordwrap'] = TRUE;
				//memanggil library email dan set konfigurasi untuk pengiriman email
					
				$this->email->initialize($config);
				//konfigurasi pengiriman
				$this->email->from($config['smtp_user']);
				$this->email->to($email);
				$this->email->subject($subyek);
				$this->email->message($pesan);
	}

	// end email pembayaran login













}
?>