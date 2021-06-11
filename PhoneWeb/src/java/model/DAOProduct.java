/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Product;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOProduct {

    DBConnection dbConn;
    Connection conn;

    public DAOProduct(DBConnection dbConn) {
        this.dbConn = dbConn;
        conn = dbConn.getConnection();
    }

    public int addProduct(Product obj) {
        int n = 0;
        String sql = "Insert into SanPham(sid, sname, quantity, price, picture, description, hid)"
                + " values (?,?,?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getProId());
            pre.setString(2, obj.getProName());
            pre.setInt(3, obj.getQuantity());
            pre.setDouble(4, obj.getPrice());
            pre.setString(5, obj.getPicture());
            pre.setString(5, obj.getDescription());
            pre.setInt(7, obj.getSupId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateInfoProduct(Product obj) {
        int n = 0;
        String sql = "update SanPham set sname=?, quantity=?, price=?, picture=?, description=?, hid=?, status=? where sid=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getProName());
            pre.setInt(2, obj.getQuantity());
            pre.setDouble(3, obj.getPrice());
            pre.setString(4, obj.getPicture());
            pre.setString(5, obj.getDescription());
            pre.setInt(6, obj.getSupId());
            pre.setInt(7, obj.getStatus());
            pre.setString(8, obj.getProId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int changeStatus(String id, int status) {
        int n = 0;
        String sql = "update SanPham set status = " + (status == 1 ? 0 : 1) + " where sid = '" + id + "'";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int removeProduct(String id) {
        int n = 0;
        String sql = "Select * from SanPham as a join HoaDonChiTiet as b on a.sid = b.sid where a.sid = '" + id + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                changeStatus(rs.getString("sid"), 1);
            } else {
                String sqlDelete = "delete from SanPham where sid = '" + id + "'";
                Statement state = conn.createStatement();
                n = state.executeUpdate(sqlDelete);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public boolean checkDupProId(String id) {
        String sql = "SELECT * FROM SanPham WHERE sid = '" + id + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean checkDupProName(String proName) {
        String sql = "SELECT * FROM SanPham WHERE sname = '" + proName + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public boolean checkSupplierExist(int supId) {
        String sql = "SELECT * FROM HangSanXuat WHERE hid = " + supId;
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public String getManufacturer(int supId) {
        String sql = "SELEC * FROM HangSanXuat WHERE hid = " + supId;
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                return rs.getString("hname");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> getProductBySupId(int supId) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM SanPham WHERE hid = " + supId;
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Product pro = new Product();
                pro.setProId(rs.getString("sid"));
                pro.setProName(rs.getString("sname"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setPrice(rs.getDouble("price"));
                pro.setPicture(rs.getString("picture"));
                pro.setDescription(rs.getString("description"));
                pro.setStatus(rs.getInt("status"));
                pro.setSupId(rs.getInt("hid"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Product> getProductByName(String name) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM SanPham WHERE sname like '%" + name + "%'";
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Product pro = new Product();
                pro.setProId(rs.getString("sid"));
                pro.setProName(rs.getString("sname"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setPrice(rs.getDouble("price"));
                pro.setPicture(rs.getString("picture"));
                pro.setDescription(rs.getString("description"));
                pro.setStatus(rs.getInt("status"));
                pro.setSupId(rs.getInt("hid"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public Product getProductByProductId(String sid) {
        String sql = "SELECT * FROM SanPham WHERE sid = '" + sid + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Product pro = new Product();
                pro.setProId(rs.getString("sid"));
                pro.setProName(rs.getString("sname"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setPrice(rs.getDouble("price"));
                pro.setPicture(rs.getString("picture"));
                pro.setDescription(rs.getString("description"));
                pro.setStatus(rs.getInt("status"));
                pro.setSupId(rs.getInt("hid"));
                return pro;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> getAllProduct() {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM SanPham";
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Product pro = new Product();
                pro.setProId(rs.getString("sid"));
                pro.setProName(rs.getString("sname"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setPrice(rs.getDouble("price"));
                pro.setPicture(rs.getString("picture"));
                pro.setDescription(rs.getString("description"));
                pro.setStatus(rs.getInt("status"));
                pro.setSupId(rs.getInt("hid"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<Product> getSearchProduct(String proName, int supId, int status) {
        ArrayList<Product> list = new ArrayList<>();
        
        String s1 = " ";
        if (supId != -1) {
            s1 = " and hid = " + supId + " ";
        }
        
        String s2 = " ";
        if (status != -1) {
            s2 = " and status " + status + " ";
        }
        
        String sql = "SELECT * FROM SanPham WHERE sname like '%" + proName + "%'" + s1 + " " + s2;
        ResultSet rs = dbConn.getData(sql);
        try {
            while(rs.next()) {
                Product pro = new Product();
                pro.setProId(rs.getString("sid"));
                pro.setProName(rs.getString("sname"));
                pro.setQuantity(rs.getInt("quantity"));
                pro.setPrice(rs.getDouble("price"));
                pro.setPicture(rs.getString("picture"));
                pro.setDescription(rs.getString("description"));
                pro.setStatus(rs.getInt("status"));
                pro.setSupId(rs.getInt("hid"));
                list.add(pro);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public int getMaxQuantity() {
        String sql = "SELECT TOP 1 * FROM SanPham ORDER BY quantity desc";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                return rs.getInt("quantity");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public int getMaxQuantity(String sid) {
        String sql = "select * from SanPham where sid = '" + sid + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if(rs.next()){
                return rs.getInt("quantity");
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
}
