/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Game;
import entity.Platform;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
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
        sql = "Insert into Game(Title,coId,description,version,rating,releaseDate,price,state,status) values (?,?,?,?,?,?,?,?,?)";
        PreparedStatement ps;
        
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, game.getTitle());
            ps.setInt(2, game.getCoID());
            ps.setString(3, game.getDescription());
            ps.setString(4, game.getVersion());
            ps.setInt(5, game.getRating());
            ps.setDate(6, game.getReleaseDate());
            ps.setDouble(7, game.getPrice());
            ps.setString(8, game.getState());
            ps.setInt(9, game.getStatus());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public int updateInfoGame(Game game) {
        int n = 0;
        String sql = "update Game set Title=?, coId=?, description=?, version=?, rating=?, releaseDate=?, price=?, state=?, status=? where gId=? ";
        
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, game.getTitle());
            ps.setInt(2, game.getCoID());
            ps.setString(3, game.getDescription());
            ps.setString(4, game.getVersion());
            ps.setDate(5, game.getReleaseDate());
            ps.setInt(6, game.getRating());
            ps.setDouble(7, game.getPrice());
            ps.setString(8, game.getState());
            ps.setInt(9, game.getStatus());
            ps.setInt(10, game.getGid());
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
        String sql = "SELECT * FROM Game WHERE Title = '" + gameTitle + "'";
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
                pro.setGid(rs.getInt("gId"));
                pro.setTitle(rs.getString("Title"));
                pro.setCoID(rs.getInt("coId"));
                pro.setDescription(rs.getString("description"));
                pro.setVersion(rs.getString("version"));
                pro.setRating(rs.getInt("rating"));
                pro.setReleaseDate(rs.getDate("releaseDate"));
                pro.setPrice(rs.getDouble("price"));
                pro.setState(rs.getString("state"));
                pro.setStatus(rs.getInt("status"));
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
                pro.setGid(rs.getInt("gId"));
                pro.setTitle(rs.getString("Title"));
                pro.setCoID(rs.getInt("coId"));
                pro.setDescription(rs.getString("description"));
                pro.setVersion(rs.getString("version"));
                pro.setRating(rs.getInt("rating"));
                pro.setReleaseDate(rs.getDate("releaseDate"));
                pro.setPrice(rs.getDouble("price"));
                pro.setState(rs.getString("state"));
                pro.setStatus(rs.getInt("status"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Game getGameById(int gId) {
        String sql = "SELECT * FROM Game WHERE gId =" + gId;
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Game game = new Game();
                game.setGid(rs.getInt("gId"));
                game.setTitle(rs.getString("Title"));
                game.setCoID(rs.getInt("coId"));
                game.setDescription(rs.getString("description"));
                game.setVersion(rs.getString("version"));
                game.setRating(rs.getInt("rating"));
                game.setReleaseDate(rs.getDate("releaseDate"));
                game.setPrice(rs.getDouble("price"));
                game.setState(rs.getString("state"));
                game.setStatus(rs.getInt("status"));
                return game;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Game> getGameByRating() {
        ArrayList<Game> list = new ArrayList<>();
        String sql = "SELECT TOP 10 * FROM GAME ORDER BY rating desc";
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Game pro = new Game();
                pro.setGid(rs.getInt("gId"));
                pro.setTitle(rs.getString("Title"));
                pro.setCoID(rs.getInt("coId"));
                pro.setDescription(rs.getString("description"));
                pro.setVersion(rs.getString("version"));
                pro.setRating(rs.getInt("rating"));
                pro.setReleaseDate(rs.getDate("releaseDate"));
                pro.setPrice(rs.getDouble("price"));
                pro.setState(rs.getString("state"));
                pro.setStatus(rs.getInt("status"));
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
                pro.setGid(rs.getInt("gId"));
                pro.setTitle(rs.getString("Title"));
                pro.setCoID(rs.getInt("coId"));
                pro.setDescription(rs.getString("description"));
                pro.setVersion(rs.getString("version"));
                pro.setRating(rs.getInt("rating"));
                pro.setReleaseDate(rs.getDate("releaseDate"));
                pro.setPrice(rs.getDouble("price"));
                pro.setState(rs.getString("state"));
                pro.setStatus(rs.getInt("status"));
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
                pro.setGid(rs.getInt("gId"));
                pro.setTitle(rs.getString("Title"));
                pro.setCoID(rs.getInt("coId"));
                pro.setDescription(rs.getString("description"));
                pro.setVersion(rs.getString("version"));
                pro.setRating(rs.getInt("rating"));
                pro.setReleaseDate(rs.getDate("releaseDate"));
                pro.setPrice(rs.getDouble("price"));
                pro.setState(rs.getString("state"));
                pro.setStatus(rs.getInt("status"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Game> getGameByPlatformId(int plId) {
        ArrayList<Game> list = new ArrayList<>();
        String sql = "SELECT * FROM Game as a join Game_Platform as b on a.gId = b.gId WHERE b.plId =" + plId;
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Game pro = new Game();
                pro.setGid(rs.getInt("gId"));
                pro.setTitle(rs.getString("Title"));
                pro.setCoID(rs.getInt("coId"));
                pro.setDescription(rs.getString("description"));
                pro.setVersion(rs.getString("version"));
                pro.setRating(rs.getInt("rating"));
                pro.setReleaseDate(rs.getDate("releaseDate"));
                pro.setPrice(rs.getDouble("price"));
                pro.setState(rs.getString("state"));
                pro.setStatus(rs.getInt("status"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    //Day nay
    public ArrayList<Game> getGameByMultiCategoryId(String[] caIds) {
        if (caIds.length == 0) return null;
        ArrayList<Game> list = new ArrayList<>();
        for (String caId : caIds) {
            String sql = "SELECT * FROM [Web_Game_DB].[dbo].[Game] WHERE gId IN (SELECT gId FROM [Web_Game_DB].[dbo].[Game_Category] WHERE caId = " + caId+")";
            ResultSet rs = dbConn.getData(sql);
            try {
                while (rs.next()) {
                    boolean check = true;
                    Game game = new Game();
                    game.setGid(rs.getInt("gId"));
                    game.setTitle(rs.getString("Title"));
                    game.setCoID(rs.getInt("coId"));
                    game.setDescription(rs.getString("description"));
                    game.setVersion(rs.getString("version"));
                    game.setRating(rs.getInt("rating"));
                    game.setReleaseDate(rs.getDate("releaseDate"));
                    game.setPrice(rs.getDouble("price"));
                    game.setState(rs.getString("state"));
                    game.setStatus(rs.getInt("status"));
                    for (Game game1 : list) {
                        if (game1.getGid()==game.getGid()) {
                            game.setStatus(game.getStatus()+2);
                            check = false;
                            break;
                        }
                    }
                    if (check) list.add(game);
                }
            } catch (SQLException ex) {
                Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        Collections.sort(list, (Game g1, Game g2) -> g1.getStatus()-g2.getStatus());
        return list;
    }
    
        
    public ArrayList<Game> getGame_SameCategory(int gId) {
        sql = "select distinct gid from Game_Category where caId in (Select caid from Game_Category where gId="+gId+")";
        ArrayList<Game> list = new ArrayList<>();
        Game x = null;
        
       
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int gameId = rs.getInt("gId");
                x= getGameById(gameId);
                list.add(x);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Game> getGame_SamePlatform(int gId) {
        sql = "select distinct gid from Game_Platform where plId in (Select plid from Game_Platform where gId="+gId+")";
        ArrayList<Game> list = new ArrayList<>();
        Game x = null;

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int gameId = rs.getInt("gId");
                x= getGameById(gameId);
                list.add(x);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Game> getGame_SameCom(int gId) {
        sql = "select gid from Game where coId = (Select coid from Game where gId="+gId+")";
        ArrayList<Game> list = new ArrayList<>();
        Game x = null;

        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int gameId = rs.getInt("gId");
                x= getGameById(gameId);
                list.add(x);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Game> getGamesSort(String crite, boolean descend) {
        String sql = "SELECT TOP 10 * FROM Game ORDER BY "+ crite;
        if (descend) sql += " desc"; else sql+= " asc";
        ArrayList<Game> list = new ArrayList<>();
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Game game = new Game();
                game.setGid(rs.getInt("gId"));
                game.setTitle(rs.getString("Title"));
                game.setCoID(rs.getInt("coId"));
                game.setDescription(rs.getString("description"));
                game.setVersion(rs.getString("version"));
                game.setRating(rs.getInt("rating"));
                game.setReleaseDate(rs.getDate("releaseDate"));
                game.setPrice(rs.getDouble("price"));
                game.setState(rs.getString("state"));
                game.setStatus(rs.getInt("status"));
                list.add(game);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
}