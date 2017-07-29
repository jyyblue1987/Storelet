<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Provider extends MY_Controller {

	public function __construct(){
		parent::__construct();
		$this->isLogged();
		$this->isProtected();
	}

	public function index(){
		$data = $this->session->userdata('log');
		$data['module']  = "Provider";
        $data['fields']  = $this->getModules();
		$this->load->view('header',$data);
        $this->load->view('index');
		$this->load->view('purchase/provider');
		$this->load->view('footer');
	}

	public function datatable(){
		$array = $this->providers->datatable();
		$this->json($array);
		$data = array();
		foreach ($array as $rows){
			array_push($data, array(
                $rows['hash_id'],
				$rows['first_name'],
				$rows['last_name'],
				$rows['phone'],
				$rows['email'],
				$rows['address'],
				$rows['status'],
			));
		}
		$this->json(array('data' => $data));
	}

	public function getViewProvider(){
		$this->load->view('purchase/get_view_provider');
	}
	
	public function addProvider() {
	    $first_name = $this->input->post('first_name');
	    $last_name = $this->input->post('last_name');
	    $email = $this->input->post('email');
	    $phone = $this->input->post('phone');
	    $address = $this->input->post('address');
	    $data = array(
	        'first_name' => $first_name,
	        'last_name' => $last_name,
	        'email' => $email,
	        'phone' => $phone,
	        'address' => $address,
	    );

	    $this->form_validation->set_rules('first_name', 'first_name', 'trim|alpha|required');
	    $this->form_validation->set_rules('last_name', 'last_name', 'trim|alpha|required');
	    $this->form_validation->set_rules('email', 'email', 'trim|valid_email|required');
	    $this->form_validation->set_rules('phone', 'phone', 'required|callback_phone');
	    $this->form_validation->set_rules('address', 'address', 'trim|alpha_numeric_spaces|required');
	    $this->form_validation->set_message('phone', 'Please enter a valid phone number');
	    if ($this->form_validation->run() == FALSE) {
            $this->json($this->form_validation->error_array());
	    } else {
	        if (empty($data)) {
	            $this->json(array('msg' => 'vacio'));
	        } else {
	            if (!$this->providers->isExistsProvider($data)) {
	                $this->providers->addProvider($data);
	                $this->json(array('msg' => 'successfully added'));
	            } else {
	                $this->json(array('msg' => 'The email is used by another provider'));
	            }
	        }
	    }
	}
    
    public function updateProvider(){
		$first_name = $this->input->post('first_name');
		$last_name = $this->input->post('last_name');
		$email = $this->input->post('email');
		$phone = $this->input->post('phone');
		$address = $this->input->post('address');
		$id = $this->input->post('hash');
		$data = array(
			'first_name' => $first_name,
			'last_name' => $last_name,
			'email' => $email,
			'phone' => $phone,
			'address' => $address,
		);
		
		$this->form_validation->set_rules('first_name', 'first_name', 'trim|alpha|required');
	    $this->form_validation->set_rules('last_name', 'last_name', 'trim|alpha|required');
	    $this->form_validation->set_rules('email', 'email', 'trim|valid_email|required');
	    $this->form_validation->set_rules('phone', 'phone', 'required|callback_phone');
	    $this->form_validation->set_rules('address', 'address', 'trim|alpha_numeric_spaces|required');
	    $this->form_validation->set_message('phone', 'Please enter a valid phone number');
	    if ($this->form_validation->run() == FALSE) {
            $this->json($this->form_validation->error_array());
	    } else {
	        if (empty($data)) {
	            $this->json(array('msg' => 'vacio'));
	        } else {
	            if (!$this->providers->isExistsProvider($data)) {
	               $this->providers->updateProvider($data,$id);
				   $this->json(array('msg' => 'successfully updated'));
	            } else {
	                $this->json(array('msg' => 'The email is used by another provider'));
	            }
	        }
	    }
	}
    
    public function phone($phone) { 
        if ( preg_match( '/^[+]?([\d]{0,3})?[\(\.\-\s]?([\d]{3})[\)\.\-\s]*([\d]{3})[\.\-\s]?([\d]{4})$/', $phone ) ) { 
            return TRUE; 
        } else {
            return FALSE; 
        } 
    }
}

/* End of file Provider.php */
/* Location: ./application/controllers/Provider.php */
