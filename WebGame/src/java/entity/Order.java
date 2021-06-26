/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Timestamp;

/**
 *
 * @author Duong
 */
public class Order {
    private int oId;
    private int uId;
    private Timestamp orderDate;
    private double total;
    private int status;

    public Order() {
    }

    public Order(int oId, int uId, Timestamp orderDate, double total, int status) {
        this.oId = oId;
        this.uId = uId;
        this.orderDate = orderDate;
        this.total = total;
        this.status = status;
    }

    public Order(int oId, int uId, Timestamp orderDate, double total) {
        this.oId = oId;
        this.uId = uId;
        this.orderDate = orderDate;
        this.total = total;
    }

    public int getoId() {
        return oId;
    }

    public void setoId(int oId) {
        this.oId = oId;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
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

    @Override
    public String toString() {
        return "Order{" + "oId=" + oId + ", uId=" + uId + ", orderDate=" + orderDate + ", total=" + total + ", status=" + status + '}';
    }

    
    
}
