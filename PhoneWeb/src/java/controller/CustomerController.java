/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Cart;
import entity.Customer;
import entity.Item;
import entity.Order;
import entity.OrderDetail;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAOCustomer;
import model.DAOOrder;
import model.DAOOrderDetail;
import model.DBConnection;

/**
 *
 * @author Admin
 */
public class CustomerController extends HttpServlet {

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
        DAOCustomer dao = new DAOCustomer(dbCon);
        DAOOrder daoHoaDon = new DAOOrder(dbCon);
        DAOOrderDetail daoHoaDonChiTiet = new DAOOrderDetail(dbCon);

        try (PrintWriter out = response.getWriter()) {
            String service = request.getParameter("service");
            if (service == null) {
                service = "";
            }
            //Lam them hai button register hoac quen pass word
            if (service.equalsIgnoreCase("login")) {
                HttpSession session = request.getSession();
                String username = request.getParameter("user");
                String mess = "";
                String password = request.getParameter("password");
                Customer user = dao.getUserLogin(username, password);
                if (user != null) {
                    session.setAttribute("user", user);
                    sendDispatcher(request, response, "/index.jsp");
//                    response.sendRedirect("/index.jsp");
                } else {
                    mess = "Login failed";
                    request.setAttribute("mess", mess);
                    sendDispatcher(request, response, "/JSP/login.jsp");
                }
            }
            
            //lam them mot thong bao doi pass thanh cong, lam mot button tro ve trang chu00``
            if (service.equalsIgnoreCase("changePassword")) {
                String mess;
                
                String oldPassword = request.getParameter("oldPassword");
                String newPassword = request.getParameter("newPassword");
                
                HttpSession session = request.getSession();
                Customer user = (Customer)session.getAttribute("user");
                String username = user.getUsername();
                String password = user.getPassword();
                
                if (!password.equals(oldPassword)){
                    mess = "Old Password is not correct";
                } else if (newPassword.length()<6){
                    mess = "New Password is too week";
                } else {
                    dao.changePassword(username, newPassword);
                    mess = "Change password successfully !!";
                    user = dao.getCustomerByUsername(username);
                    session.setAttribute("user", user);
                }
                
                request.setAttribute("mess", mess);
                
                sendDispatcher(request, response, "/index.jsp");
                
            }
            
            if (service.equalsIgnoreCase("register")){
                String name = request.getParameter("name");
                String address = request.getParameter("address");
                String phone = request.getParameter("phone");
                String user = request.getParameter("user");
                String password = request.getParameter("password");
                Customer kh = new Customer(name, address, phone, user, password);
                String mess = "";
                //check username's length
                boolean checkUser = true;
                if (user.length() < 6) {
                    mess = "Username must be more than 5 characters !!";
                    checkUser = false;
                }
                //check duplicate username
                if (dao.checkDupUserName(user)) {
                    mess = "Username has been used !!";
                    checkUser = false;
                }
                request.setAttribute("mess", mess);
                request.setAttribute("customer", kh);
                //database
                if (checkUser) {
                    dao.addCustomer(kh);
                    response.sendRedirect("JSP/login.jsp");
                } else {
                    sendDispatcher(request, response, "/register.jsp");
                }
            }

            if (service.equalsIgnoreCase("checkout")) {
                HttpSession session = request.getSession();
                Cart cart = (Cart) session.getAttribute("cart");
                Customer user = (Customer) session.getAttribute("user");
                if (cart != null && !cart.getCartList().isEmpty()) {
                    int maxHid = daoHoaDon.getMaxOrderId();
                    int hid = maxHid + 1;
                    Timestamp date = new Timestamp(Calendar.getInstance().getTimeInMillis());
                    int cid = user.getcId();
                    String Rcname = user.getcName();
                    String Raddress = user.getAddress();
                    String Rphone = user.getPhone();
                    double total = cart.totalMoney();
                    String SOid = String.valueOf(hid);
                    Order hd = new Order(SOid, date, cid, Rcname, Raddress, Rphone, total, 0);
                    //out.print(hd);
                    int n = daoHoaDon.insertOrder(hd);
                    //out.print(n);
                    for (Map.Entry<String, Item> list : cart.getCartList().entrySet()) {
                        String sid = list.getValue().getPro().getProId();
                        int quantity = list.getValue().getAmount();
                        double price = list.getValue().getPro().getPrice();
                        OrderDetail hdct = new OrderDetail(SOid, sid, quantity, price);
                        daoHoaDonChiTiet.insertOrderDetail(hdct);
                    }
                }
                session.invalidate();
                response.sendRedirect("ProductControllerMap");
            }
//
//            if (service.equalsIgnoreCase("changeStatus")) {
//                String username = request.getParameter("username");
//                int status = Integer.parseInt(request.getParameter("status"));
//                dao.changeStatus(username, status);
//                response.sendRedirect("AdminControllerMap?tab=customer");
//            }
//
//            if (service.equalsIgnoreCase("preUpdate")) {
//                int id = Integer.parseInt(request.getParameter("id"));
//                Customer kh = dao.getCustomerById(id);
//                request.setAttribute("customer", kh);
//                sendDispatcher(request, response, "/admin/updateCustomer.jsp");
//            }
//
//            if (service.equalsIgnoreCase("updateCustomer")) {
//                int id = Integer.parseInt(request.getParameter("id"));
//                String name = request.getParameter("name");
//                String address = request.getParameter("address");
//                String phone = request.getParameter("phone");
//                String user = request.getParameter("user");
//                String password = request.getParameter("password");
//                int status = Integer.parseInt(request.getParameter("status"));
//                Customer kh = new Customer(id, name, address, phone, user, password, status);
//                dao.updateInfoCustomer(kh);
//                response.sendRedirect("AdminControllerMap?tab=customer");
//            }
//
//            if (service.equalsIgnoreCase("delete")) {
//                int id = Integer.parseInt(request.getParameter("id"));
//                dao.removeCustomer(id);
//                response.sendRedirect("AdminControllerMap?tab=customer");
//            }
        }
    }

    public void sendDispatcher(HttpServletRequest request, HttpServletResponse response, String path) {
        try {
            RequestDispatcher rd = request.getRequestDispatcher(path);
            rd.forward(request, response);
        } catch (ServletException | IOException ex) {
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
