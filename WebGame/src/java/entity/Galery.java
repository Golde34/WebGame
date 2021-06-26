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
public class Galery {
    private int gId;
    private String link;
    private String type;
    private boolean status;

    public Galery() {
    }

    public Galery(int gId, String link, String type, boolean status) {
        this.gId = gId;
        this.link = link;
        this.type = type;
        this.status = status;
    }

    public int getgId() {
        return gId;
    }

    public String getLink() {
        return link;
    }

    public String getType() {
        return type;
    }

    public boolean isStatus() {
        return status;
    }

    public void setgId(int gId) {
        this.gId = gId;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
