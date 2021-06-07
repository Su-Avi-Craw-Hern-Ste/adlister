package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLCategoriesDao implements Categories {
    private Connection connection;

    public MySQLCategoriesDao(Config config) {
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
            List<String> categories = new ArrayList<>();
            String sql = "SELECT c.category FROM categories c JOIN ad_category ac ON ac.category_id = c.id JOIN ads ON ads.id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setLong(1, ad.getId());
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                categories.add(rs.getString("category"));
            }
            return categories;
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public void insertCategories(Ad ad) {
        try {
             List<String> categories = ad.getCategories();
            for (String category : categories) {
                // insert ad_id and category_id into ad_category table in db
                String sql = "INSERT INTO ad_category(ad_id, category_id) VALUES (?, (SELECT id FROM categories WHERE category = ?))";
                PreparedStatement stmt = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
                stmt.setLong(1, ad.getId());
                stmt.setString(2, category);
                stmt.executeUpdate();
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }
}
