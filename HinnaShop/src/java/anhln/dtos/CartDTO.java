/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhln.dtos;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author leean
 */
public class CartDTO {
    private Map<String, ProductDTO> cart;
    private String customerName;

    public CartDTO() {
    }

    public CartDTO( String customerName, Map<String, ProductDTO> cart) {
        this.cart = cart;
        this.customerName = customerName;
    }
 

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }
    public void add(ProductDTO pro){
        if (this.cart == null) {
            this.cart = new HashMap<>();
        }
        if (this.cart.containsKey(pro.getProductID())) {
            int quantity = this.cart.get(pro.getProductID()).getQuanlity();
            pro.setQuanlity(quantity + pro.getQuanlity());
        }
    cart.put(pro.getProductID(), pro);  
    }
    public void delete(String id){
        if (this.cart == null) {
            return;
        }
        if (this.cart.containsKey(id)) {
            this.cart.remove(id);
        }
    }
    public void update(ProductDTO pro){
        if (this.cart.containsKey(pro.getProductID())) {
            this.cart.replace(pro.getProductID(), pro);
        }
    }
}
