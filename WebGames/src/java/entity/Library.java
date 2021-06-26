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
public class Library {
    private int uId;
    private int gId;
    private int status;

    public Library() {
    }

    public Library(int uId, int gId, int status) {
        this.uId = uId;
        this.gId = gId;
        this.status = status;
    }

    public Library(int uId, int gId) {
        this.uId = uId;
        this.gId = gId;
    }

    public int getuId() {
        return uId;
    }

    public void setuId(int uId) {
        this.uId = uId;
    }

    public int getgId() {
        return gId;
    }

    public void setgId(int gId) {
        this.gId = gId;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Library{" + "uId=" + uId + ", gId=" + gId + ", status=" + status + '}';
    }
    
}
