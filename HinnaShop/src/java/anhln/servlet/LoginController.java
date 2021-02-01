/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package anhln.servlet;

import anhln.daos.UserDAO;
import anhln.dtos.UserDTO;
import java.io.IOException;
import java.sql.SQLException;
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
public class LoginController extends HttpServlet {

    Logger loger = Logger.getLogger(LoginController.class);

    private static final String ERROR = "mainPage.jsp";
    private static final String MANA_PAGE = "paging?index=1";
    private final String AD = "AD";
    private final String US = "US";

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
            String userID = request.getParameter("txtUserID");
            String password = request.getParameter("txtPws");
            UserDAO dao = new UserDAO();
            UserDTO user = dao.checkLogin(userID, password);
            if (user == null && !"".equals(userID)) {
                request.setAttribute("FAILED", "Invalid Login!");
                url = ERROR; 
            }
            if (user == null) {
                String txtEmail = request.getParameter("txtEmail");
                if (txtEmail.equals("")) {
                    request.setAttribute("FAILED", "Invalid Login!");
                    url = ERROR;
                }
                if (!"".equals(txtEmail)) {
                    String emailName = txtEmail.substring(0, txtEmail.indexOf("@"));
                    UserDTO email = dao.checkLogin(txtEmail, "");
                    if (email == null) {
                        boolean checkEmail = dao.CreateEmail(txtEmail, emailName);
                        if (checkEmail) {
                            session.setAttribute("LOGIN_NAME1", email.getFullName());
                            session.setAttribute("USERID", email.getUserID());
                            request.setAttribute("FAILED", null);
                            url = MANA_PAGE;
                            return;
                        }
                    } else {
                        if (email.getRoleID().equals(US)) {
                            session.setAttribute("LOGIN_NAME1", email.getFullName());
                            session.setAttribute("USERID", email.getUserID());
                            request.setAttribute("FAILED", null);
                            url = MANA_PAGE;
                            return;
                        }
                    }
                }
            } else {

                if (user.getRoleID().equals(US)) {
                    session.setAttribute("LOGIN_NAME1", user.getFullName());
                    session.setAttribute("USERID", user.getUserID());
                    url = MANA_PAGE;
                } else if (user.getRoleID().equals(AD)) {
                    session.setAttribute("LOGIN_NAME", user.getFullName());
                    session.setAttribute("USERID", user.getUserID());
                    url = MANA_PAGE;
                }
            }
        } catch (ClassNotFoundException | SQLException | NamingException e) {
            loger.error("Error at LoginController: " + e.toString());
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
