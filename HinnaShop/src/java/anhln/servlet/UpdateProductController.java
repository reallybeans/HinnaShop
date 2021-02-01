/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhln.servlet;

import anhln.daos.ProductDAO;
import anhln.dtos.CategoryDTO;
import anhln.dtos.ProductDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

/**
 *
 * @author leean
 */
public class UpdateProductController extends HttpServlet {

    Logger loger = Logger.getLogger(UpdateProductController.class);

    private static final String SUCCESS = "paging";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            HttpSession session = request.getSession();
            ProductDAO dao = new ProductDAO();
            String userID = (String) session.getAttribute("USERID");
            List<CategoryDTO> listCate = new ArrayList<>();
            String productID = request.getParameter("txtProductID");
            String productName = request.getParameter("txtProductName");
            int quanlity = Integer.parseInt(request.getParameter("txtQuanlity"));
            String description = request.getParameter("txtDescription");
            String cateID = request.getParameter("txtCate");
            float price1 = Float.parseFloat(request.getParameter("txtPrice"));
            float price = Math.round(price1 * 100) / 100;
            String myImage = "img/" + request.getParameter("txtImg");
            String status = request.getParameter("txtStatus");
            boolean mainStatus = false;
            boolean checkPro = false;
            boolean checkPro1 = false;
            if (status.equals("TRUE")) {
                mainStatus = true;
            }
            ProductDTO pro = new ProductDTO(productID, productName, quanlity, description, cateID, price, myImage, mainStatus);
            if ("img/".equals(myImage)) {
                checkPro1 = dao.upadteProWithoutImg(pro);
            } else {
                checkPro = dao.upadtePro(pro);
            }
            listCate = dao.listCate();
            if (checkPro == true || checkPro1 == true) {
                session.setAttribute("LISTCATE", listCate);
                dao.addToUpadtePro(userID,"UPDATE");
            } else {
                request.setAttribute("DULICATED1", "OMG!");
            }
            url = SUCCESS;
        } catch (NumberFormatException | SQLException e) {
            loger.error("Error at UpdateProductController: " + e.toString());

        }finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
