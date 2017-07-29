<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Site extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function index(){
		$data['title'] = "Storelte";
		$this->load->view('landing/header',$data);	
		$this->load->view('landing/index');	
		$this->load->view('landing/footer');	
	}
}

/* End of file  */
/* Location: ./application/controllers/ */
