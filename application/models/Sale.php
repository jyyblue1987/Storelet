<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Sale extends CI_Model {

	public $variable;

	public function __construct(){
		parent::__construct();
		
	}

	public function datatable(){
		$this->db->select('id ,description,sale_price,stock');
		$this->db->from('storelte_products');
		$query = $this->db->get();
		return $query->result_array();
	}
    
    public function checar_existe_carrito(){ //Checo si el usuario actual tiene un carrito en la BD y si no crea uno nuevo y retorna el id del nuevo carrito(orden)
        $this->db->select("id")->from("storelte_order")->where("user_id", $this->session->log['id'])->where("status", 0)->limit(1);
        $query = $this->db->get();
        if(!$query->num_rows()){
            $nuevo_carrito = array(
                'user_id' => $this->session->log['id'],
                'status' => 0
            );
            $this->db->insert('storelte_order', $nuevo_carrito);
            return $this->db->insert_id();
        }
        else{
            return $query->row()->id;
        }
    }
    public function checa_carrito_vacio($id_carrito){
        return $this->db->where("or.order_id", $id_carrito)->from("storelte_order_detail or")->join("storelte_order od", "od.id=or.order_id", "inner")->where("od.status", 0)->count_all_results();
    }
    public function checa_existe_producto_carrito($order_id, $product_id){
        return $this->db->where("order_id", $order_id)->where("product_id", $product_id)->from("storelte_order_detail")->count_all_results();
    }
    public function get_current_cart_qty($order_id, $product_id){
        $this->db->select("quantity")->from("storelte_order_detail")->where("order_id", $order_id)->where("product_id", $product_id)->limit(1);
        $query = $this->db->get();
        return $query->row()->quantity;
    }
    
    public function agregar_setear_productos_carrito($order_id, $product_id, $quantity, $action){
        if($action == 1){
            $this->db->set("stock", "stock - ". $quantity, FALSE);
        }
        else{
            if($quantity == 0){
                
            }
            $this->db->set("stock", "stock - " . ($quantity - $this->get_current_cart_qty($order_id, $product_id)), FALSE);
        }
        $this->db->where("id", $product_id);
        if($this->db->update("storelte_products")){
            if($action == 1){
            $this->db->set("quantity", "quantity + " . $quantity, FALSE);
            }
            else{
                $this->db->set("quantity", $quantity);
            }
            $this->db->where("order_id", $order_id)->where("product_id", $product_id);
            if($this->db->update("storelte_order_detail")){
                return true;
            }
            else{
                if($action == 1){
                    $this->db->set("stock", "stock + ". $quantity, FALSE);
                }
                else{
                    $this->db->set("stock", "stock + " . ($quantity - $this->get_current_cart_qty($order_id, $product_id)), FALSE);
                }
                $this->db->where("id", $product_id);
                $this->db->update("storelte_products");
                return false;
            }
        }
        else{
            return false;
        }
        
    }
    public function agregar_objeto_carrito($data){
        $this->db->set("stock", "stock - " . $data['quantity'], FALSE)->where("id", $data['product_id']);
        if($this->db->update("storelte_products")){
            if($this->db->insert("storelte_order_detail", $data)){
                return true;
            }
            else{
                $this->db->set("stock", "stock + " . $data['quantity'], FALSE)->where("id", $data['product_id']);
                $this->db->update("storelte_products");
                return false;
            }
        }
        else{
            return false;
        }
    }
    public function eliminar_producto_carrito($order_id, $product_id){
        $this->db->set("stock", "stock + " . $this->get_current_cart_qty($order_id, $product_id), FALSE);
        $this->db->where("id", $product_id);
        if($this->db->update("storelte_products")){
            $this->db->where("order_id", $order_id);
            $this->db->where("product_id", $product_id);
            return $this->db->delete("storelte_order_detail");
        }
        else{
            return false;
        }
        
    }
    public function get_all_cart($order_id){
        $this->db->select("od.product_id as id, od.quantity as qty, od.price as price, pr.description as name")->from("storelte_order_detail od")->join("storelte_products pr", "od.product_id = pr.id", "inner")->where("order_id", $order_id);
        $query = $this->db->get();
        return $query->result_array();
    }
    
    public function concretar_venta($order_id, $total, $payment, $change_due){
        $this->db->set("status", 1);
        $this->db->set("total", $total);
        $this->db->set("cash_tend", $payment);
        $this->db->set("change_due", $change_due);
        $this->db->where("id", $order_id);
        if($this->db->update("storelte_order")){
            return true;
        }
        else{
            return false;
        }
    }

    public function ticket(){
        $this->db->select('*');
        $this->db->from('ticket');
        $query = $this->db->get();
        return $query->result_array();
    }
}

/* End of file  */
/* Location: ./application/models/ */