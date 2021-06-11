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
public class Supplier {
    private int supId;
    private String supName;
    private String website;
    private int status;

    public Supplier() {
    }

    public Supplier(int supId, String supName, String website, int status) {
        this.supId = supId;
        this.supName = supName;
        this.website = website;
        this.status = status;
    }

    public Supplier(String supName, String website) {
        this.supName = supName;
        this.website = website;
    }

    public Supplier(int supId, String supName, String website) {
        this.supId = supId;
        this.supName = supName;
        this.website = website;
    }

    public Supplier(String supName, String website, int status) {
        this.supName = supName;
        this.website = website;
        this.status = status;
    }

    public int getSupId() {
        return supId;
    }

    public void setSupId(int supId) {
        this.supId = supId;
    }

    public String getSupName() {
        return supName;
    }

    public void setSupName(String supName) {
        this.supName = supName;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    
}
