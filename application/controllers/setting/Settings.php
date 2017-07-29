<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Settings extends MY_Controller {

	public function __construct(){
		parent::__construct();
		$this->isProtected();
	}

	public function index(){
        $data = $this->session->userdata('log');
        $data['module']  = "Setting";
        $data['fields']  = $this->getModules();
        $this->load->view('header',$data);
        $this->load->view('index',$data);
        $this->load->view('settings/setting_view');
        $this->load->view('footer');
	}

}

/* End of file Config.php */
/* Location: ./application/controllers/Config.php */
