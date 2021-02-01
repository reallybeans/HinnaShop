/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhln.daos;

import anhln.dtos.OrderDTO;
import anhln.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author leean
 */
public class OrderDAO {

    Connection conn = null;
    PreparedStatement pst = null;
    Statement stm = null;
    ResultSet rs = null;
    List<OrderDTO> result = null;

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

    public boolean createOrderID(OrderDTO order) throws SQLException, NamingException {
        boolean check = true;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT into tblOrder(orderID, Total, dateOfCreate, status, userID, address)"
                        + "values(?, ?, getdate(),'true', ?, ?)";
                pst = conn.prepareStatement(sql);
                pst.setString(1, order.getOrderID());
                pst.setString(2, order.getTotal());
                pst.setString(3, order.getUserID());
                pst.setString(4, order.getAddress());
                pst.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException e) {
            check = false;
        } finally {
            close();
        }
        return check;
    }

//    public List<OrderDTO> showList(String userIDs, int numberPage) throws SQLException, ClassNotFoundException {
//
//        conn = DBUtils.getConnection();
//        try {
//            if (conn != null) {
//                String sql = "Select orderID, total, dateofCreate,  userID,address from tblOrder order by orderID OFFSET ? ROWS FETCH FIRST 5 ROW ONLY";
//                pst = conn.prepareStatement(sql);
//                pst.setInt(1, (numberPage - 1) * 5);
//                rs = pst.executeQuery();
//                while (rs.next()) {
//                    String orderID = rs.getString("orderID");
//                    String total = rs.getString("total");
//                    Date date = rs.getDate("dateofCreate");
//                    DateFormat dateFormat = new SimpleDateFormat("dd-MM-YYYY");
//                    String myDate = dateFormat.format(date);
//                    String userID = rs.getString("userID");
//                    String address = rs.getString("address");
//                    if (result == null) {
//                        result = new ArrayList<>();
//                    }
//                    if (userIDs.equals(userID)) {
//                        result.add(new OrderDTO(orderID, total, userID, myDate, address));
//                    }
//                }
//            }
//        } catch (SQLException e) {
//
//        } finally {
//            close();
//        }
//        return result;
//    }
//    public int getNumberPage() throws SQLException, ClassNotFoundException {
//        conn = DBUtils.getConnection();
//        try {
//            if (conn != null) {
//                String sql = "Select count(*) from tblOrder";
//                pst = conn.prepareStatement(sql);
//                rs = pst.executeQuery();
//                while (rs.next()) {
//                    int total = rs.getInt(1);
//                    int countPage = 0;
//                    countPage = total / 5;
//                    if (total % 5 != 0) {
//                        countPage++;
//                    }
//                    return countPage;
//                }
//            }
//        } catch (Exception e) {
//        } finally {
//            close();
//        }
//        return 0;
//    }
    public List<OrderDTO> showList(String userIDs) throws SQLException, NamingException, ClassNotFoundException  {
        String sql = "Select orderID, total, dateofCreate,  userID,address from tblOrder  ";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) { 
                pst = conn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("orderID");
                    String total = rs.getString("total");
                    Date date = rs.getDate("dateofCreate");
                    DateFormat dateFormat = new SimpleDateFormat("dd-MM-YYYY");
                    String myDate = dateFormat.format(date);
                    String userID = rs.getString("userID");
                    String address = rs.getString("address");
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    if (userIDs.equals(userID)) {
                        result.add(new OrderDTO(orderID, total, userID, myDate, address));
                    }
                }
            }
        } catch (SQLException e) {

        } finally {
            close();
        }
        return result;
    }

    public List<OrderDTO> listSearch(String orderIDs, String date1, String userIDs /*,int numberPage*/) throws SQLException, ClassNotFoundException, NamingException {
        conn = DBUtils.getConnection();

        try {
            if (conn != null) {
                String sql = "Select orderID, total, dateofCreate,  userID, address from tblOrder"
                        + " where dateOfCreate like '%" + date1 + "%' and orderID like '%" + orderIDs + "%'"
                        + " and userID='"+userIDs+"'";
//                        + "order by orderID OFFSET ? ROWS FETCH FIRST 5 ROW ONLY";
                pst = conn.prepareStatement(sql);
//                pst.setInt(1, (numberPage - 1) * 5);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String orderID = rs.getString("orderID");
                    String total = rs.getString("total");
                    Date date = rs.getDate("dateofCreate");
                    DateFormat dateFormat = new SimpleDateFormat("dd-MM-YYYY");
                    String myDate = dateFormat.format(date);
                    String userID = rs.getString("userID");
                    String address = rs.getString("address");
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(new OrderDTO(orderID, total, userID, myDate, address));
                }
            }
        } catch (SQLException e) {

        } finally {
            close();
        }
        return result;
    }

//    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        List<OrderDTO> list = new ArrayList<>();
//        OrderDAO dao = new OrderDAO();
//        list = dao.listSearch("", "2021-01-23","bean");
//        System.out.println(list.toString());
//    }
}
