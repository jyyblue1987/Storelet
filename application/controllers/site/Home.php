<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Home extends CI_Controller {

	public function __construct(){
		parent::__construct();
	}

	public function index(){
		$data['title'] = "Storelte";
		$this->load->view('landing/header',$data);	
		$this->load->view('landing/index');	
		$this->load->view('landing/footer');	
	}

	public function sendMail(){
		$data = array(
			'name' => $this->input->post('name'), 
			'email' => $this->input->post('email'),
			'subject' => $this->input->post('subject'),
			'message' => $this->input->post('message')
		);

		print_r($data);
	}

}

/* End of file  */
/* Location: ./application/controllers/ */