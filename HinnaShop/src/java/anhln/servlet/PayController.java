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
import anhln.dtos.OrderDTO;
import anhln.dtos.OrderDetailDTO;
import anhln.dtos.ProductDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
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
public class PayController extends HttpServlet {

    private final String PAYMENT = "payment.jsp";
    private final String ERROR = "pass.jsp";
    Logger loger = Logger.getLogger(PayController.class);

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
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            request.setAttribute("NAME_ANNOUCE", "");
            ProductDAO dao = new ProductDAO();
            List<ProductDTO> listCheck = new ArrayList<>();
            listCheck = dao.ListCheck();
            session.removeAttribute("ANNOUCE_ORDER");
            session.removeAttribute("ANNOUCE_FAILURES");
            session.removeAttribute("ANNOUCE_FAILURE");
            session.removeAttribute("ANNOUCE_ORDER");
            session.removeAttribute("ERROR_NAME");
            session.removeAttribute("ANNOUCE_EMPTY");

            if (session.getAttribute("LOGIN_NAME1") != null) {
                boolean check = false;
                CartDTO cart = (CartDTO) session.getAttribute("CART");
                for (ProductDTO x : cart.getCart().values()) {
                    for (ProductDTO x1 : listCheck) {
                        if (x.getProductID().equals(x1.getProductID())) {
                            if (x1.getQuanlity() == 0) {
                                session.setAttribute("ERROR_NAME", x.getProductName());
                                check = false;
                                break;
                            }
                            if (x.getQuanlity() <= x1.getQuanlity()) {
                                check = true;

                            }
                        }
                    }
                }
                if (check) {
                    OrderDAO daos = new OrderDAO();
                    OrderDetailDAO daoDO = new OrderDetailDAO();
                    String orderID = "";
                    String UserID = (String) (String) session.getAttribute("USERID");
                    int randomInt = new Random().nextInt(1000000000);
                    orderID = String.valueOf(randomInt);
                    String address = request.getParameter("txtAddress");
                    float price1 = Float.parseFloat(request.getParameter("total"));
                    float price2 = (float) ((double) Math.round(price1 * 100.0) / 100.0);
                    String total = String.valueOf(price2);
                    request.setAttribute("ADDRESS", address);
                    request.setAttribute("TOTAL", total);
                    OrderDTO order = new OrderDTO(orderID, total, UserID, address);
                    boolean checkCreate = daos.createOrderID(order);
                    request.setAttribute("ANNOUCE_ORDER", orderID);
                    if (checkCreate) {
                        for (ProductDTO x : cart.getCart().values()) {
                            for (ProductDTO x1 : listCheck) {
                                if (x.getProductID().equals(x1.getProductID())) {
                                    String OrderDetailID = "";
                                    int randomInt1 = new Random().nextInt(1000000000);
                                    OrderDetailID = String.valueOf(randomInt1);
                                    int quantity = x1.getQuanlity() - x.getQuanlity();
                                    dao.updateQuantity(quantity, x.getProductID());
                                    OrderDetailDTO od = new OrderDetailDTO(OrderDetailID, x.getProductID(), x.getQuanlity(), x.getPrice(), orderID);
                                    boolean checkCreateOD = daoDO.createOrderDetail(od);
                                    if (checkCreateOD) {
                                        request.setAttribute("ANNOUCE_ORDER", "COMPLETE");
                                    } else {
                                        request.setAttribute("ANNOUCE_FAILURES", "FAIL");
                                    }
                                }
                            }
                        }
                        cart.getCart().clear();
                        url = PAYMENT;
                    }
                } else if (!check) {
                    session.setAttribute("ANNOUCE_EMPTY", "FAIL");
                    url = ERROR;
                }
            }

        } catch (ClassNotFoundException | NumberFormatException | SQLException | NamingException e) {
            loger.error("Error at PayController: " + e.toString());
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
