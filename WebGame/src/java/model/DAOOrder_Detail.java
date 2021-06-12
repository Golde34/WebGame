/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Order_Detail;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOOrder_Detail {

    DBConnection dbConn;
    Connection conn;

    public DAOOrder_Detail(DBConnection dbConn) {
        this.dbConn = dbConn;
        conn = dbConn.getConnection();
    }

    public int insertOrderDetail(Order_Detail obj) {
        int n = 0;
        String sql = "Insert into Oder_Detail(oId, gId, orderDate, price, status)"
                + " values (?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, obj.getoId());
            pre.setInt(2, obj.getgId());
            pre.setTimestamp(3, obj.getOrderDate());
            pre.setDouble(4, obj.getPrice());
            pre.setDouble(5, obj.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder_Detail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int removeOrderDetail(String orderId, String gId) {
        int n = 0;
        String sqlDelete = "delete from Order_Detail where oId = '" + orderId + "' and gId = '" + gId + "'";
        Statement stm;
        try {
            stm = conn.createStatement();
            n = stm.executeUpdate(sqlDelete);
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder_Detail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateOrderDetail(Order_Detail obj) {
        int n = 0;
        String sql = "update Order_Detail set orderDate=?, price=? where oId=? and gId=?";
        try {
            PreparedStatement preStm = conn.prepareStatement(sql);
            preStm.setTimestamp(1, obj.getOrderDate());
            preStm.setDouble(2, obj.getPrice());
            preStm.setInt(3, obj.getoId());
            preStm.setInt(4, obj.getgId());
            n = preStm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder_Detail.class.getName()).log(Level.SEVERE, null, ex);

        }
        return n;
    }

    public ArrayList<Order_Detail> getByOrderId(int id) {
        ArrayList<Order_Detail> list = new ArrayList<>();
        String sql = "select a.oId, a.gId, b.title, a.price from Order_Detail a inner join Game b on a.gId = b.gId where a.gId = " + id ;
        ResultSet rs = dbConn.getData(sql);
        try {
            while(rs.next()){
                Order_Detail od = new Order_Detail();
                od.setoId(rs.getInt("oId"));
                od.setgId(rs.getInt("gId"));
                od.setOrderDate(rs.getTimestamp("orderDate"));
                od.setPrice(rs.getDouble("price"));
                list.add(od);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder_Detail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public HashMap<Integer, ArrayList<Order_Detail>> getListBillDetail() {
        HashMap<Integer, ArrayList<Order_Detail>> list = new HashMap<>();
        DAOOrder daoOd = new DAOOrder(dbConn);
        int number = daoOd.getMaxOrderId();
        for (int i = 1; i <= number; i++) {
            list.put(i, getByOrderId(i));
        }
        return list;
    }
}
