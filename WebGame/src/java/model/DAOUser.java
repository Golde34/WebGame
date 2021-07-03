/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Library;
import entity.User;
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
public class DAOUser {
    DBConnection dbConn;
    Connection conn;

    public DAOUser(DBConnection dbCon) {
        this.dbConn = dbCon;
        conn = dbCon.getConnection();
    }
    
    public User getUserLogin(String username, String password) {
        String sql = "SELECT * FROM [User] WHERE username = ? and pass = ? and status = 1";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, username);
            pre.setString(2, password);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("uId"), rs.getString("uName"), rs.getInt("experience"), 
                        rs.getString("uMail"),rs.getString("uPhone"), rs.getString("uAddress"), 
                        rs.getDouble("wallet"), rs.getString("system_role"), rs.getString("username") , 
                        rs.getString("pass"), rs.getInt("status"));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public int addUser(User obj) {
        int n = 0;
        String sql = "INSERT INTO [User](uName, experience, uMail, uPhone, uAddress, wallet, system_role, username, pass, status)"
                + " values (?,?,?,?,?,?,?,?,?,1)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getuName());
            pre.setInt(2, obj.getExperience());
            pre.setString(3, obj.getuMail());
            pre.setString(4, obj.getuPhone());
            pre.setString(5, obj.getuAddress());
            pre.setDouble(6, obj.getWallet());
            pre.setString(7, obj.getSystem_role());
            pre.setString(8, obj.getUsername());
            pre.setString(9, obj.getPass());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int updateInfoUser(User obj) {
        int n = 0;
        String sql = "UPDATE [User] SET uName=?, experience=?, uMail=?, uPhone=?, uAddress=?, wallet=?, system_role=?, username=?, pass=? , status=1 where uId=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1, obj.getuName());
            pre.setInt(2, obj.getExperience());
            pre.setString(3, obj.getuMail());
            pre.setString(4, obj.getuPhone());
            pre.setString(5, obj.getuAddress());
            pre.setDouble(6, obj.getWallet());
            pre.setString(7, obj.getSystem_role());
            pre.setString(8, obj.getUsername());
            pre.setString(9, obj.getPass());
            pre.setInt(10, obj.getuId());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int changePassword(String username, String newPass) {
        try {
            String sqlUpdate = "update [User] set pass = ? where username = ?";
            PreparedStatement preStm = conn.prepareStatement(sqlUpdate);
            preStm.setString(1, newPass);
            preStm.setString(2, username);
            int n = preStm.executeUpdate();
            return n;
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }
    
    public int changeStatus(String username, int status) {
        int n = 0;
        String sql = "UPDATE [User] SET status = " + (status == 1 ? 1 : 0)
                + " WHERE username = '" + username + "'";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int changeStatus(int id, int status) {
        int n = 0;
        String sql = "UPDATE [User] SET status = " + (status == 1 ? 1 : 0)
                + " WHERE uId = '" + id + "'";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public int removeCustomer(int id) {
        int n = 0;
        String sql = "SELECT * FROM [User] AS a JOIN Order as b on a.uid = b.uid "
                + "WHERE a.uid = " + id;
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                n = changeStatus(rs.getString("username"), 0);
            } else {
                String sqlDelete = "DELETE FROM User WHERE uid = " + id;
                Statement state = conn.createStatement();
                n = state.executeUpdate(sqlDelete);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public boolean checkExistUserName(String username) {
        String sql = "SELECT * FROM [User] WHERE username = '" + username + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean checkExistPhone(String phone) {
        String sql = "SELECT * FROM [User] WHERE uPhone = '" + phone + "' and status = 1" ;
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public boolean checkExistMail(String mail) {
        String sql = "SELECT * FROM [User] WHERE uMail = '" + mail + "' and status = 1";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM [User] WHERE username = '" + username + "' and status=1";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                User user = new User(rs.getInt("uId"), rs.getString("uName"), rs.getInt("experience"), 
                        rs.getString("uMail"),rs.getString("uPhone"), rs.getString("uAddress"), 
                        rs.getDouble("wallet"), rs.getString("system_role"), rs.getString("username") , 
                        rs.getString("pass"), rs.getInt("status"));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public User getUserById(int id) {
        String sql = "SELECT * FROM [User] WHERE uId = '" + id + "'";
        ResultSet rs = dbConn.getData(sql);
        try {
            if (rs.next()) {
                User user = new User(rs.getInt("uId"), rs.getString("uName"), rs.getInt("experience"), 
                        rs.getString("uMail"),rs.getString("uPhone"), rs.getString("uAddress"), 
                        rs.getDouble("wallet"), rs.getString("system_role"), rs.getString("username") , 
                        rs.getString("pass"), rs.getInt("status"));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<User> getAllUser() {
        ArrayList<User> list = new ArrayList<>();
        String sql = "SELECT * FROM [User] where status=1";
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                User c = new User();
                c.setuId(rs.getInt("uId"));
                c.setuName(rs.getString("uName"));
                c.setExperience(rs.getInt("experience"));
                c.setuMail(rs.getString("uMail"));
                c.setuPhone(rs.getString("uPhone"));
                c.setuAddress(rs.getString("uAddress"));
                c.setWallet(rs.getDouble("wallet"));
                c.setSystem_role(rs.getString("system_role"));
                c.setUsername(rs.getString("username"));
                c.setPass(rs.getString("pass"));
                c.setStatus(rs.getInt("status"));
                list.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<User> getTrueUser() {
        ArrayList<User> list = new ArrayList<>();
        String sql = "SELECT * FROM [User]";
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                User c = new User();
                c.setuId(rs.getInt("uId"));
                c.setuName(rs.getString("uName"));
                c.setExperience(rs.getInt("experience"));
                c.setuMail(rs.getString("uMail"));
                c.setuPhone(rs.getString("uPhone"));
                c.setuAddress(rs.getString("uAddress"));
                c.setWallet(rs.getDouble("wallet"));
                c.setSystem_role(rs.getString("system_role"));
                c.setUsername(rs.getString("username"));
                c.setPass(rs.getString("pass"));
                c.setStatus(rs.getInt("status"));
                list.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public ArrayList<User> getSearchUser(int uId, String uName, int status) {
        ArrayList<User> list = new ArrayList<>();
        String s1 = " ";
        if (uId != 0) {
            s1 = " and uid = " + uId + " ";
        }

        String s2 = " ";
        if (status != -1) {
            s2 = " and status = " + status + " ";
        }

        String sql = "SELECT * FROM [User] WHERE status=1 and uname like '%" + uName + "%' " + s1 + " " + s2;
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                User c = new User();
                c.setuId(rs.getInt("uId"));
                c.setuName(rs.getString("uName"));
                c.setExperience(rs.getInt("experience"));
                c.setuMail(rs.getString("uMail"));
                c.setuPhone(rs.getString("uPhone"));
                c.setuAddress(rs.getString("uAddress"));
                c.setWallet(rs.getDouble("wallet"));
                c.setSystem_role(rs.getString("system_role"));
                c.setUsername(rs.getString("username"));
                c.setPass(rs.getString("pass"));
                c.setStatus(rs.getInt("status"));
                list.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public void updateWalletUser(User obj, double amount) {
        
        String sql = "UPDATE [User] SET wallet=? where uId=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setDouble(1,obj.getWallet()+amount);
            pre.setInt(2, obj.getuId());
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateinfo(User obj) {
        
        String sql = "UPDATE [User] SET uName=?, uMail=?, uPhone=?, uAddress=? where uId=?";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setString(1,obj.getuName());
            pre.setString(2,obj.getuMail());
            pre.setString(3,obj.getuPhone());
            pre.setString(4,obj.getuAddress());
            pre.setInt(5, obj.getuId());
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
//    public int updateExperience(User obj) {
//        int n = 0;
//        String sql = "UPDATE [User] SET experience=? where uId=?";
//        try {
//            PreparedStatement pre = conn.prepareStatement(sql);
//            pre.setInt(1, obj.getExperience());
//            pre.setInt(2, obj.getuId());
//            n = pre.executeUpdate();
//        } catch (SQLException ex) {
//            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return n;
//    }
//    
//    
//    public int earnExperience(Library list, User u) {
//        int n = 0;
//        String sql = "select * from Library where uId = " + list.getuId() + "and [type] = 'owned' and status = 1";
//        ResultSet rs = dbConn.getData(sql);
//        User user = null;
//        try {
//            if (rs.next()) {
//                
//                String sqlDelete = "delete from Library where uId = '" + lib.getuId() + "' and gId = '" + lib.getgId() + "' and [type] = 'favour'";
//                Statement state = conn.createStatement();
//                n = state.executeUpdate(sqlDelete);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(DAOLibrary.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return n;
//    }
//    
//            public static void main(String[] args) {
//        DBConnection dbcon = new DBConnection();
//        DAOUser daoCa = new DAOUser(dbcon);
//        
//        daoCa.updateWalletUser(daoCa.getUserById(6), 1000);
//        
//     }
}
