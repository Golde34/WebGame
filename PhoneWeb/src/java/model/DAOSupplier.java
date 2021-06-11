/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Supplier;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOSupplier {

    DBConnection dbConn;
    Connection conn;

    public DAOSupplier(DBConnection dbConn) {
        this.dbConn = dbConn;
        conn = dbConn.getConnection();
    }

    public int insertSupplier(Supplier obj) {
        int n = 0;
        String sql = "INSERT INTO HangSanxuat(hname, website) + values (?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getSupName());
            pre.setString(2, obj.getWebsite());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOSupplier.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateInfoSupplier(Supplier obj) {
        int n = 0;
        String sql = "UPDATE HangSanXuat SET hname = ?, website = ?, status = ?, WHERE hid = ?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getSupName());
            pre.setString(2, obj.getWebsite());
            pre.setInt(3, obj.getStatus());
            pre.setInt(4, obj.getSupId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOSupplier.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;

    }

    public int changeStatus(String supName, int status) {
        int n = 0;
        String sql = "UPDATE HangSanXuat SET status = "
                + (status == 1 ? 0 : 1) + " WHERE hname = '" + supName + "'";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOSupplier.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int removeSupplier(int id) {
        int n = 0;
        String sql = "SELECT * FROM HangSanXuat AS a JOIN SanPham as b on a.hid = b.hid where a.id = " + id;
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                changeStatus(rs.getString("hname"), 1);
            } else {
                String sqlDelete = "DELETE From HangSanXuat WHERE hid = " + id;
                Statement state = conn.createStatement();
                n = state.executeUpdate(sqlDelete);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOSupplier.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public boolean checkDupSupplierName(String supName) {
        String sql = "SELECT * FROM HangSanXuat WHERE hname = '" + supName + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOSupplier.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public ArrayList<Supplier> getAllSupplier() {
        ArrayList<Supplier> list = new ArrayList<>();
        String sql = "SELECT * FROM HangSanXuat WHERE status = 1";
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                int supId = rs.getInt("hid");
                String supName = rs.getString("hname");
                String website = rs.getString("website");
                Supplier s = new Supplier(supId, supName, website);
                list.add(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOSupplier.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
