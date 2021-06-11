/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

/**
 *
 * @author Admin
 */
public class OrderDetail {
    private String OrderId;
    private String proId;
    private int quantity;
    private double price;
    private String proName;

    public OrderDetail() {
    }

    public OrderDetail(String OrderId, String proId, int quantity, double price, String proName) {
        this.OrderId = OrderId;
        this.proId = proId;
        this.quantity = quantity;
        this.price = price;
        this.proName = proName;
    }

    public OrderDetail(String OrderId, String proId, int quantity, double price) {
        this.OrderId = OrderId;
        this.proId = proId;
        this.quantity = quantity;
        this.price = price;
    }

    public String getOrderId() {
        return OrderId;
    }

    public void setOrderId(String OrderId) {
        this.OrderId = OrderId;
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }
}
