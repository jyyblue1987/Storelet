<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Module extends CI_Model {
	public function __construct(){
		parent::__construct();
		
	}

    public function get_rows(){
    	$this->db->select("id,section,CONCAT('".base_url('assets/img/sidebar')."','/',storelte_section.icon) as icon");
    	$this->db->from('storelte_section');
    	return $this->db->get()->result_array();
    }

    public function query($query){
		return $this->db->query($query)->result_array();
	}

}


/* End of file  */
/* Location: ./application/models/ */