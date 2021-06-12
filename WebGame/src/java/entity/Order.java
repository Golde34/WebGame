/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Duong
 */
public class Order {
    private int oId;
    private int uId;
    private double total;
    private int status;

    public Order() {
    }

    public Order(int oId, int uId, double total, int status) {
        this.oId = oId;
        this.uId = uId;
        this.total = total;
        this.status = status;
    }

    public Order(int oId, int uId, double total) {
        this.oId = oId;
        this.uId = uId;
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
        return "Order{" + "oId=" + oId + ", uId=" + uId + ", total=" + total + ", status=" + status + '}';
    }
    
}
