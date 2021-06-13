/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Company;
import entity.Game;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Admin
 */
public class CompanyDAO {

    DBConnection dbConn;
    Connection conn;
    String sql;

    public CompanyDAO(DBConnection dbconn) {
        this.dbConn = dbconn;
        conn = dbconn.getConnection();
    }

    public String getCompanyName(int coId) {
        sql = "SELECT * FROM Company WHERE coId = " + coId;
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                return rs.getString("coName");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public boolean checkCompanyExist(int coId) {
        sql = "SELECT * FROM Company WHERE coId = " + coId;
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void insertCompany(Company com) {
        sql = "Insert into Company values (?,?,?,?,?,?,?)";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, com.getCoId());
            ps.setString(2, com.getCoName());
            ps.setString(3, sdf.format(com.getFoundDate()));
            ps.setString(4, com.getCoAddress());
            ps.setString(5, com.getCoPhone());
            ps.setString(6, com.getCoMail());
            ps.setBoolean(7, com.isStatus());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateCompany(Company com) {
        sql = "update Company set coName=?,foundDate=?,coAddress=?,coPhone=?,coMail=?,stauts=? where coId=? ";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, com.getCoName());
            ps.setString(2, sdf.format(com.getFoundDate()));
            ps.setString(3, com.getCoAddress());
            ps.setString(4, com.getCoPhone());
            ps.setString(5, com.getCoMail());
            ps.setBoolean(6, com.isStatus());
            ps.setInt(7, com.getCoId());
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Company> getAllCompanys() {
        sql = "select * from Company";
        ArrayList<Company> list = new ArrayList<>();
        int coId;
        String coName;
        Date foundDate;
        String coAddress;
        String coPhone;
        String coMail;
        boolean status;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                coId = rs.getInt("coId");
                coName = rs.getString("coName");
                foundDate = rs.getDate("foundDate");
                coAddress = rs.getString("coAddress");
                coPhone = rs.getString("coPhone");
                coMail = rs.getString("coMail");
                status = rs.getBoolean("status");
                list.add(new Company(coId, coName, foundDate, coAddress, coPhone, coMail, status));
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public Company getCompanysById(int xcoId) {
        sql = "select * from Company where coId =" + xcoId;
        Company x = null;
        int coId;
        String coName;
        Date foundDate;
        String coAddress;
        String coPhone;
        String coMail;
        boolean status;
        try {
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                coId = rs.getInt("coId");
                coName = rs.getString("coName");
                foundDate = rs.getDate("foundDate");
                coAddress = rs.getString("coAddress");
                coPhone = rs.getString("coPhone");
                coMail = rs.getString("coMail");
                status = rs.getBoolean("status");
                x = new Company(coId, coName, foundDate, coAddress, coPhone, coMail, status);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return x;
    }
    
    public int changeStatus(String id, int status) {
        int n = 0;
        sql = "update Company set status = " + (status == 1 ? 0 : 1) + " where coId = '" + id + "'";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOGame.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public void removeCompany(int coId){
        String sql = "Select * from Game as a join Company as b on a.coId = b.coId where b.gId = '" + coId + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                changeStatus(rs.getString("coId"), 1);
            } else {
                String sqlDelete = "delete from Company where CoId = '" + coId + "'";
                Statement state = conn.createStatement();
                state.executeUpdate(sqlDelete);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CompanyDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
