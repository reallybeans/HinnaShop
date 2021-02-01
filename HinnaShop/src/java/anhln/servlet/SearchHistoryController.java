/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhln.servlet;

import anhln.daos.OrderDAO;
import anhln.dtos.OrderDTO;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
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
public class SearchHistoryController extends HttpServlet {

    private static final String SUCCESS = "paging";
    Logger loger = Logger.getLogger(HistoryController.class);

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
            throws ServletException, IOException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        String url = SUCCESS;
        try {
            HttpSession session = request.getSession();
            session.removeAttribute("LIST_HIS");
            session.removeAttribute("LIST_HISDETAIL");
            session.removeAttribute("LIST_HISSEARCH");

            String userID = (String) session.getAttribute("USERID");
            String txtSearch = request.getParameter("txtSearchbyHis").trim();
            String txtDate = request.getParameter("txtDatebyHis"); 
            OrderDAO dao = new OrderDAO();

            List<OrderDTO> listOrder = new ArrayList<>();
            listOrder = dao.listSearch(txtSearch, txtDate, userID);
            if (listOrder == null) {
                request.setAttribute("ANNOUCE_HISEMPTYS", "ERROR");
            }

            session.setAttribute("LIST_HISSEARCH", listOrder);
            url = SUCCESS;
            
        } catch (ClassNotFoundException | SQLException e) {
            loger.error("Error at HistoryController: " + e.toString());
        }   finally {
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
        try {
            processRequest(request, response);
        } catch (NamingException ex) {
            java.util.logging.Logger.getLogger(SearchHistoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (NamingException ex) {
            java.util.logging.Logger.getLogger(SearchHistoryController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
