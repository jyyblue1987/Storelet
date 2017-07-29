<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Product extends MY_Controller {

	public function __construct(){
		parent::__construct();
		$this->isLogged();
        $this->isProtected();
	}

	public function index(){
		$data = $this->session->userdata('log');
		$data['module']  = "Inventory";
        $data['fields']  = $this->getModules();
        $this->load->view('header',$data);
        $this->load->view('index');
        $this->load->view('inventory/product');
        $this->load->view('footer');
	}

	public function datatable(){
		$array = $this->products->datatable();
		$this->json($array);
		$data = array();
		foreach ($array as $rows){
			array_push($data, array(
                $rows['hash_id'],
                $rows['code'],
				$rows['description'],
				$rows['purchase_price'],
				$rows['sale_price'],
				$rows['wholesale_price'],	
				$rows['stock'],
				$rows['status']
			));
		}
		$this->json(array('data' => $data));
	}

	public function getViewProduct(){
        $data['data'] = $this->providers->datatable();
		$this->load->view('inventory/get_view_product',$data);
	}

    public function codeGenerator($length){
        $first = substr(str_repeat(strtoupper(md5(rand())), ceil($length/32)), 0, $length);
        $end = substr(str_repeat(strtoupper(md5(rand())), ceil($length/32)), 0, $length);
        return $first.'-'.$end;
    }

    public function addProduct() {
        $description = $this->input->post('description');
        $cost_price = $this->input->post('cost_price');
        $selling_price = $this->input->post('selling_price');
        $wprice = $this->input->post('wprice');
        $min_stock = $this->input->post('min_stock');
        $stock = $this->input->post('stock');
        $max_stock = $this->input->post('max_stock');
        $provider = $this->input->post('provider_id');
        $data = array(
            'code' => $this->codeGenerator(4),
            'description' => $description,
            'purchase_price' => $cost_price,
            'sale_price' => $selling_price,
            'wholesale_price' => $wprice,
            'min_stock' => $min_stock,
            'stock' => $stock,
            'max_stock' => $max_stock,
            'provider_id' => $provider,
            'created_at' => date('Y-m-d H:i:s')
        );

        $this->form_validation->set_rules('description', 'description', 'trim|alpha_numeric_spaces|required');
        $this->form_validation->set_rules('purchase_price', 'purchase_price', 'callback_money|required');
        $this->form_validation->set_rules('sale_price', 'sale_price', 'callback_money|required');
        $this->form_validation->set_rules('wholesale_price', 'wholesale_price', 'callback_money|required');
        $this->form_validation->set_rules('min_stock', 'min_stock', 'numeric|required');
        $this->form_validation->set_rules('stock', 'stock', 'trim|numeric|required');
        $this->form_validation->set_rules('max_stock', 'max_stock', 'numeric|required');
        if ($this->form_validation->run() == FALSE) {
            $this->json($this->form_validation->error_array());
        } else {
            if ($data['stock'] > $data['max_stock']) {
                $this->json(array('max_stock' => 'el stock no puede ser mayor al max'));
            } else {
                if (!$this->products->isExistsProduct($data)) {
                    $this->products->addProduct($data);
                    $this->json(array('msg' => 'successfully added'));
                } else {
                    $this->json(array('duplicate' => 'product already exists'));
                }
            }
        }
    }

    public  function updateProduct() {
        $description = $this->input->post('description');
        $cost_price = $this->input->post('cost_price');
        $selling_price = $this->input->post('selling_price');
        $wprice = $this->input->post('wprice');
        $min_stock = $this->input->post('min_stock');
        $stock = $this->input->post('stock');
        $max_stock = $this->input->post('max_stock');
        $provider = $this->input->post('provider_id');
        $id = $this->input->post('hash');
        $data = array(
            'description' => $description,
            'purchase_price' => $cost_price,
            'sale_price' => $selling_price,
            'wholesale_price' => $wprice,
            'min_stock' => $min_stock,
            'stock' => $stock,
            'max_stock' => $max_stock,
            'provider_id' => $provider,
            'updated_at' => date('Y-m-d H:i:s'),
        );

        $this->form_validation->set_rules('description', 'description', 'trim|alpha_numeric_spaces|required');
        $this->form_validation->set_rules('purchase_price', 'purchase_price', 'required|callback_money');
        $this->form_validation->set_rules('sale_price', 'sale_price', 'required|callback_money');
        $this->form_validation->set_rules('wholesale_price', 'wholesale_price', 'required|callback_money');
        $this->form_validation->set_rules('min_stock', 'min_stock', 'required|numeric');
        $this->form_validation->set_rules('stock', 'stock', 'trim|numeric|required');
        $this->form_validation->set_rules('max_stock', 'max_stock', 'required|numeric');
        $this->form_validation->set_rules('provider_id', 'provider_id', 'required|numeric');

        if ($this->form_validation->run() == FALSE) {
            echo validation_errors();
        } else {
            if($data['stock'] > $data['max_stock']) {
                $this->json(array('max_stock' => 'el stock no puede ser mayor al max'));
            } else {
                if (!$this->products->isExistsProduct($data)) {
                    //$this->notification->removeNotifications($id);
                    //&& $this->products->get_product($id) > 20
                    $this->products->updateProduct($data, $id);
                    $this->json(array('msg' => 'successfully updated'));
                } else {
                    $this->json(array('duplicate' => 'product already exists'));
                }
            }
        }
    }
    
    public function getViewProductUpdate($id){
        $data['data'] = $this->providers->datatable();
        $data['product'] = $this->products->get_product($id);
        $this->load->view('inventory/get_view_product_update', $data);
	}

    function money($number){
        if (preg_match("/^(?:[0-9]{1,3})(?:,[0-9]{3})*(?:|\.[0-9]+)$/", $number)) {
            return TRUE;
        }else{
            $this->form_validation->set_rules('provider_id', 'provider_id', 'numeric|required');
            $this->form_validation->set_message('purchase_price', 'Please enter a valid phone number');
            $this->form_validation->set_message('sale_price', 'Please enter a valid phone number');
            $this->form_validation->set_message('wholesale_price', 'Please enter a valid phone number');    
        } 
    }


    public function tests(){
       echo $this->money("1,000.53");
       echo $this->money("50.00");
       echo $this->money("34.3r6");
       echo $this->money("w45.00");
       echo $this->money("a");
       echo $this->money("6,355,725.00");
       echo $this->money("355,725.00");
       echo $this->money("725.00");
    }
}

/* End of file Product.php */
/* Location: ./application/controllers/Product.php */
