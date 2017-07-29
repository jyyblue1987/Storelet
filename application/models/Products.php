<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Products extends CI_Model {
	public function __construct(){
		parent::__construct();
	}

	public function datatable(){
		$this->db->select('hash_id,code,description,purchase_price,sale_price,wholesale_price,stock,status');
		$this->db->from('storelte_products');
		$query = $this->db->get();
		return $query->result_array();
	}
	
	public function isExistsProduct($data){
		$this->db->select('description');
		$this->db->from('storelte_products');
		$this->db->where('description',$data['description']);
		$query = $this->db->get();
		return $query->num_rows() == 0 ? false : true;
    }

	public function addProduct($data){
		$query = 'UPDATE storelte_products SET hash_id = MD5(id) WHERE id = LAST_INSERT_ID()';
        $this->db->insert('storelte_products',$data);
        $this->db->query($query);
    }

    public function updateProduct($data,$id) { 
    	$this->db->where('hash_id', $id);
    	$this->db->update('storelte_products',$data); 
    }

    public function get_product($id) {
        $this->db->select('code,description,purchase_price,sale_price,wholesale_price,min_stock,stock,max_stock,provider_id');
        $this->db->from('storelte_products');
        $this->db->where('hash_id', $id);
        $query = $this->db->get();
        return $query->row();
    }

    public function get_product_id($id) {
        $this->db->select('code,description,purchase_price,sale_price,wholesale_price,min_stock,stock,max_stock,provider_id');
        $this->db->from('storelte_products');
        $this->db->where_in('id', $id);
        $query = $this->db->get();
        return $query->row();
    }

    public function search(){
        $query = $this->db->get('storelte_products');
        return $query->result();
    }
}

/* End of file Item.php */
/* Location: ./application/models/Item.php */
