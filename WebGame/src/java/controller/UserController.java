/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOUser;
import model.DBConnection;

/**
 *
 * @author Admin
 */
public class UserController extends HttpServlet {

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
        DBConnection dbCon = new DBConnection();
        DAOUser daoUser = new DAOUser(dbCon);
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("service");
//            out.println(service);
            if (service == null) {
                service = "";
            }

//            if(service.equalsIgnoreCase("HomePage")){
//                sendDispatcher(request, response, "index.html");
//            }
            if (service.equalsIgnoreCase("login")) {
                String userName = request.getParameter("username");
                String mess = "";
                String userPass = request.getParameter("userpassword");
                User log = daoUser.getUserLogin(userName, userPass);
                if (log != null) {
                    request.getSession().setAttribute("currUser", log);
                    request.getSession().setAttribute("role", log.getSystem_role());
                    sendDispatcher(request, response, "index.jsp");
                } else {
                    mess = "Login failed, check your username or your password.";
                    request.setAttribute("mess", mess);
                    sendDispatcher(request, response, "jsp/login.jsp");
                }
            }

            //dang ky
            if (service.equalsIgnoreCase("register")) {
                String displayName = request.getParameter("displayName");
                String username = request.getParameter("username");
                String regMail = request.getParameter("regMail");
                String regPhone = request.getParameter("regPhone");
                String address = request.getParameter("address");
                String regPass = request.getParameter("confirm-password");

                User user = new User(displayName, regMail, regPhone, address, "User", username, regPass);
                String mess = "";
                boolean checkUser = true;
                if (username.length() < 6) {
                    mess = "Username must be more than 5 characters !!";
                    checkUser = false;
                }
                if (daoUser.checkDupUserName(username)) {
                    mess = "Username has been used !!";
                    checkUser = false;
                }
                request.setAttribute("mess", mess);
                request.setAttribute("user", user);
                if (checkUser) {
                    daoUser.addUser(user);
                    response.sendRedirect("index.jsp");
                } else {
                    sendDispatcher(request, response, "jsp/register.jsp");
                }
            }

            if (service.equalsIgnoreCase("logout")) {
                request.getSession().invalidate();
                sendDispatcher(request, response, "index.jsp");
            }

            if (service.equalsIgnoreCase("changepass")) {
                String userName = request.getParameter("username");
                User log = daoUser.getUserByUsername(userName);
                if (log == null) {
                    out.println("Wrong user name or password!");
                    return;
                }
                String newPass = request.getParameter("newuserpassword");
                String renewPass = request.getParameter("renewuserpassword");
                if (newPass.trim().length() == 0) {
                    out.println("New password can't be emty!");
                    sendDispatcher(request, response, "jsp/changepass.jsp");
                    return;
                } else if (renewPass.trim().length() == 0) {
                    out.println("Please re-enter your new password");
                    sendDispatcher(request, response, "jsp/changepass.jsp");
                    return;
                } else if (!newPass.equals(renewPass)) {
                    out.println("New password don't match the re-enterd new password!");
                    sendDispatcher(request, response, "jsp/changepass.jsp");
                    return;
                }
                daoUser.changePassword(log.getUsername(), newPass);
                out.println("Change password sucessfull!");
                sendDispatcher(request, response, "jsp/login.jsp");
            }
        }
    }

    public void sendDispatcher(HttpServletRequest request, HttpServletResponse response, String path) {
        try {
            RequestDispatcher rd = request.getRequestDispatcher(path);
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void sendDispatcher1(HttpServletRequest request, HttpServletResponse response, String path) {
        try {
            RequestDispatcher rd = request.getRequestDispatcher(path);
            rd.include(request, response);
        } catch (ServletException | IOException ex) {
            Logger.getLogger(ProductController.class.getName()).log(Level.SEVERE, null, ex);
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
