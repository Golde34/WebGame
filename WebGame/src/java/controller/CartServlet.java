/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Cart;
import entity.Item;
import entity.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAOProduct;
import model.DBConnection;

/**
 *
 * @author Admin
 */
public class CartServlet extends HttpServlet {

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
        DBConnection db = new DBConnection();
        DAOProduct daoP = new DAOProduct(db); 
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            
            String command = request.getParameter("command");
            
            Cart cart = (Cart) session.getAttribute("cart");
            
            switch(command) {
                case "plus":
                    String pId = request.getParameter("pid");
                    Product product = daoP.getProductByProductId(pId);
                    int amount = Integer.parseInt(request.getParameter("amount"));
                    if (cart.getCartList().containsKey(pId)) {
                        cart.plusToCart(pId, new Item(product, cart.getCartList().get(pId).getAmount()), amount);
                    } else {
                        cart.plusToCart(pId, new Item(product, amount), 0);
                    }
                    session.setAttribute("cart", cart);
                    response.sendRedirect("ProductControllerMap");
                    break;

                case "remove":
                    String sid1 = request.getParameter("pid");
                    cart.removeToCart(sid1);
                    if (cart.getCartList().isEmpty()) {
                        session.setAttribute("cart", null);
                    } else {
                        session.setAttribute("cart", cart);
                    }
                    response.sendRedirect("/PhoneWeb/JSP/cartList.jsp");
                    break;
                case "removeAll":
                    cart.removeAll();
                    session.setAttribute("cart", null);
                    response.sendRedirect("/PhoneWeb/JSP/cartList.jsp");
                    break;
                case "updateAmount":
                    for (Map.Entry<String, Item> list : cart.getCartList().entrySet()) {
                        String s = "pid"+list.getValue().getPro().getProId();
                        String q = "quantity"+list.getValue().getPro().getProId();
                        String id = request.getParameter(s);
                        int quantity = Integer.parseInt(request.getParameter(q));
                        cart.updateAmount(id, quantity);
                    }
                    session.setAttribute("cart", cart);
                    response.sendRedirect("/PhoneWeb/JSP/cartList.jsp");
                    break;
            }
                    
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
