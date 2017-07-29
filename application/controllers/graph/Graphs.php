<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Graphs extends MY_Controller {

	public function __construct(){
		parent::__construct();
		$this->isLogged();
	}
    
    public function best_selling(){
        $data = $this->graph->getGraph();
        echo json_encode($data,JSON_NUMERIC_CHECK);
    }
}

/* End of file Provider.php */
/* Location: ./application/controllers/Provider.php */
