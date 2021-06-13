/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Game;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOGame {

    DBConnection dbConn;
    Connection conn;
    String sql;

    public DAOGame(DBConnection dbconn) {
        this.dbConn = dbconn;
        conn = dbconn.getConnection();
    }

    public void insertGame(Game game) {
        sql = "Insert into Game(Title,coId,description,version,releaseDate,price,state) values (?,?,?,?,?,?,?)";
        PreparedStatement ps;
        
        try {
            ps = conn.prepareStatement(sql);

            ps.setString(1, game.getTitle());
            ps.setInt(2, game.getCoId());
            ps.setString(3, game.getDescription());
            ps.setString(4, game.getVersion());
            ps.setDate(5, game.getDate());
            
            ps.setDouble(6, game.getPrice());
            ps.setString(7, game.getState());

            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int updateInfoProduct(Game game) {
        int n = 0;
        String sql = "update Game set title=?, coId=?, description=?, version=?, releaseDate=?, price=?, state=?, status=? where gId=?";
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, game.getTitle());
            ps.setInt(2, game.getCoId());
            ps.setString(3, game.getDescription());
            ps.setString(4, game.getVersion());
            ps.setDate(5, game.getDate());
            ps.setDouble(6, game.getPrice());
            ps.setString(7, game.getState());
            ps.setBoolean(8, game.isStatus());
            ps.setInt(9, game.getGId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int changeStatus(int id, int status) {
        int n = 0;
        String sql = "update Game set status = " + (status == 1 ? 0 : 1) + " where gId = '" + id + "'";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int removeGame(int id) {
        int n = 0;
        String sql = "Select * from Game as a join Order_Detail as b on a.gId = b.gId where a.gId = '" + id + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                changeStatus(rs.getInt("gId"), 1);
            } else {
                String sqlDelete = "delete from Game where gId = '" + id + "'";
                Statement state = conn.createStatement();
                n = state.executeUpdate(sqlDelete);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public boolean checkDupGameTitle(String gameTitle) {
        String sql = "SELECT * FROM Game WHERE title = '" + gameTitle + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Game> getGameByCompanyId(int coId) {
        ArrayList<Game> list = new ArrayList<>();
        String sql = "SELECT * FROM Game WHERE coId = " + coId;
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Game pro = new Game();
                pro.setGId(rs.getInt("gId"));
                pro.setTitle(rs.getString("title"));
                pro.setCoId(rs.getInt("coId"));
                pro.setDescription(rs.getString("description"));
                pro.setVersion(rs.getString("version"));
                pro.setDate(rs.getDate("releaseDate"));
                pro.setPrice(rs.getDouble("price"));
                pro.setState(rs.getString("state"));
                pro.setStatus(rs.getBoolean("status"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Game> getGameByName(String Title) {
        ArrayList<Game> list = new ArrayList<>();
        String sql = "SELECT * FROM Game WHERE Title like '%" + Title + "%'";
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Game pro = new Game();
                pro.setGId(rs.getInt("gId"));
                pro.setTitle(rs.getString("title"));
                pro.setCoId(rs.getInt("coId"));
                pro.setDescription(rs.getString("description"));
                pro.setVersion(rs.getString("version"));
                pro.setDate(rs.getDate("releaseDate"));
                pro.setPrice(rs.getDouble("price"));
                pro.setState(rs.getString("state"));
                pro.setStatus(rs.getBoolean("status"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Game> getGameById(int gId) {
        ArrayList<Game> list = new ArrayList<>();
        String sql = "SELECT * FROM Game WHERE gId =" + gId;
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Game pro = new Game();
                pro.setGId(rs.getInt("gId"));
                pro.setTitle(rs.getString("title"));
                pro.setCoId(rs.getInt("coId"));
                pro.setDescription(rs.getString("description"));
                pro.setVersion(rs.getString("version"));
                pro.setDate(rs.getDate("releaseDate"));
                pro.setPrice(rs.getDouble("price"));
                pro.setState(rs.getString("state"));
                pro.setStatus(rs.getBoolean("status"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Game> getAllGame() {
        ArrayList<Game> list = new ArrayList<>();
        String sql = "SELECT * FROM Game ";
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Game pro = new Game();
                pro.setGId(rs.getInt("gId"));
                pro.setTitle(rs.getString("title"));
                pro.setCoId(rs.getInt("coId"));
                pro.setDescription(rs.getString("description"));
                pro.setVersion(rs.getString("version"));
                pro.setDate(rs.getDate("releaseDate"));
                pro.setPrice(rs.getDouble("price"));
                pro.setState(rs.getString("state"));
                pro.setStatus(rs.getBoolean("status"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Game> getGameByCategoryId(int caId) {
        ArrayList<Game> list = new ArrayList<>();
        String sql = "SELECT * FROM Game as a join Game_Category as b on a.gId = b.gId WHERE b.caId =" + caId;
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Game pro = new Game();
                pro.setGId(rs.getInt("gId"));
                pro.setTitle(rs.getString("title"));
                pro.setCoId(rs.getInt("coId"));
                pro.setDescription(rs.getString("description"));
                pro.setVersion(rs.getString("version"));
                pro.setDate(rs.getDate("releaseDate"));
                pro.setPrice(rs.getDouble("price"));
                pro.setState(rs.getString("state"));
                pro.setStatus(rs.getBoolean("status"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
