/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOAdmin {

    DBConnection dbCon;
    Connection conn;

    public DAOAdmin(DBConnection dbCon) {
        this.dbCon = dbCon;
        conn = dbCon.getConnection();
    }

    public admin getAdminLogin(String username, String password) {
        String sql = "SELECT * FROM admin WHERE username = ? and password = ? and status = 1";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return new admin(rs.getString("username"), rs.getString("password"), rs.getInt("status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int addAdmin(admin obj) {
        int n = 0;
        String sql = "INSERT INTO admin (username, password)"
                + "value (?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getUsername());
            pre.setString(2, obj.getPassword());

            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateAdmin(admin obj) {
        int n = 0;
        String sql = "UPDATE admin SET password = ?, status = ? where username=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getPassword());
            pre.setInt(2, obj.getStatus());
            pre.setString(3, obj.getUsername());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int changePassword(String username, String oldPass, String newPass) {
        int n = 0;
        String sql = "SELECT * FROM admin WHERE username = '" + username + "' and password = '" + oldPass + "'";
        ResultSet rs = dbCon.getData(sql);
        try {
            if (rs.next()) {
                String sqlUpdate = "UPDATE admin SET password = ? where username = ?";
                PreparedStatement pre = conn.prepareStatement(sqlUpdate);
                pre.setString(1, newPass);
                pre.setString(2, username);
                n = pre.executeUpdate();
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int changeStatus(String userName, int status) {
        int n = 0;
        String sql = "UPDATE admin SET status = " + (status == 1 ? 0 : 1) + "WHERE username = " + userName;
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int removeAdmin(String username) {
        int n = 0;
        String sql = "DELETE FROM admin WHERE username = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public boolean checkDupUsername(String username) {
        String sql = "SELECT * FROM admin WHERE username = '" + username + "'";
        ResultSet rs = dbCon.getData(sql);
        try {
            if(rs.next()) {
                return true;
            } 
        } catch (SQLException ex) {
            Logger.getLogger(DAOAdmin.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
