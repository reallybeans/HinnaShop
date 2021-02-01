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
public class ProductDTO implements Serializable {

    private String productID;
    private String productName;
    private int quanlity;
    private String description;
    private String categoryID;
    private float price;
    private String myDate;
    private String img;
    private boolean status;

    public ProductDTO(String productID, String productName, float price, String img) {
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.img = img;
    }

    public ProductDTO(String productID, String productName, int quanlity, float price, String img) {
        this.productID = productID;
        this.productName = productName;
        this.quanlity = quanlity;
        this.price = price;
        this.img = img;
    }

    public ProductDTO() {
    }
        public ProductDTO(String productID, String productName, int quanlity, String description, String categoryID, float price, String img, boolean status) {
        this.productID = productID;
        this.productName = productName;
        this.quanlity = quanlity;
        this.description = description;
        this.categoryID = categoryID;
        this.price = price; 
        this.img = img;
        this.status = status;
    }
    public ProductDTO(String productID, String productName, int quanlity, String description, String categoryID, float price, String myDate, String img, boolean status) {
        this.productID = productID;
        this.productName = productName;
        this.quanlity = quanlity;
        this.description = description;
        this.categoryID = categoryID;
        this.price = price;
        this.myDate = myDate;
        this.img = img;
        this.status = status;
    }

    public ProductDTO(String productID, String myDate, boolean status) {
        this.productID = productID;
        this.myDate = myDate;
        this.status = status;
    }

    public ProductDTO(String productID, int quanlity, boolean status) {
        this.productID = productID;
        this.quanlity = quanlity;
        this.status = status;
    }
 

    public ProductDTO(String productID, String productName, int quanlity, String description, String categoryID, float price, String img) {
        this.productID = productID;
        this.productName = productName;
        this.quanlity = quanlity;
        this.description = description;
        this.categoryID = categoryID;
        this.price = price;
        this.img = img;
    }

    public boolean getStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQuanlity() {
        return quanlity;
    }

    public void setQuanlity(int quanlity) {
        this.quanlity = quanlity;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(String categoryID) {
        this.categoryID = categoryID;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getMyDate() {
        return myDate;
    }

    public void setMyDate(String myDate) {
        this.myDate = myDate;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

}
