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
    
    public Galery getGaleryById(int fgId) {
        sql = "select * from Galery where gId = " + fgId;       
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
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOGalery.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
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
    
}
