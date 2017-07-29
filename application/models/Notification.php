<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Notification extends CI_Model {
	public function __construct(){
		parent::__construct();
		
	}

	public function addNotification($message, $product_id, $user_id, $type = ''){
		$types = array('new' => 0, 'pending' => 1, 'low stock' => 2);
		if (isset($types[$type]) === false) {
    		throw new \InvalidArgumentException('Value for third parameter must be one of new, pending, or low stock.');
    	}
    	$type = $types[$type];
		$timestamp = time();
		$query = "SELECT COUNT(*) AS notificationCount FROM storelte_notifications WHERE product_id IN ? AND type = ? ";
		$previousNotification = $this->db->query($query, array($product_id, $type))->result_array();
		if ($previousNotification[0]['notificationCount'] == 0) {
			$sql = "INSERT INTO storelte_notifications (message,type,product_id,user_id,timestamp) VALUES(?, ?, ?, ?, ?)";
			try {
				foreach ($product_id as $pid) {
        			if (!$this->db->query($sql, array($message, $type, $pid, $user_id, $timestamp))) {
        				return false;
        			}
        		}
        		return true;
			} catch (Exception $e) {
				
			}
		}else{
			return true;
		}
	}

    /*public function getNotifications($timestamp, $user_id){
        $sql =  "SELECT * FROM storelte_user_notifications LEFT JOIN storelte_notifications ON storelte_user_notifications.notification_id = storelte_notifications.id  WHERE created_at >= ? AND user_id = ? ORDER BY created_at";
        $response = $this->db->query($sql, array($timestamp, $user_id));
        return $response->result_array();
    }*/

    public function getNotifications($data){
    	$this->db->select('storelte_notifications.id,description,message,timestamp');
		$this->db->from('storelte_notifications');
        $this->db->join('storelte_products', 'storelte_products.id = storelte_notifications.product_id ','inner');
        $this->db->order_by('id','desc');
		$this->db->where('user_id',$data['user_id']);
		$query = $this->db->get();
		return $query->row();
    }

    public  function removeUserNotifications($user_id){
    	$sql = "DELETE FROM storelte_user_notifications WHERE user_id = ?";
        $response = $this->db->query($sql, array($user_id));
        return $response;
    }

    public function removeNotifications($product_id){
        $sql = "DELETE FROM notifications WHERE product_id = ?";
        $response = $this->db->query($sql, array($product_id));
        return $response;
    }

    public function getCountNotification(){
    	$this->db->from('storelte_notifications');
        $this->db->where('status', 0);
        return $this->db->count_all_results();
    }
}

/* End of file  */
/* Location: ./application/models/ */