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
public class PaggingServlet extends HttpServlet {

    Logger loger = Logger.getLogger(PaggingServlet.class);
    private static final String PAGGINGAD = "managerPage.jsp";
    private static final String PAGGING = "mainPage.jsp";

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
        String url = PAGGINGAD;
        try {
            HttpSession session = request.getSession();
             session.removeAttribute("LIST_PAGE");
            session.removeAttribute("LIST_SEARCH"); 
            ProductDAO dao = new ProductDAO();
            int pageNumber = dao.getNumberPage();
            List<CategoryDTO> listCate = new ArrayList<>();
            List<ProductDTO> lists = new ArrayList<>();
            String index = request.getParameter("index");
            int indexPage;
            if (index == null) {
                index = "1";
            }
            indexPage = Integer.parseInt(index);
            if (session.getAttribute("LOGIN_NAME") == null && session.getAttribute("LOGIN_NAME1") == null) {
                listCate = dao.listCate();
                lists = dao.getPaging(indexPage);
                session.setAttribute("LIST_PAGE", lists);
                request.setAttribute("PAGE_NUMBER", pageNumber);
                session.setAttribute("LISTCATE", listCate);
                url = PAGGING;
            }
            if (session.getAttribute("LOGIN_NAME") != null) {
                listCate = dao.listCate();
                lists = dao.getPaging(indexPage);
                session.setAttribute("LIST_PAGE", lists);
                request.setAttribute("PAGE_NUMBER", pageNumber);
                session.setAttribute("LISTCATE", listCate);
                url = PAGGINGAD;
            }
            if (session.getAttribute("LOGIN_NAME1") != null) {
                listCate = dao.listCate();
                lists = dao.getPaging(indexPage);
                session.setAttribute("LIST_PAGE", lists);
                request.setAttribute("PAGE_NUMBER", pageNumber);
                session.setAttribute("LISTCATE", listCate);
                url = PAGGING;
            }

        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            loger.error("Error at PaggingServlet: " + e.toString());
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
        try {
            processRequest(request, response);
        } catch (NamingException ex) {
            java.util.logging.Logger.getLogger(PaggingServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            java.util.logging.Logger.getLogger(PaggingServlet.class.getName()).log(Level.SEVERE, null, ex);
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
