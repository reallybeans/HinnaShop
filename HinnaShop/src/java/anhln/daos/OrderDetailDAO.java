/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhln.daos;

import anhln.dtos.HistoryDTO;
import anhln.dtos.OrderDetailDTO;
import anhln.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author leean
 */
public class OrderDetailDAO {

    Connection conn = null;
    PreparedStatement pst = null;
    Statement stm = null;
    ResultSet rs = null;
    List<HistoryDTO> result = null;

    void close() throws SQLException {
        if (rs != null) {
            rs.close();
        }
        if (pst != null) {
            pst.close();
        }
        if (conn != null) {
            conn.close();
        }
    }

    public boolean createOrderDetail(OrderDetailDTO orderDetail) throws SQLException, NamingException {
        boolean check = true;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT into tblOrderDetailID(orderDetailID, productID, quantity, price, status, orderID) "
                        + "values(?, ?, ?, ?, 'true', ?)";
                pst = conn.prepareStatement(sql);
                pst.setString(1, orderDetail.getOrderDetailID());
                pst.setString(2, orderDetail.getProductID());
                pst.setFloat(3, orderDetail.getQuantity());
                pst.setFloat(4, orderDetail.getPrice());
                pst.setString(5, orderDetail.getOrderID());
                pst.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
            check = false;
        } finally {
            close();
        }
        return check;
    }

    public List<HistoryDTO> showListDetail(String orderID) throws SQLException, NamingException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select orderID, p.productName,p.categoryID, d.quantity, p.price, p.img from tblProduct p inner join tblOrderDetailID d on p.productID = d.productID where orderID ='" + orderID + "'";
                pst = conn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String productName = rs.getString("productName");
                    int quanlity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    float price1 = rs.getFloat("price");
                    float price = (float) ((double) Math.round(price1 * 100.0) / 100.0);

                    String img = rs.getString("img");
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(new HistoryDTO(orderID, productName, categoryID, quanlity, img, price));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {

        } finally {
            close();
        }
        return result;
    }

    public List<OrderDetailDTO> showallListDetail() throws SQLException, NamingException {
        List<OrderDetailDTO> result1 = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select orderID, d.productID from tblProduct p inner join tblOrderDetailID d on p.productID = d.productID";
                pst = conn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String orderID = rs.getString("orderID");
                    if (result1 == null) {
                        result1 = new ArrayList<>();
                    }
                    result1.add(new OrderDetailDTO(productID, orderID));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {

        } finally {
            close();
        }
        return result1;
    }
    public List<HistoryDTO> showallListRecommen() throws SQLException, NamingException {
         
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Select d.productID, p.productName , p.price, p.img from tblProduct p inner join tblOrderDetailID d on p.productID = d.productID";
                pst = conn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    float price = rs.getFloat("price");
                    String img = rs.getString("img");
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(new HistoryDTO(productID, productName, img, price));
                }
            }
        } catch (ClassNotFoundException | SQLException e) {

        } finally {
            close();
        }
        return result;
    }
//    public static void main(String[] args) throws SQLException {
//        List<HistoryDTO> a = new ArrayList<>();
//        OrderDetailDAO dao = new OrderDetailDAO();
//        a = dao.showListDetail("899166984");
//        for (HistoryDTO x : a) {
//            System.out.println(x.toString());
//        }
//    }
}
