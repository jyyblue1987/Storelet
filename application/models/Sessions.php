<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Sessions extends CI_Model {

	public $variable;

	public function __construct(){
		parent::__construct();
	}

	public function datatable(){
		$this->db->select('user_agent,ip_address,timestamp');
		$this->db->from('storelte_sessions');
		$query = $this->db->get();
		return $query->result_array();
	}
}

/* End of file Graph.php */
/* Location: ./application/models/Graph.php */
