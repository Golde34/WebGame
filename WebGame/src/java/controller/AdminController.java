/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import entity.Category;
import entity.Company;
import entity.Galery;
import entity.Game;
import entity.Platform;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAOCategory;
import model.DAOCompany;
import model.DAOGalery;
import model.DAOGame;
import model.DAOGame_Category;
import model.DAOPlatform;
import model.DAOUser;
import model.DBConnection;

/**
 *
 * @author dumyd
 */
public class AdminController extends HttpServlet {

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
    DAOGame     daoGame = new DAOGame(dbCon);
    DAOCategory daoCate = new DAOCategory(dbCon);
    DAOPlatform daoPlat = new DAOPlatform(dbCon);
    DAOGame_Category daoGaCa = new DAOGame_Category(dbCon);
    DAOCompany daoCom = new DAOCompany(dbCon);
    DAOUser daoUser = new DAOUser(dbCon);
    DAOGalery daoGalery = new DAOGalery(dbCon);
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String service = request.getParameter("service");
            
            if (service == null) {
                service = "HomeAdmin";
            }
            //Home.jsp
            if (service.equalsIgnoreCase("HomeAdmin")) {
                // <editor-fold defaultstate="collapsed" desc="SetParams">
                ArrayList<Game> listGame = daoGame.getTrueGame();
                request.setAttribute("listGame", listGame);
                ArrayList<Category> listCategory = daoCate.getTrueCategories();
                request.setAttribute("listCategory", listCategory);
                ArrayList<Platform> listPlatform = daoPlat.getTruePlatforms();
                request.setAttribute("listPlatform", listPlatform);
                ArrayList<Company> listCompany = daoCom.getTrueCompany();
                request.setAttribute("listCompany", listCompany);
                ArrayList<User> listUser = daoUser.getTrueUser();
                request.setAttribute("listUser", listUser);
                HashMap<Game, ArrayList<Galery>> listGameGalery = new HashMap<Game,ArrayList<Galery>>();
                for (Game game : listGame) {
                    ArrayList<Galery> gameGalery = daoGalery.getFullGameGalery(game.getGid());
                    listGameGalery.put(game, gameGalery);                
                }
                request.setAttribute("listGameGalery", listGameGalery);
                // </editor-fold>
                sendDispatcher(request, response, "admin/adminIndex.jsp");
            }
            
            if (service.equalsIgnoreCase("logout")){
                request.getSession().invalidate();
                sendDispatcher(request, response, "/login.jsp");
            }
            
            if (service.equalsIgnoreCase("addGame")){
                String title = request.getParameter("title");
                int coId = Integer.parseInt(request.getParameter("coId"));
                String desc = request.getParameter("description");
                String version = request.getParameter("version");
                Date releaseDate = Date.valueOf(request.getParameter("releaseDate"));
                int rating = Integer.parseInt(request.getParameter("rating"));
                double price= Double.parseDouble(request.getParameter("price"));
                String state = request.getParameter("state");
                Game newGame = new Game(0, title, coId, desc, version, rating, releaseDate, price, state,0);
                int n = daoGame.insertGame(newGame);
                if (n!=0) request.setAttribute("message", "Insert Successfully");
                else request.setAttribute("message", "Insert Failed");
                request.setAttribute("tab", "gameAdd");
                // <editor-fold defaultstate="collapsed" desc="SetParams">
                ArrayList<Game> listGame = daoGame.getTrueGame();
                request.setAttribute("listGame", listGame);
                ArrayList<Category> listCategory = daoCate.getTrueCategories();
                request.setAttribute("listCategory", listCategory);
                ArrayList<Platform> listPlatform = daoPlat.getTruePlatforms();
                request.setAttribute("listPlatform", listPlatform);
                ArrayList<Company> listCompany = daoCom.getTrueCompany();
                request.setAttribute("listCompany", listCompany);
                ArrayList<User> listUser = daoUser.getTrueUser();
                request.setAttribute("listUser", listUser);
                HashMap<Game, ArrayList<Galery>> listGameGalery = new HashMap<Game,ArrayList<Galery>>();
                for (Game game : listGame) {
                    ArrayList<Galery> gameGalery = daoGalery.getFullGameGalery(game.getGid());
                    listGameGalery.put(game, gameGalery);                
                }
                request.setAttribute("listGameGalery", listGameGalery);
                // </editor-fold>
                sendDispatcher(request, response, "admin/adminIndex.jsp");
            }
            
            if (service.equalsIgnoreCase("updateGame")){
                int gId = Integer.parseInt(request.getParameter("gId"));
                Game updateGame = daoGame.getGameById(gId);
                String title = request.getParameter("title");
                if (title.trim().length()!=0) updateGame.setTitle(title);
                int coId = Integer.parseInt(request.getParameter("coId"));
                updateGame.setCoID(coId);
                String desc = request.getParameter("description");
                if (desc!=null && desc.trim().length()!=0) updateGame.setDescription(desc);
                String version = request.getParameter("version");
                if (version.trim().length()!=0) updateGame.setDescription(version);
                String releaseDate = request.getParameter("releaseDate");
                if (releaseDate.trim().length()!=0) updateGame.setReleaseDate(Date.valueOf(releaseDate));
                String rating = request.getParameter("rating");
                if (rating.trim().length()!=0) updateGame.setRating(Integer.parseInt(rating));
                String price = request.getParameter("price");
                if (price.trim().length()!=0) updateGame.setPrice(Double.parseDouble(price));
                String state = request.getParameter("state");
                updateGame.setState(state);
                int n = daoGame.updateInfoGame(updateGame);
                if (n!=0) request.setAttribute("message", "Update Successfully");
                else request.setAttribute("message", "Update Failed");
                request.setAttribute("tab", "gameUpdate");
                // <editor-fold defaultstate="collapsed" desc="SetParams">
                ArrayList<Game> listGame = daoGame.getTrueGame();
                request.setAttribute("listGame", listGame);
                ArrayList<Category> listCategory = daoCate.getTrueCategories();
                request.setAttribute("listCategory", listCategory);
                ArrayList<Platform> listPlatform = daoPlat.getTruePlatforms();
                request.setAttribute("listPlatform", listPlatform);
                ArrayList<Company> listCompany = daoCom.getTrueCompany();
                request.setAttribute("listCompany", listCompany);
                ArrayList<User> listUser = daoUser.getTrueUser();
                request.setAttribute("listUser", listUser);
                HashMap<Game, ArrayList<Galery>> listGameGalery = new HashMap<Game,ArrayList<Galery>>();
                for (Game game : listGame) {
                    ArrayList<Galery> gameGalery = daoGalery.getFullGameGalery(game.getGid());
                    listGameGalery.put(game, gameGalery);                
                }
                request.setAttribute("listGameGalery", listGameGalery);
    // </editor-fold>
                request.setAttribute("game", updateGame);
                sendDispatcher(request, response, "admin/adminIndex.jsp");
            }
            
            if (service.equalsIgnoreCase("delGame")) {
                int gId = Integer.parseInt(request.getParameter("gId"));
                int status = Integer.parseInt(request.getParameter("status"));
                
                int n = daoGame.changeStatus(gId, status);
                if (n!=0) request.setAttribute("message", "Update Successfully");
                else request.setAttribute("message", "Update Failed");
                request.setAttribute("tab", "gameDel");
                // <editor-fold defaultstate="collapsed" desc="SetParams">
                ArrayList<Game> listGame = daoGame.getTrueGame();
                request.setAttribute("listGame", listGame);
                ArrayList<Category> listCategory = daoCate.getTrueCategories();
                request.setAttribute("listCategory", listCategory);
                ArrayList<Platform> listPlatform = daoPlat.getTruePlatforms();
                request.setAttribute("listPlatform", listPlatform);
                ArrayList<Company> listCompany = daoCom.getTrueCompany();
                request.setAttribute("listCompany", listCompany);
                ArrayList<User> listUser = daoUser.getTrueUser();
                request.setAttribute("listUser", listUser);
                HashMap<Game, ArrayList<Galery>> listGameGalery = new HashMap<Game,ArrayList<Galery>>();
                for (Game game : listGame) {
                    ArrayList<Galery> gameGalery = daoGalery.getFullGameGalery(game.getGid());
                    listGameGalery.put(game, gameGalery);                
                }
                request.setAttribute("listGameGalery", listGameGalery);
    // </editor-fold>
                sendDispatcher(request, response, "admin/adminIndex.jsp");
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
