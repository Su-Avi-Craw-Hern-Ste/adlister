package com.codeup.adlister.models;

import java.util.List;

public class Ad {
    private long id;            //item id PRIMARY KEY
    private long userId;        //userId REFERENCES users(id)
    private String title;       //item name
    private int price;          //item's assigned price by user
    private String rarity;      //item's rarity/condition
    private String description;
    private List<String> categories;
    private List<String> images;

    public Ad(long userId, String title, int price, String rarity, String description) {
        this.userId = userId;
        this.title = title;
        this.price = price;
        this.rarity = rarity;
        this.description = description;
    }

    public Ad(long userId, String title, int price, String rarity, String description, List<String> categories, List<String> images) {
        this.userId = userId;
        this.title = title;
        this.price = price;
        this.rarity = rarity;
        this.description = description;
        setCategories(categories);
        setImages(images);
    }

    public Ad(long id, long userId, String title, int price, String rarity, String description, List<String> categories, List<String> images) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.price = price;
        this.rarity = rarity;
        this.description = description;
        this.categories = categories;
        this.images = images;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getPrice() { return price; }

    public void setPrice(int price) { this.price = price; }

    public String getRarity() { return rarity; }

    public void setRarity(String rarity) { this.rarity = rarity; }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<String> getCategories() {
        return categories;
    }

    public void setCategories(List<String> categories) {
        this.categories = categories;
    }

    public List<String> getImages() {
        return images;
    }

    public void setImages(List<String> images) {
        this.images = images;
    }

}
