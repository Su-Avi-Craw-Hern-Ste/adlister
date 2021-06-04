package com.codeup.adlister.models;

import com.codeup.adlister.util.Password;

public class User {
    private long id;
    private String username;
    private String email;
    private String password;
    private long money;
    private String role;
    private String img;
    private String phone;

    public User() {}

//    public User(String role, String img, String phone) {
//        this.role = role;
//        this.img = img;
//        this.phone = phone;
//    }

    public User(String username, String email, String password) {
        this.username = username;
        this.email = email;
        setPassword(password);
    }

    public User (long id, String username, String email, String password, long money, String role, String img, String phone) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.money = money;
        this.role = role;
        this.img = img;
        this.phone = phone;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = Password.hash(password);
    }

    public long getMoney() { return money; }

    public void setMoney(long money) { this.money = money; }

    public String getRole() { return role; }

    public void setRole(String role) { this.role = role; }

    public String getImg() { return img; }

    public void setImg(String img) { this.img = img; }

    public String getPhone() { return phone; }

    public void setPhone(String phone) { this.phone = phone; }
}
