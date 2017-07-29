<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Graph extends CI_Model {

	public $variable;

	public function __construct(){
		parent::__construct();
	}

	public function getGraph(){
		$data = $this->db->query('CALL storelte_best_selling()'); 
        mysqli_next_result( $this->db->conn_id );
        return $data->result_array();
	}
}

/* End of file Graph.php */
/* Location: ./application/models/Graph.php */
