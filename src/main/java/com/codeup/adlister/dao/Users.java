package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;

import java.util.List;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);
    void addInfo(User user);
    // get username by given ad id
    String getUsernameByAdId(long adId);
}
