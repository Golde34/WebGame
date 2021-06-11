/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Customer;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class DAOCustomer {

    DBConnection dbConn;
    Connection conn;

    public DAOCustomer(DBConnection dbCon) {
        this.dbConn = dbCon;
        conn = dbCon.getConnection();
    }

    public Customer getUserLogin(String username, String password) {
        String sql = "SELECT * FROM KhachHang WHERE username = ? and password = ? and status = 1";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return new Customer(rs.getInt("cid"),
                        rs.getString("cname"), rs.getString("address"),
                        rs.getString("phone"), rs.getString("username"),
                        rs.getString("password"), rs.getInt("status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int addCustomer(Customer obj) {
        int n = 0;
        String sql = "INSERT INTO KhachHang(cname, address, phone, username, password)"
                + " values (?,?,?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getcName());
            pre.setString(2, obj.getAddress());
            pre.setString(3, obj.getPhone());
            pre.setString(4, obj.getUsername());
            pre.setString(5, obj.getPassword());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int updateInfoCustomer(Customer obj) {
        int n = 0;
        String sql = "UPDATE KhachHang SET cname=?, address=?, phone=?, status=? where cid=?";
        try {
            PreparedStatement preStm = conn.prepareStatement(sql);
            preStm.setString(1, obj.getcName());
            preStm.setString(2, obj.getAddress());
            preStm.setString(3, obj.getPhone());
            preStm.setInt(4, obj.getStatus());
            preStm.setInt(5, obj.getcId());
            n = preStm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int changePassword(String username, String newPass) {
        try {
            String sqlUpdate = "update KhachHang set password = ? where username = ?";
            PreparedStatement preStm = conn.prepareStatement(sqlUpdate);
            preStm.setString(1, newPass);
            preStm.setString(2, username);
            int n = preStm.executeUpdate();
            return n;
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public int changeStatus(String username, int status) {
        int n = 0;
        String sql = "UPDATE KhachHang SET status = " + (status == 1 ? 0 : 1)
                + " WHERE username = '" + username + "'";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public int removeCustomer(int id) {
        int n = 0;
        String sql = "SELECT * FROM KhachHang AS a JOIN HoaDon as b on a.cid = b.cid "
                + "WHERE a.cid = " + id;
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                n = changeStatus(rs.getString("username"), 1);
            } else {
                String sqlDelete = "DELETE FROM KhachHang WHERE cid = " + id;
                Statement state = conn.createStatement();
                n = state.executeUpdate(sqlDelete);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }

    public boolean checkDupUserName(String username) {
        String sql = "SELECT * FROM KhachHang WHERE username = '" + username + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public Customer getCustomerByUsername(String username) {
        String sql = "SELECT * FROM KhachHang WHERE username = '" + username + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                Customer customer = new Customer(rs.getInt("cid"), rs.getString("cname"), rs.getString("address"), rs.getString("phone"), rs.getString("username"), rs.getString("password"), rs.getInt("status"));
                return customer;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Customer getCustomerById(int id) {
        String sql = "SELECT * FROM KhachHang WHERE cid = '" + id + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                Customer customer = new Customer(rs.getInt("cid"), rs.getString("cname"), rs.getString("address"), rs.getString("phone"), rs.getString("username"), rs.getString("password"), rs.getInt("status"));
                return customer;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Customer> getAllCustomer() {
        ArrayList<Customer> list = new ArrayList<>();
        String sql = "SELECT * FROM KhachHang";
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Customer c = new Customer();
                c.setcId(rs.getInt("cid"));
                c.setcName(rs.getString("cname"));
                c.setAddress(rs.getString("address"));
                c.setPhone(rs.getString("phone"));
                c.setUsername(rs.getString("username"));
                c.setPassword(rs.getString("password"));
                c.setStatus(rs.getInt("status"));
                list.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Customer> getSearchCustomer(int cid, String cName, int status) {
        ArrayList<Customer> list = new ArrayList<>();
        String s1 = " ";
        if (cid != 0) {
            s1 = " and cid = " + cid + " ";
        }

        String s2 = " ";
        if (status != -1) {
            s2 = " and status = " + status + " ";
        }

        String sql = "SELECT * FROM KhachHang WHERE cname like '%" + cName + "%' " + s1 + " " + s2;
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Customer c = new Customer();
                c.setcId(rs.getInt("cid"));
                c.setcName(rs.getString("cname"));
                c.setAddress(rs.getString("address"));
                c.setPhone(rs.getString("phone"));
                c.setUsername(rs.getString("username"));
                c.setPassword(rs.getString("password"));
                c.setStatus(rs.getInt("status"));
                list.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCustomer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
}
