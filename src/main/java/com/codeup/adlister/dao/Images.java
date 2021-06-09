package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Images {
    // get a list of all the image urls from db related to the ad
    List<String> all(Ad ad);
    // add images to ad
    void insertImages(long adId, List<String> urls);
}
