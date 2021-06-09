package com.codeup.adlister.models;

import com.codeup.adlister.util.Password;

public class User {
    private long id;
    private String username;
    private String email;
    private String password;
    private long money;
    private String role;
    private String image;
    private String phoneNumber;

    public User() {}

    public User(String username, String email, String password) {
        this.username = username;
        this.email = email;
        setPassword(password);
    }

    public User (long id, String username, String email, String password, long money) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.money = money;
    }

    public User (long id, String username, String email, String password, long money, String role, String image, String phoneNumber) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.money = money;
        this.role = role;
        this.image = image;
        this.phoneNumber = phoneNumber;
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

    public String getImage() { return image; }

    public void setImage(String image) { this.image = image; }

    public String getPhoneNumber() { return phoneNumber; }

    public void setPhoneNumber(String phoneNumber) { this.phoneNumber = phoneNumber; }
}
