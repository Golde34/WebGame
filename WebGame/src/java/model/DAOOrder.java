/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Order;
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
 * @author Duong
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
        String sql = "Insert into Order(uId, orderDate, total, status"
                + " values (?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, obj.getuId());
            pre.setTimestamp(2, obj.getOrderDate());
            pre.setDouble(3, obj.getTotal());
            pre.setInt(4, obj.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int changeStatus(String orderId) {
        int n = 0;
        String sql = "UPDATE Order SET status = 1 WHERE oid = '" + orderId + "'";

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
        String sql = "update Order set uId=?, orderDate=?, total=?, status=? where oId=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, obj.getuId());
            pre.setDouble(2, obj.getTotal());
            pre.setTimestamp(3, obj.getOrderDate());
            pre.setInt(4, obj.getStatus());
            pre.setInt(5, obj.getoId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int removeOrder(String orderId) {
        int n = 0;
        String sql = "Select * from Order as a join Order_Detail as b on a.oId = b.oId where a.oId = '" + orderId + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                String s = rs.getString("oId");
                return s == null ? 0 : Integer.parseInt(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int getMaxOrderId() {
        String sql = "select MAX(oId) as orderId from Order";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                String s = rs.getString("orderId");
                return s == null ? 0 : Integer.parseInt(s);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Order> getAllOrder() {
        ArrayList<Order> list = new ArrayList<>();
        String sql = "select * from Order order by oId desc";
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Order o = new Order();
                o.setoId(rs.getInt("oId"));
                o.setuId(rs.getInt("uId"));
                o.setOrderDate(rs.getTimestamp("orderDate"));
                o.setTotal(rs.getDouble("total"));
                o.setStatus(rs.getInt("status"));
                list.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Order> getOrderByUIdAndStatus(int uId, int status) {
        ArrayList<Order> list = new ArrayList<>();
        String s = " ";
        if (status != -1) {
            s = " and status = " + status + " ";
        }
        String sql = "select * from Order where uId = " + uId + s + "order by uId desc";
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Order o = new Order();
                o.setoId(rs.getInt("oId"));
                o.setuId(rs.getInt("uId"));
                o.setOrderDate(rs.getTimestamp("orderDate"));
                o.setTotal(rs.getDouble("total"));
                o.setStatus(rs.getInt("status"));
                list.add(o);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
