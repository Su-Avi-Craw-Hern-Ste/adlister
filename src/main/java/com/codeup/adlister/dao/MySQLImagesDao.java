package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
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
    public void insertImages(long adId, List<String> urls) {
        try {
            String sql = "INSERT INTO images(image) VALUES (?)";
            PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            for (String url : urls) {
                System.out.println(url);
                stmt.setString(1, url);
                System.out.println(stmt);

                // run query in db and get the results
                stmt.executeUpdate();
                ResultSet rs = stmt.getGeneratedKeys();
                rs.next();
                long id = rs.getLong(1);
                insertImageIds(adId, id);
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error inserting the images!", e);
        }
    }

    public void insertImageIds(long adId, long imageId) {
        try {
            String sql = "INSERT INTO ad_image(ad_id, image_id) VALUES (?, ?)";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setLong(1, adId);
            stmt.setLong(2, imageId);

            // run sql to store image_id into ad_image table
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error inserting the image ids!", e);
        }
    }
}
