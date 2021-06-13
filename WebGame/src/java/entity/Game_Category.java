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
public class Game_Category {
    private int caId;
    private int gId;
    private boolean status;

    public Game_Category() {
    }

    public Game_Category(int caId, int gId, boolean status) {
        this.caId = caId;
        this.gId = gId;
        this.status = status;
    }

    public int getCaId() {
        return caId;
    }

    public int getgId() {
        return gId;
    }

    public boolean isStatus() {
        return status;
    }

    public void setCaId(int caId) {
        this.caId = caId;
    }

    public void setgId(int gId) {
        this.gId = gId;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }
}
