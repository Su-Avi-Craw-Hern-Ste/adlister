package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // get a list of all the ads for one user
    List<Ad> all(User user);
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    // search ads by title
    List<Ad> search(String searchTitle);
    // filter/search ads by category
    List<Ad> filter(String category);
    // get a list of images from db
    List<String> retrieveImages(Ad ad);
    // get an ad from
    Ad getAd(long id){};
}
