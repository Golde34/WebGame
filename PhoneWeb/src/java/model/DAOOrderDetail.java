/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.OrderDetail;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOOrderDetail {

    DBConnection dbConn;
    Connection conn;

    public DAOOrderDetail(DBConnection dbConn) {
        this.dbConn = dbConn;
        conn = dbConn.getConnection();
    }

    public int insertOrderDetail(OrderDetail obj) {
        int n = 0;
        String sql = "Insert into HoaDonChiTiet(hid, sid, quantity, price)"
                + " values (?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getOrderId());
            pre.setString(2, obj.getProName());
            pre.setInt(3, obj.getQuantity());
            pre.setDouble(4, obj.getPrice());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int removeOrderDetail(String orderId, String proId) {
        int n = 0;
        String sqlDelete = "delete from HoaDonChiTiet where hid = '" + orderId + "' and sid = '" + proId + "'";
        Statement stm;
        try {
            stm = conn.createStatement();
            n = stm.executeUpdate(sqlDelete);
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateOrderDetail(OrderDetail obj) {
        int n = 0;
        String sql = "update HoaDonChiTiet set quantity=?, price=? where hid=? and sid=?";
        try {
            PreparedStatement preStm = conn.prepareStatement(sql);
            preStm.setInt(1, obj.getQuantity());
            preStm.setDouble(2, obj.getPrice());
            preStm.setString(3, obj.getOrderId());
            preStm.setString(4, obj.getProId());
            n = preStm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);

        }
        return n;
    }

    public ArrayList<OrderDetail> getByOrderId(int id) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        String sql = "select a.hid, a.sid, b.sname, a.quantity, a.price from HoaDonChiTiet a inner join SanPham b on a.sid = b.sid where a.hid = " + id ;
        ResultSet rs = dbConn.getData(sql);
        try {
            while(rs.next()){
                OrderDetail hdct = new OrderDetail();
                hdct.setOrderId(rs.getString("hid"));
                hdct.setProId(rs.getString("sid"));
                hdct.setProName(rs.getString("sname"));
                hdct.setQuantity(rs.getInt("quantity"));
                hdct.setPrice(rs.getDouble("price"));
                list.add(hdct);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrderDetail.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public HashMap<Integer, ArrayList<OrderDetail>> getListBillDetail() {
        HashMap<Integer, ArrayList<OrderDetail>> list = new HashMap<>();
        DAOOrder daoOd = new DAOOrder(dbConn);
        int number = daoOd.getMaxOrderId();
        for (int i = 1; i <= number; i++) {
            list.put(i, getByOrderId(i));
        }
        return list;
    }
}
