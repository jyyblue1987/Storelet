      <?php 
      public notif($entryData){
      	$data=null;
      	$result=array();
      
      	$status=false;
      	if(!empty($entryData)){
      		 $context = new ZMQContext();
	          $socket = $context->getSocket(ZMQ::SOCKET_PUSH, 'my pusher');
	        $socket->connect("tcp://localhost:5555");
	 $status=true;
	         $data=$socket->send(json_encode($entryData));
	    	 $result=('data'=>$data,'status'=>$status);
	     
      	}else{
	    	 $result=('data'=>$data,'status'=>$status);

      	}

      return $result;
	}