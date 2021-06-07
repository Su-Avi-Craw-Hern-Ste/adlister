package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Categories {
    // get a list of all the categories
    List<String> all(Ad ad);
    // add categories to ad
    void insertCategories(Ad ad, long adId);
}
