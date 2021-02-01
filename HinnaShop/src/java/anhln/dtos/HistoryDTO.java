/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhln.dtos;

/**
 *
 * @author leean
 */
public class HistoryDTO {
    private String orderID ;
    private String productID;
    private String productName;
    private String categoryID;
    private int quantity;
    private String img; 
    private float price;  

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public HistoryDTO(String productID, String productName, String img, float price) {
        this.productID = productID;
        this.productName = productName;
        this.img = img;
        this.price = price;
    }


    public HistoryDTO(String orderID, String productName, String categoryID, int quantity, String img, float price) {
        this.orderID = orderID;
        this.productName = productName;
        this.categoryID = categoryID;
        this.quantity = quantity;
        this.img = img;
        this.price = price; 
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
 
    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }
 
    
}
