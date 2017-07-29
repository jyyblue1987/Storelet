<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Notifications extends MY_Controller {

	public function __construct(){
		parent::__construct();
		$this->isLogged();
	}


	public function getNotification(){
        $user_id = array('user_id' => $this->session->log['id']);
        $notifications = $this->notification->getNotifications($user_id);
        if ($notifications) {
            $data['description'] = $notifications->description;
            $data['message'] = $notifications->message;
            $data['timestamp'] = $notifications->timestamp; 
            $data['notifications'] = $this->notification->getCountNotification();
            $data['success'] = true;
        }else{
            $data['success'] = false;
        }

        $this->json($data);
    }
}

/* End of file  */
/* Location: ./application/controllers/ */