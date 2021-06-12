/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;
import java.sql.Timestamp;

/**
 *
 * @author Duong
 */
public class Order_Detail {
    private int oId;
    private int gId;
    private Timestamp orderDate;
    private double price;
    private int status;

    public Order_Detail() {
    }

    public Order_Detail(int oId, int gId, Timestamp orderDate, double price, int status) {
        this.oId = oId;
        this.gId = gId;
        this.orderDate = orderDate;
        this.price = price;
        this.status = status;
    }

    public Order_Detail(int oId, int gId, Timestamp orderDate, double price) {
        this.oId = oId;
        this.gId = gId;
        this.orderDate = orderDate;
        this.price = price;
    }

    public int getoId() {
        return oId;
    }

    public void setoId(int oId) {
        this.oId = oId;
    }

    public int getgId() {
        return gId;
    }

    public void setgId(int gId) {
        this.gId = gId;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Order_Detail{" + "oId=" + oId + ", gId=" + gId + ", orderDate=" + orderDate + ", price=" + price + ", status=" + status + '}';
    }
    
}
