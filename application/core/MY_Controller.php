<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class MY_Controller extends CI_Controller {

	function __construct(){
		parent::__construct();
	}

	protected function isLogged(){
        if (!$this->session->userdata('log'))
             redirect('login','refresh');
	}

    protected function isProtected(){
        $data = $this->session->userdata('log');
        if($this->session->log['type'] == 1){
            $data['fields']  = $this->getModules();
        }
        else{
            show_error('401 Unauthorised', 'You are not authorised to access this page.', 'error_401', 401);
        }
    }



	protected function json($array){
		$this->output->set_content_type('application/json')->set_output(json_encode($array));
	}

	protected function getModules(){
        if($this->session->userdata('log')){
            $data = $this->session->userdata('log');
            $menu = array();
            $seccions = $this->module->get_rows();
            foreach ($seccions as $index => $seccion){
               $modules = $this->module->query("SELECT CONCAT('".$seccion['id']."',storelte_module.id) AS id,CONCAT('".base_url('assets/img/sidebar')."','/',storelte_module.icon) AS icon,storelte_module.module AS value,storelte_module.section_id,CONCAT('".base_url()."',storelte_module.url) AS  url FROM storelte_module INNER JOIN storelte_module_profile ON  storelte_module_profile.module_id = storelte_module.id WHERE section_id = $seccion[id] AND storelte_module_profile.profile_id = $data[id] AND storelte_module_profile.STATUS = 1");
                $seccions[$index]['data']= $modules;
                if (!count($seccions[$index]['data']))
                    unset($seccions[$index]);
            }
            foreach ($seccions as $item)
                array_push($menu,$item);
            return $menu;
        }
    }
}

/* End of file MY_Controller.php */
/* Location: ./application/controllers/MY_Controller.php */