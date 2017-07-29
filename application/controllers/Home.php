<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends MY_Controller {

    public function __construct(){
        parent::__construct();
        $this->isLogged();
    }

    public function index(){
        $data = $this->session->userdata('log');
        $data['module']  = "Home";
        $data['fields']  = $this->getModules();
        $this->load->view('header',$data);  
        $this->load->view('index');
        $this->load->view('home');
        $this->load->view('footer');
    }
}

/* End of file Welcome.php */
/* Location: ./application/controllers/Welcome.php */