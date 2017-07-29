<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller {
    public function __construct(){
        parent::__construct();
    }
    
    public function index(){
        $data['module'] = 'Login';
        $this->load->view('login',$data);
    }

    public function getAccess(){
        if ($this->session->userdata('logged_in') == TRUE){
            redirect('home');
        }else{
            $username = $this->security->xss_clean($this->input->post('username'));
            $password = $this->security->xss_clean($this->input->post('password'));
            $array = $this->user->login($username,$password);
            if ($array[0] == 0) {
                $this->json(array('error' => 'invalid username or password'));
            }else{
                $data_session = array(
                    'id' => $array[0]['id'],
                    'name' => $array[0]['nombre'],
                    'last_name' => $array[0]['apellido'],
                    'type' => $array[0]['id_perfil'],
                    'logged_in' => TRUE 
                );
                $this->session->set_userdata('log',$data_session);
            }
        }
    } 

    public function logout(){
        $this->session->sess_destroy();
        redirect('login');
    }

}