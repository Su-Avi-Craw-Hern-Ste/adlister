package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLImagesDao implements Images {
    private Connection connection;

    public MySQLImagesDao(Config config) {
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
    public List<String> all(Ad ad) {
        try {
            List<String> images = new ArrayList<>();
            // set up sql for MySQL
            String sql = "SELECT i.image FROM images i JOIN ad_image ai ON ai.image_id = i.id JOIN ads ON ads.id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setLong(1, ad.getId());
            // run sql in MySQL
            ResultSet rs = stmt.executeQuery();
            // add the images from db to images list
            while (rs.next()) {
                images.add(rs.getString("image"));
            }
            return images;
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving the images!", e);
        }
    }

    @Override
    public void insertImages(Ad ad, long adId) {

    }
}
