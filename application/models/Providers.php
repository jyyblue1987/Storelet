<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Providers extends CI_Model {
	public function __construct(){
		parent::__construct();
		
	}

	public function datatable(){
		$this->db->select('id,hash_id,first_name,last_name,phone,email,address,status');
		$this->db->from('storelte_provider');
		$query = $this->db->get();
		return $query->result_array();
	}

	public function isExistsProvider($data){
		$this->db->select('email');
		$this->db->from('storelte_provider');
		$this->db->where('email',$data['email']);
		$query = $this->db->get();
		return $query->num_rows() == 0 ? false : true;
    }
	
	public function addProvider($data){
        $query = 'UPDATE storelte_provider SET hash_id = MD5(id) WHERE id = LAST_INSERT_ID()';
		$this->db->insert('storelte_provider',$data);
        $this->db->query($query);
	}
    
    public function updateProvider($data,$id){
        $this->db->where('md5(id)',$id);
        $this->db->update('storelte_provider',$data);
    }

}

/* End of file _provider.php */
/* Location: ./application/models/_provider.php */