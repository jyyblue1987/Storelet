<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Email extends MY_Controller {

	public function __construct()
	{
		parent::__construct();
	}

	public function send_email(){
		$this->form_validation->set_rules('name', 'name', 'required');
		$this->form_validation->set_rules('email', 'email', 'required|valid_email');
		$this->form_validation->set_rules('msg_subject', 'msg_subject', 'required');
		$this->form_validation->set_rules('message', 'message', 'required');
		if ($this->form_validation->run() == FALSE) {
			$this->json($this->form_validation->error_array());
		}else{
			$this->email->from($this->input->post('email'), $this->input->post('name'));
	    	$this->email->to('aronimperial20@gmail.com');
	    	$this->email->reply_to($this->input->post('email'), $this->input->post('name'));
	    	$this->email->subject($this->input->post('msg_subject'));
	    	$this->email->message($this->input->post('message'));
	    	if ($this->email->send()) {
	    		$this->json(array('msg' => 'your email was sent.'));
	    	}else{
	    		$this->json(array('error' => 'something was wrong'));
	    	}
		}
	}

}

/* End of file  */
/* Location: ./application/controllers/ */