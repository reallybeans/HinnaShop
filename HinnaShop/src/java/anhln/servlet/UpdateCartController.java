/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhln.servlet;

import anhln.daos.ProductDAO;
import anhln.dtos.CartDTO;
import anhln.dtos.ProductDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;
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
public class UpdateCartController extends HttpServlet {

    Logger loger = Logger.getLogger(UpdateCartController.class);
    private final String SUCCESS = "paging";

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
            session.removeAttribute("ANNOUCE_ORDER");
            session.removeAttribute("ANNOUCE_FAILURES");
            session.removeAttribute("ANNOUCE_FAILURE");
            session.removeAttribute("ANNOUCE_ORDER"); 

            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            request.setAttribute("NAME_ANNOUCE", productName);
            String img = request.getParameter("img");
            String checkPrice = request.getParameter("price");
            if (checkPrice == null) {
                checkPrice = "0";
            }
            float price1 = Float.parseFloat(checkPrice);
            float price = (float) ((double) Math.round(price1 * 100.0) / 100.0);
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> listCheck = new ArrayList<>();
            listCheck = dao.ListCheck();
            int quantity = Integer.parseInt(request.getParameter("txtQuantity"));
            int quantity1 = 0;
            CartDTO cart = (CartDTO) session.getAttribute("CART");
            ProductDTO pro = new ProductDTO();
            if (cart != null) {
                for (ProductDTO x : cart.getCart().values()) {
                    if (x.getProductID().equals(productID)) {
                        for (ProductDTO x1 : listCheck) {
                            if (productID.equals(x1.getProductID())) {
                                if (x1.getQuanlity() == 0) {
                                    session.setAttribute("ERROR_NAME", x.getProductName());
                                    session.setAttribute("ANNOUCE_EMPTY", "FAIL");
                                    break;
                                }
                                quantity1 = x1.getQuanlity();
                                if (quantity <= quantity1) {
                                    pro = new ProductDTO(productID, productName, quantity, price, img);
                                    request.setAttribute("ANNOUCE", "COMPLETE");
                                    break;
                                } else {
                                    request.setAttribute("ANNOUCE_FAILURE", "FAIL");

                                }
                            }
                        }
                    }
                }
                cart.update(pro);
                session.setAttribute("CART", cart);
            }
            url = SUCCESS;
        } catch (ClassNotFoundException | NumberFormatException | SQLException | NamingException e) {
            loger.error("Error at UpdateCartController: " + e.toString());
        } finally {
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
