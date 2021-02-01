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
public class OrderDTO implements Serializable {

    private String orderID;
    private String total;
    private String userID;
    private String myDate;
    private String address;

    public String getMyDate() {
        return myDate;
    }

    public void setMyDate(String myDate) {
        this.myDate = myDate;
    }

    public OrderDTO(String orderID, String total, String userID, String myDate, String address) {
        this.orderID = orderID;
        this.total = total;
        this.userID = userID;
        this.myDate = myDate;
        this.address = address;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public OrderDTO(String orderID, String total, String userID, String address) {
        this.orderID = orderID;
        this.total = total;
        this.userID = userID;
        this.address = address;
    }

}
