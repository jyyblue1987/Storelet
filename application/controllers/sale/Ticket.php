<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ticket extends MY_Controller {

	public function __construct(){
		parent::__construct();
		$this->isLogged();
	}

	public function index(){
		require_once(APPPATH.'third_party/html2pdf/vendor/autoload.php');
		$data['ticket'] = $this->sale->ticket(); 
		$html2pdf = new HTML2PDF('P', array(70,38), 'en', true, 'UTF-8', array(0, 0, 0, 0));
		ob_start();
		$html = $this->load->view('sales/ticket/ticket', $data, TRUE);
		$html2pdf->WriteHTML($html);
		$html2pdf->pdf->IncludeJS('print(TRUE)');
		$html2pdf->Output('example.pdf');
	}

	public function ticket(){
		$ticket = $this->sale->ticket();
		$this->json($ticket);
	}

}

/* End of file  */
/* Location: ./application/controllers/ */