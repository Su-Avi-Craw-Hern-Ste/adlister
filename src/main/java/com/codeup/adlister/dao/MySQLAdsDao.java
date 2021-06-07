package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection;

    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                config.getUrl(),
                config.getUser(),
                config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        Ad ad = new Ad(
                rs.getLong("id"),
                rs.getLong("user_id"),
                rs.getString("title"),
                rs.getInt("price"),
                rs.getString("rarity"),
                rs.getString("description")
        );
        ad.setCategories(extractCategories(ad));
        return ad;
    }

    private List<String> extractCategories(Ad ad) {
        List<String> categories = new ArrayList<>();
        try {
            String sql = "SELECT categories.category FROM categories JOIN ad_category ON ad_category.category_id = categories.id JOIN ads ON ads.id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setLong(1, ad.getId());
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                categories.add(rs.getString("category"));
            }
            return categories;
        } catch (SQLException e) {
            throw new RuntimeException("Error extracting categories.", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, title, price, rarity, description) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setInt(3, ad.getPrice());
            stmt.setString(4, ad.getRarity());
            stmt.setString(5, ad.getDescription());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            long id = rs.getLong(1);
            return id;
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }



//    @Override
//    public void addImages(Ad ad) {
//        try {
//            String insertQuery = "INSERT INTO ad_image(ad_id, category_id) VALUES (?, SELECT images.id FROM images WHERE images.image = ?)";
//            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
//            stmt.setLong(1, ad.getId());
//            List<String> images = ad.getImages();
//            for (String image : images) {
//                stmt.setString(2, image);
//                stmt.executeUpdate();
//            }
//        } catch (SQLException e) {
//            throw new RuntimeException("Error creating a new ad.", e);
//        }
//    }

//    public Long insertImage() {
//        try {
//            String insertQuery = "INSERT INTO images(image) VALUES (?)";
//            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
////            for ()
////            stmt.setLong(1, ad.getUserId());
//
//            stmt.executeUpdate();
//            ResultSet rs = stmt.getGeneratedKeys();
//            rs.next();
//            return rs.getLong(1);
//        } catch (SQLException e) {
//            throw new RuntimeException("Error creating a new ad.", e);
//        }
//    }

}
