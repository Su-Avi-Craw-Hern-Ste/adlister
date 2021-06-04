package com.codeup.adlister.models;

public class Ad {               //item
    private long id;            //item id PRIMARY KEY
    private long userId;        //userId REFERENCES users(id)
    private long imageId;       //id for image REFERENCES images(id)
    private String title;       //item name
    private int value;          //item's assigned value by user
    private String rarity;      //item's rarity/condition
    private String description; //description

    public Ad(long id, long userId, long imageId, String title, int value, String rarity, String description) {
        this.id = id;
        this.userId = userId;
        this.imageId = imageId;
        this.title = title;
        this.value = value;
        this.rarity = rarity;
        this.description = description;
    }

    public Ad(long userId, String title, int value, String rarity, String description) {
        this.userId = userId;
        this.title = title;
        this.value = value;
        this.rarity = rarity;
        this.description = description;
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

    public long getImageId() { return imageId; }

    public void setImageId(long imageId) { this.imageId = imageId; }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getValue() { return value; }

    public void setValue(int value) { this.value = value; }

    public String getRarity() { return rarity; }

    public void setRarity(String rarity) { this.rarity = rarity; }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
