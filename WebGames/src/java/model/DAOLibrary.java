/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import entity.Game;
import entity.Library;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Duong
 */
public class DAOLibrary {
    DBConnection dbConn;
    Connection conn;

    public DAOLibrary(DBConnection dbConn) {
        this.dbConn = dbConn;
        conn = dbConn.getConnection();
    }
    
    public int insertLibrary(Library obj) {
        int n = 0;
        String sql = "INSERT INTO Library(uId, gId, status) + values (?,?,?)";
        try {
            PreparedStatement pre = conn.prepareStatement(sql);
            pre.setInt(1, obj.getuId());
            pre.setInt(2, obj.getgId());
            pre.setInt(3, obj.getStatus());
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOLibrary.class.getName()).log(Level.SEVERE, null, ex);
        }
        return n;
    }
    
    public ArrayList<Game> getGameByUIdAndStatus(int uId, int status) {
        ArrayList<Game> list = new ArrayList<>();
        String s = " ";
        if (status != -1) {
            s = " and status = " + status + " ";
        }
        String sql = "select * from Library where uId = " + uId + s + "order by uId desc";
        ResultSet rs = dbConn.getData(sql);
        try {
            while (rs.next()) {
                Game g = new Game();
                g.setGid(rs.getInt("gId"));
                list.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
}
