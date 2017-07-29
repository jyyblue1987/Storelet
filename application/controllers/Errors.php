<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Errors extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function show_403(){
		$this->load->view('custom_erros/show_404');
	}

}

/* End of file Errors.php */
/* Location: ./application/controllers/Errors.php */