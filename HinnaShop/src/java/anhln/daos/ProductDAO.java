/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhln.daos;

/**
 *
 * @author leean
 */
import anhln.dtos.CategoryDTO;
import anhln.dtos.ProductDTO;
import anhln.utils.DBUtils;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

public class ProductDAO {

    Connection conn = null;
    PreparedStatement pst = null;
    Statement stm = null;
    ResultSet rs = null;
    List<ProductDTO> result = null;

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

    public List<ProductDTO> showAllList() throws SQLException, ClassNotFoundException, NamingException {

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String query = "Select productID, productName, quanlity, description, categoryID, price, DateOfCreate, img, status from tblProduct";
                pst = conn.prepareStatement(query);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    int quanlity = rs.getInt("quanlity");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    float price = rs.getFloat("price");
                    Date date = rs.getDate("DateOfCreate");
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MMM-dd hh:mm:ss");
                    String myDate = dateFormat.format(date);
                    String img = rs.getString("img");
                    boolean status = rs.getBoolean("status");
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(new ProductDTO(productID, productName, quanlity, description, categoryID, price, myDate, img, status));
                }
            }
        } finally {
            close();
        }
        return result;
    }

    public boolean createPro(ProductDTO pro) throws SQLException {
        boolean check = true;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblProduct(productID, productName, quanlity, description, categoryID, price, DateOfCreate,img,status) "
                        + "VALUES(?,?,?,?,?,?,getDate(),?,'true')";
                pst = conn.prepareStatement(sql);
                pst.setString(1, pro.getProductID());
                pst.setString(2, pro.getProductName());
                pst.setInt(3, pro.getQuanlity());
                pst.setString(4, pro.getDescription());
                pst.setString(5, pro.getCategoryID());
                pst.setFloat(6, pro.getPrice());
                pst.setString(7, pro.getImg());
                pst.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException | NamingException e) {
            check = false;
            System.out.println(e);
        } finally {
            close();
        }
        return check;
    }

    public boolean upadtePro(ProductDTO pro) throws SQLException {
        boolean results = true;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Update tblProduct SET productName = '" + pro.getProductName()
                        + "', quanlity =" + pro.getQuanlity() + ", categoryID = '" + pro.getCategoryID() + "' ,"
                        + " description = '" + pro.getDescription() + "',price =" + pro.getPrice() + ",img = '" + pro.getImg() + "', status = '" + pro.getStatus() + "' Where productID = '" + pro.getProductID() + "'";
                pst = conn.prepareStatement(sql);
                pst.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException | NamingException e) {
            results = false;
        } finally {
            close();
        }
        return results;
    }

    public boolean upadteProWithoutImg(ProductDTO pro) throws SQLException {
        boolean results = true;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Update tblProduct SET productName = '" + pro.getProductName()
                        + "', quanlity =" + pro.getQuanlity() + ", categoryID = '" + pro.getCategoryID() + "' ,"
                        + " description = '" + pro.getDescription() + "',price =" + pro.getPrice() + ", status = '" + pro.getStatus() + "' Where productID = '" + pro.getProductID() + "'";
                pst = conn.prepareStatement(sql);
                pst.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException | NamingException e) {
            results = false;
        } finally {
            close();
        }
        return results;
    }

    public void addToUpadtePro(String userID, String detail) throws SQLException {

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblHistoryUpdate(userID, date, description) VALUES('"+userID+"',getDate(),'"+detail+"')";
                pst = conn.prepareStatement(sql); 
                pst.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException | NamingException e) {
        } finally {
            close();
        }
    }

    public void deletePro(String ProductID) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "Update tblProduct SET status = 'false' where productID = '" + ProductID + "'";
                pst = conn.prepareStatement(sql);
                pst.executeUpdate();
            }
        } catch (ClassNotFoundException | SQLException | NamingException e) {
        } finally {
            close();
        }
    }

    public int getNumberPage() throws SQLException {
        String sql = "Select count(*) from tblProduct";
        try {
            conn = DBUtils.getConnection();
            pst = conn.prepareStatement(sql);
            rs = pst.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 8;
                if (total % 8 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (ClassNotFoundException | SQLException | NamingException e) {
        } finally {
            close();
        }
        return 0;
    }

    public List<ProductDTO> getPaging(int index) throws ClassNotFoundException, SQLException, NamingException {
        String query = "Select productID, productName, quanlity, description, categoryID, price, DateOfCreate, img, status from tblProduct"
                + " order by productID OFFSET ? ROWS FETCH FIRST 8 ROW ONLY";

        try {
            conn = DBUtils.getConnection();
            pst = conn.prepareStatement(query);
            pst.setInt(1, (index - 1) * 8);
            rs = pst.executeQuery();
            while (rs.next()) {
                String productID = rs.getString("productID");
                String productName = rs.getString("productName");
                int quanlity = rs.getInt("quanlity");
                String description = rs.getString("description");
                String categoryID = rs.getString("categoryID");
                float price1 = rs.getFloat("price");
                float price = (float) ((double) Math.round(price1 * 100.0) / 100.0);
                Date date = rs.getDate("DateOfCreate");
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MMM-dd hh:mm:ss");
                String myDate = dateFormat.format(date);
                String img = rs.getString("img");
                boolean status = rs.getBoolean("status");
                if (result == null) {
                    result = new ArrayList<>();
                }
                result.add(new ProductDTO(productID, productName, quanlity, description, categoryID, price, myDate, img, status));
            }
        } finally {
            close();
        }
        return result;
    }

    public List<ProductDTO> getSearchPaging(int index, String name, float priceSearch, String cate, String status1) throws ClassNotFoundException, SQLException {
        try {
            String query = "Select productID, productName, quanlity, description, categoryID, price, DateOfCreate, img, status from tblProduct where productName like ? and price <= ? and categoryID like ?"
                    + " order by productID OFFSET ? ROWS FETCH FIRST 8 ROW ONLY";
            conn = DBUtils.getConnection();
            if (conn != null) {
                if ("true".equals(status1)) {
                    query = "Select productID, productName, quanlity, description, categoryID, price, DateOfCreate, img, status from tblProduct where productName like ? and price <= ? and categoryID like ? and status = '" + status1 + "'"
                            + " order by productID OFFSET ? ROWS FETCH FIRST 8 ROW ONLY";
                }
                pst = conn.prepareStatement(query);
                pst.setString(1, "%" + name + "%");
                pst.setFloat(2, priceSearch);
                pst.setString(3, "%" + cate + "%");
                pst.setInt(4, (index - 1) * 8);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    int quanlity = rs.getInt("quanlity");
                    String description = rs.getString("description");
                    String categoryID = rs.getString("categoryID");
                    float price1 = rs.getFloat("price");
                    float price = (float) ((double) Math.round(price1 * 100.0) / 100.0);
                    Date date = rs.getDate("DateOfCreate");
                    DateFormat dateFormat = new SimpleDateFormat("yyyy-MMM-dd hh:mm:ss");
                    String myDate = dateFormat.format(date);
                    String img = rs.getString("img");
                    boolean status = rs.getBoolean("status");
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(new ProductDTO(productID, productName, quanlity, description, categoryID, price, myDate, img, status));
                }
            }
        } catch (ClassNotFoundException | SQLException | NamingException e) {
        } finally {
            close();
        }
        return result;
    }

    public int getNumberPagePaging(String name, float price, String cate, String status) throws SQLException {
        String query = "Select count(*) from tblProduct where productName like ? and price <= ? and categoryID like ? and status = '" + status + "'";
        if (!"true".equals(status)) {
            query = "Select count(*) from tblProduct where productName like ? and price <= ? and categoryID like ? ";
        }
        try {
            conn = DBUtils.getConnection();
            pst = conn.prepareStatement(query);
            pst.setString(1, "%" + name + "%");
            pst.setFloat(2, price);
            pst.setString(3, "%" + cate + "%");
            rs = pst.executeQuery();
            if (rs.next()) {
                int total = rs.getInt(1);
                int countPage = 0;
                countPage = total / 8;
                if (total % 8 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (ClassNotFoundException | SQLException | NamingException e) {
        } finally {
            close();
        }
        return 0;
    }

    public List<CategoryDTO> listCate() throws SQLException {
        List<CategoryDTO> listCate = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String query = "Select categoryID, name, description from tblCategory";
                pst = conn.prepareStatement(query);
                rs = pst.executeQuery();
                while (rs.next()) {
                    if (listCate == null) {
                        listCate = new ArrayList<>();
                    }
                    listCate.add(new CategoryDTO(rs.getString("categoryID"), rs.getString("name"), rs.getString("description")));
                }
            }
        } catch (ClassNotFoundException | SQLException | NamingException e) {
        } finally {
            close();
        }
        return listCate;
    }

    public List<ProductDTO> ListCheck() throws SQLException, ClassNotFoundException, NamingException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String query = "Select productID, quanlity, status from tblProduct where status = 'true'";
                pst = conn.prepareStatement(query);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    int quanlity = rs.getInt("quanlity");
                    boolean status = rs.getBoolean("status");
                    if (result == null) {
                        result = new ArrayList<>();
                    }
                    result.add(new ProductDTO(productID, quanlity, status));
                }
            }
        } finally {
            close();
        }
        return result;
    }

    public void updateQuantity(int quantity, String productID) throws SQLException {
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String query = "Update tblProduct SET quanlity = '" + quantity + "' where productID = '" + productID + "'";
                pst = conn.prepareStatement(query);
                rs = pst.executeQuery();
            }
        } catch (ClassNotFoundException | SQLException | NamingException e) {
        } finally {
            close();
        }
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        List<ProductDTO> list = new ArrayList<>();
//        ProductDAO dao = new ProductDAO();
//        list = dao.showMana();
////        System.out.println(list.get(1).getMyDate());
//        CategoryDTO cate = new CategoryDTO("123", "123", "123");
//        boolean c = dao.createCate(cate);
//        System.out.println(c);

//        List<CategoryDTO> list = dao.listCate();
//        System.out.println(list.get(0).getCateDes());
//        int i = dao.getNumberPagePaging("");
//        System.out.println(i);
    }
}
