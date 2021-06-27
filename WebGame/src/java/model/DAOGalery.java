/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Galery;
import java.sql.Connection;
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
public class DAOGalery {

    DBConnection dbConn;
    Connection conn;
    String sql;

    public DAOGalery(DBConnection dbconn) {
        this.dbConn = dbconn;
        conn = dbconn.getConnection();
    }

    public void insertGalery(Galery gal) {
        sql = "insert into Galery(gId,link,type,status) values(?,?,?,?)";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, gal.getgId());
            ps.setString(2, gal.getLink());
            ps.setString(3, gal.getType());
            ps.setBoolean(4, gal.isStatus());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOGalery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateGalery(Galery gal) {
        sql = "update Galery set link=?, type=?, status=? where gId=?";
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, gal.getgId());
            ps.setString(2, gal.getLink());
            ps.setString(3, gal.getType());
            ps.setBoolean(4, gal.isStatus());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOGalery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Galery> getAllGalerys() {
        sql = "select * from Galery";
        ArrayList<Galery> list = new ArrayList<>();
        Galery x = null;
        int gId;
        String link;
        String type;
        boolean status;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                gId = rs.getInt("gId");
                link = rs.getString("link");
                type = rs.getString("type");
                status = rs.getBoolean("status");
                x = new Galery(gId, link, type, status);
                list.add(x);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGalery.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Galery> getGaleryById(int fgId) {
        sql = "select * from Galery where gId = " + fgId;       
        ArrayList<Galery> x = new ArrayList<>();
        int gId;
        String link;
        String type;
        boolean status;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                gId = rs.getInt("gId");
                link = rs.getString("link");
                type = rs.getString("type");
                status = rs.getBoolean("status");
                Galery a = new Galery(gId, link, type, status);
                x.add(a);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGalery.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
    }
    
    public ArrayList<Galery> getOneGaleryByType(ArrayList<Galery> ga, String type) {
        ArrayList<Galery> galery = new ArrayList<>();
        for (Galery galery1 : ga) {
            if (galery1.getType().equalsIgnoreCase(type)) {
                galery.add(galery1);
            }
        }
        return galery;
    }
    
    public ArrayList<Galery> getGaleryByTypeId(int xgId, String xtype) {
        sql = "select * from Galery WHERE gId = ? and type = ?";
        ArrayList<Galery> list = new ArrayList<>();
        Galery x = null;
        int gId;
        String link;
        String type;
        boolean status;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, xgId);
            ps.setString(2, xtype);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                gId = rs.getInt("gId");
                link = rs.getString("link");
                type = rs.getString("type");
                status = rs.getBoolean("status");
                x = new Galery(gId, link, type, status);
                list.add(x);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGalery.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Galery> getVideo() {
        sql = "select * from Galery WHERE type = 'vid-trailer'";
        ArrayList<Galery> list = new ArrayList<>();
        Galery x = null;
        int gId;
        String link;
        String type;
        boolean status;
        try {
            Statement ps = conn.createStatement();
            ResultSet rs = ps.executeQuery(sql);
            while(rs.next()){
                gId = rs.getInt("gId");
                link = rs.getString("link");
                type = rs.getString("type");
                status = rs.getBoolean("status");
                x = new Galery(gId, link, type, status);
                list.add(x);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGalery.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public int changeStatus(int id, int status) {
        int n = 0;
        String sql = "update Galery set status = " + (status == 1 ? 0 : 1) + " where gId = '" + id + "'";
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
        String sql = "Select * from Game as a join Galery as b on a.gId = b.gId where b.gId = '" + id + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                changeStatus(rs.getInt("gId"), 1);
            } else {
                String sqlDelete = "delete from Galery where gId = '" + id + "'";
                Statement state = conn.createStatement();
                n = state.executeUpdate(sqlDelete);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public boolean checkDupGaleryInfo(int gId,String link) {
        String sql = "SELECT * FROM Galery WHERE link = '" + link + "' and gId = "+ gId;
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
    
    public ArrayList<Galery> getFullGameGalery(int gid ){
        String sql = "SELECT * FROM Galery WHERE gid = ? and not (type = 'img-po') order by type desc";
        PreparedStatement ps;
        ArrayList<Galery> list = new ArrayList<>();
        Galery x = null;
        int gId;
        String link;
        String type;
        boolean status;
        try {
            ps = conn.prepareStatement(sql);
            ps.setInt(1, gid);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                gId = rs.getInt("gId");
                link = rs.getString("link");
                type = rs.getString("type");
                status = rs.getBoolean("status");
                x = new Galery(gId, link, type, status);
                list.add(x);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGalery.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
        
    }
}
