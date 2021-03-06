<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Report_provider extends MY_Controller {

	public function __construct(){
		parent::__construct();
        $this->isLogged();
        $this->isProtected();
	}

	 public function index(){
    	require_once(APPPATH.'third_party/html2pdf/vendor/autoload.php'); 
     	$data['providers'] = $this->providers->datatable(); 
     	$template_pdf = $this->load->view('purchase/report/view_pdf', $data, TRUE);
     	$html2pdf = new HTML2PDF('P', 'A4', 'en');
     	$html2pdf->WriteHTML($template_pdf);
     	$html2pdf->Output('exemple.pdf');
    }

}

/* End of file  */
/* Location: ./application/controllers/ */