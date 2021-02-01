/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhln.dtos;

import java.io.Serializable;

/**
 *
 * @author leean
 */
public class OrderDetailDTO implements Serializable{
    private String orderDetailID;
    private String productID;
    private int quantity;
    private float price;
    private String orderID;

    public OrderDetailDTO(String productID, String orderID) {
        this.productID = productID;
        this.orderID = orderID;
    }

    public OrderDetailDTO(String orderDetailID, String productID, int quantity, float price, String orderID) {
        this.orderDetailID = orderDetailID;
        this.productID = productID;
        this.quantity = quantity;
        this.price = price;
        this.orderID = orderID;
    }

    public String getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(String orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }
    
}
