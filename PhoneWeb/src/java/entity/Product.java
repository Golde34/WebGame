/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import model.DAOProduct;
import model.DBConnection;

/**
 *
 * @author Admin
 */
public class Product {
    private String proId;
    private String proName;
    private int quantity;
    private double price;
    private String picture;
    private String description;
    private int status;
    private int supId;

    public Product() {
    }

    public Product(String proId, String proName, int quantity, double price, String picture, String description, int status, int supId) {
        this.proId = proId;
        this.proName = proName;
        this.quantity = quantity;
        this.price = price;
        this.picture = picture;
        this.description = description;
        this.status = status;
        this.supId = supId;
    }

    public Product(String proId, String proName, int quantity, double price, String picture, String description, int supId) {
        this.proId = proId;
        this.proName = proName;
        this.quantity = quantity;
        this.price = price;
        this.picture = picture;
        this.description = description;
        this.supId = supId;
    }

    public String getProId() {
        return proId;
    }

    public void setProId(String proId) {
        this.proId = proId;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
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

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getSupId() {
        return supId;
    }

    public void setSupId(int supId) {
        this.supId = supId;
    }

    public String getSupName(int supId) {
        DBConnection db = new DBConnection();
        DAOProduct dao = new DAOProduct(db);
        return dao.getManufacturer(supId);
    }
    
    public String isActive(int status) {
        if (status == 1) return "Active";
        else return "deActive";
    }
}
