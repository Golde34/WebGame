/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 *
 * @author Admin
 */
public class Order {
    private String OrderId;
    private Timestamp date;
    private int cId;
    private String Rcname;
    private String Raddress;
    private String Rphone;
    private double total;
    private int status;

    public Order() {
    }

    public Order(String OrderId, Timestamp date, int cId, String Rcname, String Raddress, String Rphone, double total, int status) {
        this.OrderId = OrderId;
        this.date = date;
        this.cId = cId;
        this.Rcname = Rcname;
        this.Raddress = Raddress;
        this.Rphone = Rphone;
        this.total = total;
        this.status = status;
    }

    public Order(String OrderId, Timestamp date, int cId, String Rcname, String Raddress, String Rphone, double total) {
        this.OrderId = OrderId;
        this.date = date;
        this.cId = cId;
        this.Rcname = Rcname;
        this.Raddress = Raddress;
        this.Rphone = Rphone;
        this.total = total;
    }

    public Order(Timestamp date, int cId, String Rcname, String Raddress, String Rphone, double total) {
        this.date = date;
        this.cId = cId;
        this.Rcname = Rcname;
        this.Raddress = Raddress;
        this.Rphone = Rphone;
        this.total = total;
    }

    public Order(Timestamp date, int cId, String Rcname, String Raddress, String Rphone, double total, int status) {
        this.date = date;
        this.cId = cId;
        this.Rcname = Rcname;
        this.Raddress = Raddress;
        this.Rphone = Rphone;
        this.total = total;
        this.status = status;
    }

    public String getOrderId() {
        return OrderId;
    }

    public void setOrderId(String OrderId) {
        this.OrderId = OrderId;
    }

    public Timestamp getDate() {
        return date;
    }

    public String getDateFormat() {
        Date d = new Date(date.getTime());
        return new SimpleDateFormat("dd/MM/yyyy").format(d);
    }
    
    public void setDate(Timestamp date) {
        this.date = date;
    }

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getRcname() {
        return Rcname;
    }

    public void setRcname(String Rcname) {
        this.Rcname = Rcname;
    }

    public String getRaddress() {
        return Raddress;
    }

    public void setRaddress(String Raddress) {
        this.Raddress = Raddress;
    }

    public String getRphone() {
        return Rphone;
    }

    public void setRphone(String Rphone) {
        this.Rphone = Rphone;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    public String isDone(int status) {
        if (status == 1) {
            return "Done";
        } else {
            return "Wait";
        }
    }

    @Override
    public String toString() {
        return "Order{" + "supId=" + OrderId + ", date=" + date + ", cId=" + cId + ", Rcname=" + Rcname + ", Raddress=" + Raddress + ", Rphone=" + Rphone + ", total=" + total + ", status=" + status + '}';
    }
}
