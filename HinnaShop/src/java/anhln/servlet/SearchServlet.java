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
public class SearchServlet extends HttpServlet {

    Logger loger = Logger.getLogger(SearchServlet.class);
    private final String SUCCESSAD = "managerPage.jsp";
    private final String SUCCESSUS = "mainPage.jsp";
    private final String AD = "";
    private final String US = "true";

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
        String url = SUCCESSUS;
        try {
            HttpSession session = request.getSession();
            request.setAttribute("ANNOUCE_SEARCHPRICE", null);
            session.removeAttribute("LIST_PAGE");
            session.removeAttribute("LIST_SEARCH");
            session.removeAttribute("LIST_HIS");
            session.removeAttribute("LIST_DETAIL"); 
            String action = request.getParameter("btnAction");
            ProductDAO dao = new ProductDAO();
            List<CategoryDTO> listCate = new ArrayList<>();
            listCate = dao.listCate();
            session.setAttribute("LISTCATE", listCate);
            int pageNumber = dao.getNumberPage();
            String index = request.getParameter("index");
            int indexPage = 0;
            if (index == null) {
                index = "1";
            }
            if (action.equals("SearchAD")) {
                indexPage = Integer.parseInt(index);
                List<ProductDTO> listSearch = new ArrayList<>();
                String search = request.getParameter("txtSearchAD");
                String searchPrice = request.getParameter("txtPriceSAD");
                if ("".equals(searchPrice)) {
                    searchPrice = "999999999";
                    request.setAttribute("ANNOUCE_SEARCHPRICE", "SUCCESS");
                }
                float price = Float.parseFloat(searchPrice);
                String searchCate = request.getParameter("txtCateAD");
                String sCate = "";
                if ("Select Category!".equals(searchCate)) {
                    sCate = "";
                } else {
                    sCate = searchCate;
                }
                request.setAttribute("txtSearchAD", search);
                request.setAttribute("txtPriceSAD", searchPrice);
                request.setAttribute("txtCateAD", searchCate);

                listSearch = dao.getSearchPaging(indexPage, search, price, sCate, AD);
                pageNumber = dao.getNumberPagePaging(search, price, sCate, AD);

                
                session.setAttribute("LIST_SEARCH", listSearch);
                request.setAttribute("PAGE_NUMBER", pageNumber);
                if (session.getAttribute("LIST_SEARCH") == null) {
                    request.setAttribute("NOSEARCH", "FALSE");
                }
                url = SUCCESSAD;
            }
            if (action.equals("Search") || action.equals("AddCartbySearch") || action.equals("UpdateCartbySearch") || action.equals("DeleteCartbySearch")) {
                if ("".equals(index)) {
                    index = "1";
                }
                indexPage = Integer.parseInt(index);
                List<ProductDTO> listSearch = new ArrayList<>();
                String search = request.getParameter("txtSearch");
                String searchPrice = request.getParameter("txtPriceS");
                if ("".equals(searchPrice)) {
                    searchPrice = "999999999999";
                    request.setAttribute("ANNOUCE_SEARCHPRICE", "SUCCESS");
                }
                float price = Float.parseFloat(searchPrice);
                String searchCate = request.getParameter("txtCate");
                String sCate = "";
                if ("Select Category!".equals(searchCate)) {
                    sCate = "";
                } else {
                    sCate = searchCate;
                }

                listSearch = dao.getSearchPaging(indexPage, search, price, sCate, US);
                pageNumber = dao.getNumberPagePaging(search, price, sCate, US);

                request.setAttribute("txtSearch", search);
                request.setAttribute("txtPriceS", price);
                request.setAttribute("txtCate", searchCate);

                
                session.setAttribute("LIST_SEARCH", listSearch);
                request.setAttribute("PAGE_NUMBER", pageNumber);
                if (session.getAttribute("LIST_SEARCH") == null) {
                    request.setAttribute("NOSEARCH", "FALSE");
                }

                url = SUCCESSUS;
            }

        } catch (ClassNotFoundException | NumberFormatException | SQLException e) {
            loger.error("Error at SearchServlet: " + e.toString());
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
