<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Reports extends MY_Controller {

	public function __construct(){
		parent::__construct();
        $this->isLogged();
        $this->isProtected();
	}

	 public function index(){
        $data = $this->session->userdata('log');
		$data['module']  = "Reports";
        $data['fields']  = $this->getModules();
        $this->load->view('header',$data);
        $this->load->view('index');
        $this->load->view('report/report');
        $this->load->view('footer');
    }

}

/* End of file  */
/* Location: ./application/controllers/ */
