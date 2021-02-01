/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhln.daos;

import anhln.dtos.UserDTO;
import anhln.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;

/**
 *
 * @author leean
 */
public class UserDAO {

    Connection conn = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

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

    public UserDTO checkLogin(String userId, String password) throws ClassNotFoundException, SQLException, NamingException {
        UserDTO result = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String query = "Select userID, fullName, phone,address,roleID from tblUsers "
                        + "where userID ='" + userId + "'and "
                        + "password = '" + password + "'";
                pst = conn.prepareStatement(query);
                rs = pst.executeQuery();
                if (rs.next()) {
                    String userID = rs.getString("userID");
                    String fullName = rs.getString("fullName");
                    String roleID = rs.getString("roleID");
                    String phone = rs.getString("phone");
                    String address = rs.getString("address");
                    result = new UserDTO(userID, fullName, "", address, phone, roleID);
                }
            }
        } finally {
            close();
        }
        return result;
    }

    public boolean CreateEmail(String email, String emailName) throws ClassNotFoundException, SQLException, NamingException {

        boolean check = true;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String query = "INSERT INTO tblUsers(userID,fullName,password,address,phone,roleID)  "
                        + "VALUES(?,?,'','','','US')";
                pst = conn.prepareStatement(query);
                pst.setString(1, email);
                pst.setString(2, emailName);
                rs = pst.executeQuery();
                pst.executeUpdate();

                
            }
        } finally {
            check = false;
            close();
        }
        return check;
    }
}
