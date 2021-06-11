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
public class Customer {
    private int cId;
    private String cName;
    private String address;
    private String phone;
    private String username;
    private String password;
    private int status;

    public Customer() {
    }

    public Customer(int cId, String cName, String address, String phone, String username, String password, int status) {
        this.cId = cId;
        this.cName = cName;
        this.address = address;
        this.phone = phone;
        this.username = username;
        this.password = password;
        this.status = status;
    }

    public Customer(String cName, String address, String phone, String username, String password, int status) {
        this.cName = cName;
        this.address = address;
        this.phone = phone;
        this.username = username;
        this.password = password;
        this.status = status;
    }

    public Customer(String cName, String address, String phone, String username, String password) {
        this.cName = cName;
        this.address = address;
        this.phone = phone;
        this.username = username;
        this.password = password;
    }

    

    public int getcId() {
        return cId;
    }

    public void setcId(int cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    public String isActive(int status) {
        if (status == 1) return "Active";
        else return "deActive";
    }

    @Override
    public String toString() {
        return "Customer{" + "cId=" + cId + ", cName=" + cName + ", address=" + address + ", phone=" + phone + ", username=" + username + ", password=" + password + ", status=" + status + '}';
    }
}
