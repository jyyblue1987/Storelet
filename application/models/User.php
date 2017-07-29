<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class User extends CI_Model {
    
    public function __construct(){
        parent::__construct();

    }

    public function login($username,$password){
        $this->db->select('storelte_users.id,first_name,last_name,username,password,profile_id');
        $this->db->from('storelte_users');
        $this->db->join('storelte_profile', 'storelte_users.profile_id = storelte_profile.id ','inner');
        $this->db->where('username',$username);
        $salt = '$2y$11$XsCgn8hLtWL/jMKrwXLAkOk0qs2YehsD2NCAKrgrsyo7YKh.HvNhi';
        $this->db->where('password',hash('sha256', $password.$salt));
        $result = $this->db->get();
        if($result->num_rows() > 0){
            return $result->result_array();
        }else{
           return FALSE;
        }
    }
}