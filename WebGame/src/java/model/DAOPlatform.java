/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Platform;
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
public class DAOPlatform {
    DBConnection dbConn;
    Connection conn;
    String sql;

    public DAOPlatform(DBConnection dbconn) {
        this.dbConn = dbconn;
        conn = dbconn.getConnection();
    }

    public void insertPlatform(Platform plat) {
        sql = "Insert into Platform(plName,description,status) values (?,?,?,?)";
        PreparedStatement ps;

        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, plat.getPlname());
            ps.setString(2, plat.getDescription());
            ps.setInt(3, plat.getStatus());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOPlatform.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updatePlatform(Platform plat) {
        sql = "update Platform set plName=?, description=?, status=? where plId=?";
        PreparedStatement ps;
        try {
            ps = conn.prepareStatement(sql);
            ps.setString(1, plat.getPlname());
            ps.setString(2, plat.getDescription());
            ps.setInt(3, plat.getStatus());
            ps.setInt(4, plat.getPlId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOPlatform.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Platform> getAllPlatforms() {
        sql = "select * from Platform";
        ArrayList<Platform> list = new ArrayList<>();
        Platform x = null;
        int caId;
        String caName;
        String descript;
        int status;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                caId = rs.getInt("plId");
                caName = rs.getString("plName");
                descript = rs.getString("description");
                status = rs.getInt("status");
                x = new Platform(caId, caName, descript, status);
                list.add(x);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOPlatform.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public Platform getPlatformsById(int id) {
        sql = "select * from Platform where plId=" + id;
        Platform x = null;
        int caId;
        String caName;
        String descript;
        int status;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                caId = rs.getInt("caId");
                caName = rs.getString("caName");
                descript = rs.getString("descript");
                status = rs.getInt("status");
                x = new Platform(caId, caName, descript, status);                
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOPlatform.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
    }
    
    public int changeStatus(int id, int status) {
        int n = 0;
        String sql = "update Platform set status = " + (status == 1 ? 0 : 1) + " where plId = '" + id + "'";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOPlatform.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int removePlatform(int id) {
        int n = 0;
        String sql = "Select * from Platform as a join Game_Category as b on a.plId = b.plId where a.plId = '" + id + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                changeStatus(rs.getInt("plId"), 1);
            } else {
                String sqlDelete = "delete from Platform where plId = '" + id + "'";
                Statement state = conn.createStatement();
                n = state.executeUpdate(sqlDelete);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOPlatform.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public boolean checkDupPlatformName(String name) {
        String sql = "SELECT * FROM Platform WHERE plName = '" + name + "'";
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
