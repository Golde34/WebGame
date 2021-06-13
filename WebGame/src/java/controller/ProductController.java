/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Product;
import entity.Supplier;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOProduct;
import model.DAOSupplier;
import model.DBConnection;

/**
 *
 * @author Admin
 */
public class ProductController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    DBConnection dbCon = new DBConnection();
    DAOProduct daoP = new DAOProduct(dbCon);
    DAOSupplier daoS = new DAOSupplier(dbCon);
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("service");
            if (service == null) {
                service = "HomePage";
            }
            //index.jsp
            if (service.equalsIgnoreCase("HomePage")) {
                ArrayList<Supplier> listSupplier = daoS.getAllSupplier();
                request.setAttribute("listSupplier", listSupplier);
                ArrayList<Product> listProduct = daoP.getAllProduct();
                request.setAttribute("listProduct", listProduct);
                sendDispatcher(request, response, "/index.jsp");
            }
            
            if (service.equalsIgnoreCase("search")){
                ArrayList<Supplier> listSupplier = daoS.getAllSupplier();
                request.setAttribute("listSupplier", listSupplier);
                String pname = request.getParameter("pname");
                ArrayList<Product> listProduct = daoP.getProductByName(pname);
                request.setAttribute("listProduct", listProduct);
                sendDispatcher(request, response, "/index.jsp");
            }
            //menu.jsp
            if (service.equalsIgnoreCase("filter")) {
                int hid = Integer.parseInt(request.getParameter("supId"));
                ArrayList<Supplier> listHangSanXuat = daoS.getAllSupplier();
                request.setAttribute("listSupplier", listHangSanXuat);
                ArrayList<Product> listSanPham = daoP.getProductBySupId(hid);
                request.setAttribute("listProduct", listSanPham);
                sendDispatcher(request, response, "/index.jsp");
            }

            if (service.equalsIgnoreCase("addToCart")) {
                String pid = request.getParameter("pid");
                Product sp = daoP.getProductByProductId(pid);
                int maxQuantity = daoP.getMaxQuantity(pid);
                ArrayList<Supplier> listSupplier = daoS.getAllSupplier();
                request.setAttribute("product", sp);
                request.setAttribute("maxQuantity", maxQuantity);
                request.setAttribute("listSupplier", listSupplier);
                sendDispatcher(request, response, "/JSP/cart.jsp");
                //response.sendRedirect("JSP/cart.jsp");
            }
//
//            if (service.equalsIgnoreCase("changeStatus")) {
//                String sid = request.getParameter("id");
//                int status = Integer.parseInt(request.getParameter("status"));
//                daoP.changeStatus(sid, status);
//                response.sendRedirect("AdminControllerMap?tab=product");
//            }
//
//            if (service.equalsIgnoreCase("delete")) {
//                String sid = request.getParameter("id");
//                daoP.removeProduct(sid);
//                response.sendRedirect("AdminControllerMap?tab=product");
//            }
//
//            if (service.equalsIgnoreCase("preUpdate")) {
//                String sid = request.getParameter("id");
//                Product sp = daoP.getProductByProductId(sid);
//                ArrayList<Supplier> listHangSanXuat = daoS.getAllSupplier();
//                request.setAttribute("product", sp);
//                request.setAttribute("listHangSanXuat", listHangSanXuat);
//                sendDispatcher(request, response, "/admin/updateProduct.jsp");
//            }
//
//            if (service.equalsIgnoreCase("updateProduct")) {
//                String sid = request.getParameter("sid");
//                String sname = request.getParameter("sname");
//                int quantity = Integer.parseInt(request.getParameter("quantity"));
//                double price = Double.parseDouble(request.getParameter("price"));
//                String picture = getPictureName(request.getParameter("picture"));
//                String description = request.getParameter("description");
//                int hid = Integer.parseInt(request.getParameter("hname"));
//                int status = Integer.parseInt(request.getParameter("status"));
//                Product sp = new Product(sid, sname, quantity, price, picture, description, status, hid);
//                daoP.updateInfoProduct(sp);
//                response.sendRedirect("AdminControllerMap?tab=product");
//            }
//
//            if (service.equalsIgnoreCase("add")) {
//                ArrayList<Supplier> listHangSanXuat = daoS.getAllSupplier();
//                request.setAttribute("listHangSanXuat", listHangSanXuat);
//                sendDispatcher(request, response, "/admin/addProduct.jsp");
//            }
//
//            if (service.equalsIgnoreCase("addProduct")) {
//                String sid = request.getParameter("sid");
//                String sname = request.getParameter("sname");
//                int quantity = Integer.parseInt(request.getParameter("quantity"));
//                double price = Double.parseDouble(request.getParameter("price"));
//                String picture = getPictureName(request.getParameter("picture"));
//                String description = request.getParameter("description");
//                int hid = Integer.parseInt(request.getParameter("hname"));
//                Product sp = new Product(sid, sname, quantity, price, picture, description, hid);
//                String mess = "";
//                //check duplicate product id
//                boolean checkSid = true;
//                if (daoP.checkDupProId(sid)) {
//                    mess = "Product ID has been existed !!";
//                    checkSid = false;
//                }
//                //check duplicate product name
//                boolean checkSname = true;
//                if (daoP.checkDupProName(sname)) {
//                    mess = "Product name has been existed !!";
//                    checkSname = false;
//                }
//                request.setAttribute("mess", mess);
//                request.setAttribute("product", sp);
//                ArrayList<Supplier> listHangSanXuat = daoS.getAllSupplier();
//                request.setAttribute("listHangSanXuat", listHangSanXuat);
//                //database
//                if (checkSid && checkSname) {
//                    daoP.addProduct(sp);
//                    response.sendRedirect("/WebExample/AdminControllerMap?tab=product");
//                    //out.print("success!!");
//                } else {
//                    sendDispatcher(request, response, "/admin/addProduct.jsp");
//                    //out.print("not success!!");
//                }
//            }
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
    
    public String getPictureName(String path) {
        for (int i = path.length() - 1; i > 0; i--) {
            if (path.charAt(i) == '\\') {
                return path.substring(i + 1);
            }
        }
        return path;
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
