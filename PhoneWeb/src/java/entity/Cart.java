/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class Cart {
    HashMap<String, Item> cartList;

    public Cart() {
        cartList = new HashMap<>();
    }

    public Cart(HashMap<String, Item> cartList) {
        this.cartList = cartList;
    }

    public HashMap<String, Item> getCartList() {
        return cartList;
    }

    public void setCartList(HashMap<String, Item> cartList) {
        this.cartList = cartList;
    }
    
    public void plusToCart(String key, Item item, int amountPlus) {
        boolean check = cartList.containsKey(key);
        if (check) {
            int amount_old = item.getAmount();
            item.setAmount(amount_old + amountPlus);
            cartList.put(key, item);
        } else {
            cartList.put(key, item);
        }
    }
    
    public void subToCart(String key, Item item, int amountSub) {
        boolean check = cartList.containsKey(key);
        if (check) {
            int amount_old = item.getAmount();
            if (amount_old <= amountSub) {
                cartList.remove(key);
            } else {
                item.setAmount(amount_old - amountSub);
                cartList.put(key, item);
            }
        } else {
            cartList.put(key, item);
        }
    }
    
    public void removeToCart(String key) {
        boolean check = cartList.containsKey(key);
        if (check) {
            cartList.remove(key);
        }
    }
    
    public void removeAll () {
        cartList = new HashMap<>();
    }
    
    public int countItem() {
        return cartList.size();
    }
    
    public double totalMoney() {
        double total = 0;
        for (Map.Entry<String, Item> list : cartList.entrySet()) {
            total+= list.getValue().getPro().getPrice() + list.getValue().getAmount();
        }
        return total;
    }
    
    public void updateAmount(String id, int amount) {
        cartList.get(id).setAmount(amount);
    }
}
