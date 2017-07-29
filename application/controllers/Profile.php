<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Profile extends MY_Controller {

	public function __construct(){
		parent::__construct();
		$this->isLogged();
	}

	public function sessions(){
		$data = $this->session->userdata('log');
		$data['module']  = 'Active Sessions';
        $data['fields']  = $this->getModules();
        $data['data'] = $this->sessions->datatable();
        $this->load->view('header',$data);
        $this->load->view('index');
        $this->load->view('session/active_sessions',$data);
        $this->load->view('footer');
	}


	public function getBrowser($user_agent = ''){
    	$bname = 'Unknown';
        $browser        =   "Unknown Browser";
        $os_platform    =   "Unknown OS Platform";
        if (preg_match('/windows|win32/i', $user_agent)) {

            $os_platform  =  'Windows';

            if (preg_match('/windows nt 6.2/i', $user_agent)) {

                $os_platform    .=  " 8";

            } else if (preg_match('/windows nt 6.1/i', $user_agent)) {

                $os_platform    .=  " 7";

            } else if (preg_match('/windows nt 6.0/i', $user_agent)) {

                $os_platform    .=  " Vista";

            } else if (preg_match('/windows nt 10.0/i', $user_agent)) {

                $os_platform    .=  " 10";

            }else if (preg_match('/windows nt 5.2/i', $user_agent)) {

                $os_platform    .=  " Server 2003/XP x64";

            } else if (preg_match('/windows nt 5.1/i', $user_agent) || preg_match('/windows xp/i', $user_agent)) {

                $os_platform    .=  " XP";

            } else if (preg_match('/windows nt 5.0/i', $user_agent)) {

                $os_platform    .=  " 2000";

            } else if (preg_match('/windows me/i', $user_agent)) {

                $os_platform    .=  " ME";

            } else if (preg_match('/win98/i', $user_agent)) {

                $os_platform    .=  " 98";

            } else if (preg_match('/win95/i', $user_agent)) {

                $os_platform    .=  " 95";

            } else if (preg_match('/win16/i', $user_agent)) {

                $os_platform    .=  " 3.11";

            }

        } else if (preg_match('/macintosh|mac os x/i', $user_agent)) {

            $os_platform    =   'Mac';

            if (preg_match('/macintosh/i', $user_agent)) {

                $os_platform    .=  " OS X";

            } else if (preg_match('/mac_powerpc/i', $user_agent)) {
                $os_platform  .=  " OS 9";
            }

        } else if (preg_match('/linux/i', $user_agent)) {
            $os_platform    =   "Linux";
        }

        if (preg_match('/iphone/i', $user_agent)) {

            $os_platform    =   "iPhone";

        } else if (preg_match('/android/i', $user_agent)) {

            $os_platform    =   "Android";

        } else if (preg_match('/blackberry/i', $user_agent)) {

            $os_platform    =   "BlackBerry";

        } else if (preg_match('/webos/i', $user_agent)) {

            $os_platform    =   "Mobile";

        } else if (preg_match('/ipod/i', $user_agent)) {

            $os_platform    =   "iPod";

        } else if (preg_match('/ipad/i', $user_agent)) {

            $os_platform    =   "iPad";

        }

        if (preg_match('/msie/i', $user_agent) && !preg_match('/opera/i', $user_agent)) { 

            $browser        =   "Internet Explorer"; 

        } else if (preg_match('/firefox/i', $user_agent)) { 

            $browser        =   "Firefox";

        } else if (preg_match('/chrome/i', $user_agent)) { 

            $browser        =   "Chrome";

        } else if (preg_match('/safari/i', $user_agent)) { 

            $browser        =   "Safari";

        } else if (preg_match('/opera/i', $user_agent)) { 

            $browser        =   "Opera";

        } else if (preg_match('/netscape/i', $user_agent)) { 

            $browser        =   "Netscape"; 

        }

        if ($os_platform == "iPhone" || $os_platform == "Android" || $os_platform == "BlackBerry" || $os_platform == "Mobile" || $os_platform == "iPod" || $os_platform == "iPad") { 

            if (preg_match('/mobile/i', $user_agent)) {

                $browser = "Handheld Browser";

            }

        }

        return array(
        	'userAgent' => $user_agent,
        	'name'      => $browser,
        	'platform'  => $os_platform,
        );
	}

	public function datatable(){
		$array = $this->sessions->datatable();
		$this->json($array);
		$data = array();
		foreach ($array as $rows){
			$user_agent = $this->getBrowser($rows['user_agent']);
			array_push($data, array(
				$user_agent['name'].' on '.$user_agent['platform'],
                $rows['ip_address'],
				date('m/d/Y H:i:s',$rows['timestamp']),
			));
		}
		$this->json(array('data' => $data));
	}
}

/* End of file  */
/* Location: ./application/controllers/ */
