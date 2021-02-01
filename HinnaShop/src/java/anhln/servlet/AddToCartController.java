/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhln.servlet;

import anhln.daos.OrderDAO;
import anhln.daos.OrderDetailDAO;
import anhln.daos.ProductDAO;
import anhln.dtos.CartDTO;
import anhln.dtos.HistoryDTO;
import anhln.dtos.OrderDTO;
import anhln.dtos.OrderDetailDTO;
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
public class AddToCartController extends HttpServlet {

    Logger loger = Logger.getLogger(AddToCartController.class);
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
        String url = SUCCESS;
        try {
            HttpSession session = request.getSession();
            session.removeAttribute("ANNOUCE_ORDER");
            session.removeAttribute("ANNOUCE_FAILURES");
            session.removeAttribute("ANNOUCE_FAILURE");
            session.removeAttribute("ANNOUCE_ORDER");
            session.removeAttribute("ERROR_NAME");
            session.removeAttribute("ANNOUCE_EMPTY");
            session.removeAttribute("LIST_RECOMMEN");
            String userID = (String) session.getAttribute("USERID");
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
            OrderDAO dao1 = new OrderDAO();
            OrderDetailDAO dao2 = new OrderDetailDAO();
            List<ProductDTO> listCheck = new ArrayList<>();
            List<OrderDTO> listOrderID = new ArrayList<>();
            List<OrderDetailDTO> listCheckOrder = new ArrayList<>();
            List<HistoryDTO> recommenList = new ArrayList<>();
            listCheck = dao.ListCheck();//check quantity 
            listOrderID = dao1.showList(userID);
            listCheckOrder = dao2.showallListDetail();
            recommenList = dao2.showallListRecommen();

            if (session.getAttribute("LOGIN_NAME1") != null) {
                boolean check = false;
                boolean checkRe = false;

                ProductDTO pro = new ProductDTO(productID, productName, 1, price, img);
                CartDTO cart = (CartDTO) session.getAttribute("CART");
                String customerName = (String) session.getAttribute("LOGIN_NAME1");
                //Check quantity = 0
                for (ProductDTO x : listCheck) {
                    if (x.getProductID().equals(productID)) {
                        if (x.getQuanlity() == 0) {
                            request.setAttribute("ANNOUCE_FAILURES", "FAIL");
                            check = true;
                            break;
                        }
                    }
                }
                if (cart == null && check != true) {
                    cart = new CartDTO(customerName, null);
                } else if (check != true) {
                    for (ProductDTO x : cart.getCart().values()) {
                        if (x.getProductID().equals(productID)) {
                            for (ProductDTO x1 : listCheck) {
                                if (productID.equals(x1.getProductID())) {
                                    if (x.getQuanlity() < x1.getQuanlity()) {
                                        pro = new ProductDTO(productID, productName, 1, price, img);
                                        request.setAttribute("ANNOUCE_ADD", "COMPLETE");
                                        cart.add(pro);
                                        session.setAttribute("CART", cart);
                                        check = true;

//                                        int numberPage = 0;
//                                        int total = listRecommen.size();
//                                        numberPage = total / 5;
//                                        if (total % 5 != 0) {
//                                            numberPage++;
//                                        }
//                                        session.setAttribute("NUMBERPAGE_RECOMMEN", numberPage);
                                        break;
                                    } else {
                                        check = true;
                                        request.setAttribute("ANNOUCE_FAILURE", "FAIL");
                                    }
                                }
                            }
                        }
                    }
                    for (OrderDTO x : listOrderID) {
                        for (OrderDetailDTO x1 : listCheckOrder) {
                            if (x.getOrderID().equals(x1.getOrderID())) {
                                checkRe = true;
                            }
                        }
                    }
                }
                if (false == check && request.getAttribute("ANNOUCE_FAILURE") == null) {
                    request.setAttribute("ANNOUCE_ADD", "COMPLETE");
                    cart.add(pro);
                    session.setAttribute("CART", cart);
                    for (OrderDTO x : listOrderID) {
                        for (OrderDetailDTO x1 : listCheckOrder) {
                            if (x.getOrderID().equals(x1.getOrderID())) {
                                checkRe = true;
                            }
                        }
                    }
                }
                if (checkRe == true) {
                    for (int i = 0; i < recommenList.size(); i++) {
                        if (recommenList.get(i).getProductID().equals(productID)) {
                            recommenList.remove(i);
                        }
                        for (int j = 0; j < recommenList.size() - 1; j++) {
                            if (recommenList.get(i).getProductID().equals(recommenList.get(j).getProductID())) {
                                recommenList.remove(j);
                            }
                        }
                    }
                    session.setAttribute("LIST_RECOMMEN", recommenList);
                } else {
                    request.setAttribute("NOT_RECOMMEN", "NO");
                }
            }
            url = SUCCESS;
        } catch (ClassNotFoundException | NumberFormatException | SQLException | NamingException e) {
            loger.error("Error at AddToCartController: " + e.toString());
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
