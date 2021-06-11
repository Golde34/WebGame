/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Order;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOOrder {

    DBConnection dbConn;
    Connection conn;

    public DAOOrder(DBConnection dbConn) {
        this.dbConn = dbConn;
        conn = dbConn.getConnection();
    }

    public int insertOrder(Order obj) {
        int n = 0;
        String sql = "Insert into HoaDon(hid, date, "
                + "cid, Rcname, Raddress, Rphone, "
                + "total, status)"
                + " values (?,?,?,?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getOrderId());
            pre.setTimestamp(2, obj.getDate());
            pre.setInt(3, obj.getcId());
            pre.setString(4, obj.getRcname());
            pre.setString(5, obj.getRaddress());
            pre.setString(6, obj.getRphone());
            pre.setDouble(7, obj.getTotal());
            pre.setInt(8, obj.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int changeStatus(String orderId) {
        int n = 0;
        String sql = "UPDATE HoaDon SET status = 1 WHERE hid = '" + orderId + "'";

        Statement state;
        try {
            state = conn.createStatement();
            n = state.executeUpdate(sql);
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateOrder(Order obj) {
        int n = 0;
        String sql = "update HoaDon set date=?, cid=?, Rcname=?, Raddress=?, Rphone=?, total=?, status=? where hid=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setTimestamp(1, obj.getDate());
            pre.setInt(2, obj.getcId());
            pre.setString(3, obj.getRcname());
            pre.setString(4, obj.getRaddress());
            pre.setString(5, obj.getRphone());
            pre.setDouble(6, obj.getTotal());
            pre.setInt(7, obj.getStatus());
            pre.setString(8, obj.getOrderId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int removeOrder(String orderId) {
        int n = 0;
        String sql = "Select * from HoaDon as a join HoaDonChiTiet as b on a.hid = b.hid where a.hid = '" + orderId + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                String s = rs.getString("hid");
                return s == null ? 0 : Integer.parseInt(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int getMaxOrderId() {
        String sql = "select MAX(hid) as hid from HoaDon";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                String s = rs.getString("hid");
                return s == null ? 0 : Integer.parseInt(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public ArrayList<Order> getAllOrder() {
        ArrayList<Order> list = new ArrayList<>();
        String sql = "select * from HoaDon order by hid desc";
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Order hd = new Order();
                hd.setOrderId(rs.getString("hid"));
                hd.setDate(rs.getTimestamp("date"));
                hd.setcId(rs.getInt("cid"));
                hd.setRcname(rs.getString("Rcname"));
                hd.setRaddress(rs.getString("Raddress"));
                hd.setRphone(rs.getString("Rphone"));
                hd.setTotal(rs.getDouble("total"));
                hd.setStatus(rs.getInt("status"));
                list.add(hd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Order> getOrderByCNameAndStatus(String cname, int status) {
        ArrayList<Order> list = new ArrayList<>();
        String s = " ";
        if (status != -1) {
            s = " and status = " + status + " ";
        }
        String sql = "select * from HoaDon where Rcname like '%" + cname + "%'" + s + "order by hid desc";
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Order hd = new Order();
                hd.setOrderId(rs.getString("hid"));
                hd.setDate(rs.getTimestamp("date"));
                hd.setcId(rs.getInt("cid"));
                hd.setRcname(rs.getString("Rcname"));
                hd.setRaddress(rs.getString("Raddress"));
                hd.setRphone(rs.getString("Rphone"));
                hd.setTotal(rs.getDouble("total"));
                hd.setStatus(rs.getInt("status"));
                list.add(hd);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
