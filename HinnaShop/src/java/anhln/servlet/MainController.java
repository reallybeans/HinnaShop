/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhln.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author leean
 */
public class MainController extends HttpServlet {

    final static String ERROR = "invalid.html";
    final static String LOGIN = "LoginController";
    final static String SIGNOUT = "LogoutController"; 
    final static String CREATE_PRO = "CreateProductController";
    final static String UPDATE_PRO = "UpdateProductController";
    final static String DELETE_PRO = "DeleteProductController";
    final static String UPDATEBYS_PRO = "UpdateProductBySearchController";
    final static String DELETEBYS_PRO = "DeleteProductBySearchController";
    final static String PAGING = "paging";
    final static String PAGINGSEARCH = "SearchServlet";
    final static String PAGINGSEARCHAD = "SearchServlet";
    final static String SEARCHHIS = "SearchHistoryController";
    final static String ADDTOCART = "AddToCartController";
    final static String UPDATECART = "UpdateCartController";
    final static String DELETECART = "DeleteCartController"; 
    final static String ADDTOCARTBYSEARCH = "AddtoCartBySearchController";
    final static String UPDATECARTBYSEARCH = "UpdateCartBySearchController";
    final static String DELETECARTBYSEARCH = "DeleteCartBySearchController";
    final static String VIEWPAY = "ViewPayController";
    final static String PAY = "PayController";
    final static String BACK = "BackToMainPageController";
    final static String VIEWHIS = "HistoryController";
    final static String DETAIL_PRO = "ShowDetailProduct";

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
            String action = request.getParameter("btnAction");
            if (action.equals("Login")) {
                url = LOGIN;
            }
            if (action.equals(("Sign Out"))) {
                url = SIGNOUT;
            } 
            if (action.equals(("DeleteProS"))) {
                url = DELETEBYS_PRO;
            }
            if (action.equals(("UpdateProS"))) {
                url = UPDATE_PRO;
            }
            if (action.equals(("CreatePro"))) {
                url = CREATE_PRO;
            }
            if (action.equals(("UpdatePro"))) {
                url = UPDATE_PRO;
            }
            if (action.equals(("DeletePro"))) {
                url = DELETE_PRO;
            }
            if (action.equals(("Paging"))) {
                url = PAGING;
            }
            if (action.equals(("SearchAD"))) {
                url = PAGINGSEARCHAD;
            } 
            if (action.equals(("Search"))) {
                url = PAGINGSEARCH;
            } 
            if (action.equals(("SearchHis"))) {
                url = SEARCHHIS;
            } 
            if (action.equals(("AddCart"))) {
                url = ADDTOCART;
            } 
            if (action.equals(("UpdateCart"))) {
                url = UPDATECART;
            }
            if (action.equals(("DeleteCart"))) {
                url = DELETECART;
            }
            if (action.equals(("AddCartbySearch"))) {
                url = ADDTOCARTBYSEARCH;
            }
            if (action.equals(("UpdateCartbySearch"))) {
                url = UPDATECARTBYSEARCH;
            }
            if (action.equals(("DeleteCartbySearch"))) {
                url = DELETECARTBYSEARCH;
            }
            if (action.equals(("ViewPay"))) {
                url = VIEWPAY;
            }
            if (action.equals(("Payment"))) {
                url = PAY;
            }
            if (action.equals(("Back"))) {
                url = BACK;
            }
            if (action.equals(("ViewHis"))) {
                url = VIEWHIS;
            }
            if (action.equals(("DetailPro"))) {
                url = DETAIL_PRO;
            }

        } catch (Exception e) {
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
