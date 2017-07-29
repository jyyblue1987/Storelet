<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller {
    public function __construct(){
        parent::__construct();
    }
    
    public function index(){
        $data['module'] = 'Login';
        $this->load->view('header',$data);
        $this->load->view('login');
    }

    public function getAccess(){
        $username = $this->input->post('username', TRUE);
        $password = $this->input->post('password', TRUE);
        $array = $this->user->login($username,$password);
        if (!empty($this->input->post('username')) && !empty($this->input->post('password'))) {
            if ($array[0] == 0) {
                $this->json(array('error' => 'invalid username or password'));
            }else{
                $data_session = array(
                    'id' => $array[0]['id'],
                    'name' => $array[0]['first_name'],
                    'last_name' => $array[0]['last_name'],
                    'type' => $array[0]['profile_id'],
                    'logged_in' => TRUE 
                );
                $this->session->set_userdata('log',$data_session);
            }
        } else {
            $this->json(array('empty' => 'You did not fill out the required fields.'));
        }
    } 

    public function logout(){
        $this->session->sess_destroy();
        redirect('login','refresh');
    }

    public function metadata(){
        $data = array(
            'session_id' => session_id(), 
            'ip_address' => $_SERVER['REMOTE_ADDR'],
            'user_agent' => $this->input->user_agent(),
            'last_activity' => time(),
            'date' => date("Y-m-d H:i:s"),
        );
        $this->json($data);
    }
}