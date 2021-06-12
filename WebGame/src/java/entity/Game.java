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
public class Game {
    private int gid;
    private String title;
    private int coID;
    private String description;
    private String version;
    private Date releaseDate;
    private double price;
    private String state;
    private boolean status;

    public Game(int gid, String title, int coID, String description, String version, Date releaseDate, double price, String state,boolean  status) {
        this.gid = gid;
        this.title = title;
        this.coID = coID;
        this.description = description;
        this.version = version;
        this.releaseDate = releaseDate;
        this.price = price;
        this.state = state;
        this.status = status;
    }

    public Game() {
    }

    public int getGid() {
        return gid;
    }

    public String getTitle() {
        return title;
    }

    public int getCoID() {
        return coID;
    }

    public String getDescription() {
        return description;
    }

    public String getVersion() {
        return version;
    }

    public Date getDate() {
        return releaseDate;
    }

    public double getPrice() {
        return price;
    }

    public String getState() {
        return state;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setCoID(int coID) {
        this.coID = coID;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public void setDate(Date date) {
        this.releaseDate = date;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public void setState(String state) {
        this.state = state;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
