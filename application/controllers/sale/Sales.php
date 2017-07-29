<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Sales extends MY_Controller {

    public function __construct(){
        parent::__construct();
        $this->isLogged();
    }

    public function index(){
        $data = $this->session->userdata('log');
        $data['module']  = "Inventory";
        $data['fields']  = $this->getModules();
        $this->load->view('header',$data);
        $this->load->view('index');
        $this->load->view('sales/sales');
        $this->load->view('footer');
    }

    public function getViewSearch(){
        $this->load->view('sales/get_view_search_product');
    }

    public function search_product(){
        $array  = $this->products->search();
        $data = array();
        foreach ($array as $key => $value) {
            $data[] = array(
                'id' => $value->id, 
                'name' => $value->description,
                'price'  => $value->sale_price,
                'qty' => $value->stock
            );
        }
        $this->json($data);
    }

    public function dataTable(){
        $array = $this->sale->datatable();
        $this->json($array);
        $data = array();
        foreach ($array as $rows){
            array_push($data, array(
                $rows['id'],
                $rows['description'],
                $rows['stock'],
                $rows['sale_price'],
            ));
        }
        $this->json(array('data' => $data));
    }

    public function add_cart(){
                $this->session->set_userdata("carrito", $this->sale->checar_existe_carrito());
        $response = array(
            "status" => 0
        );
        $producto_actual = array(
            'id' => $this->input->post("id"),
            'name' => $this->input->post("name"),
            'qty' => $this->input->post("qty"),
            'price' => $this->input->post("price"),
        );
        $tipo_operacion = $this->input->post("tipo_operacion");
        $producto = $this->products->get_product(md5($producto_actual['id']));
        $valor_compara = $tipo_operacion == 1 ? $producto->stock - $producto_actual['qty'] : $producto->stock - ($producto_actual['qty'] - $this->sale->get_current_cart_qty($this->session->carrito, $producto_actual['id']));
        if($producto->min_stock <= $valor_compara){
            if($this->sale->checa_carrito_vacio($this->session->carrito) == 0){
                $data_producto = array(
                    'order_id' => $this->session->carrito,
                    'product_id' => $producto_actual['id'],
                    'quantity' => $producto_actual['qty'],
                    'price' => $producto_actual['price'],
                    'total' => $producto_actual['qty'] * $producto_actual['price'],
                    'subtotal' => $producto_actual['qty'] * $producto_actual['price']
                );
                if($this->sale->agregar_objeto_carrito($data_producto)){
                    $response['status'] = 1;
                }
                else{
                    $response['error'] = "Error al agregar el objeto al carrito, por favor intente de nuevo";
                }
            }
        
            else{
                if($this->sale->checa_existe_producto_carrito($this->session->carrito, $producto_actual['id'])){
                    if($tipo_operacion == 0 && $producto_actual['qty'] == 0){
                        if($this->sale->eliminar_producto_carrito($this->session->carrito, $producto_actual['id'])){
                            $response['status'] = 1;
                        }
                        else{
                            $response['error'] = "Ha Ocurrido un error al actualizar el carrito, por favor intentalo de nuevo";
                            $response['status'] = 0;
                        }
                    }
                    else{
                        if($this->sale->agregar_setear_productos_carrito($this->session->carrito, $producto_actual['id'], $producto_actual['qty'], $tipo_operacion)){
                            $response['status'] = 1;
                        }
                        else{
                            $response['error'] = "Ha Ocurrido un error al actualizar el carrito, por favor intentalo de nuevo";
                            $response['status'] = 0;
                        }
                    }
                    
                }
                else{
                    $data_producto = array(
                        'order_id' => $this->session->carrito,
                        'product_id' => $producto_actual['id'],
                        'quantity' => $producto_actual['qty'],
                        'price' => $producto_actual['price'],
                        'total' => $producto_actual['qty'] * $producto_actual['price'],
                        'subtotal' => $producto_actual['qty'] * $producto_actual['price']
                    );
                    if($this->sale->agregar_objeto_carrito($data_producto)){
                        $response['status'] = 1;
                    }
                    else{
                        $response['error'] = "Ha Ocurrido un error al actualizar el carrito, por favor intentalo de nuevo";
                        $response['status'] = 0;
                    }
                }
            }
        }
        else{
            $response['error'] = "No hay suficientes existencias de este producto para agregar al carrito, actualmente solo hay: " . ($producto->stock - $producto->min_stock);
        }
        
        $response['product_data'] = $this->sale->get_all_cart($this->session->carrito);
        echo json_encode($response);
        //$this->session->set_userdata('cart_products',$cart_products);
    }
    
    public function show_cart(){
        $this->session->carrito = $this->sale->checar_existe_carrito();
        echo json_encode($this->sale->get_all_cart($this->session->carrito));
    }
    
    public function concretar_venta(){
        if($this->sale->checa_carrito_vacio($this->session->carrito)){
            $total = $this->input->post("total", TRUE);
            $cantidad_pagada = $this->input->post("cantidad_pagada", TRUE);
            $cambio = $cantidad_pagada - $total;
            $array = $this->sale->get_all_cart($this->session->carrito);
            $product_id = array();
            if($this->sale->concretar_venta($this->session->carrito, $total, $cantidad_pagada, $cambio)){
                $this->json(array('success' => 'The sale was successfully made'));
            }
            else{
                $this->json(array('error' => 'There was an error making the sale, please try again'));
            }

            foreach ($array as $key => $value) {
                $product_id[] = $value['id'];
            }

            $product = $this->products->get_product_id($product_id);
           
            if ($product->stock <= $product->min_stock) {
                $this->notification->addNotification('low stock', $product_id, $this->session->log['id'], 'low stock');
            } else {
                # code...
            }
            
        }
        else{
            $this->json(array('error' => 'The cart is empty'));
        }
    }

    public function payment(){
        $this->load->view('sales/payment');
    }
}

/* End of file sales.php */
/* Location: ./application/controllers/sales.php */