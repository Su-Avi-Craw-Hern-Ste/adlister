package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
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

    // get a list of all the ads
    @Override
    public List<Ad> all() {
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    // get a list of all the ads for one user
    @Override
    public List<Ad> all(User user) {
        try {
            PreparedStatement stmt = connection.prepareStatement("SELECT * FROM ads WHERE user_id = ?");
            stmt.setLong(1, user.getId());
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
            // set up sql to get categories by given ad
            String sql = "SELECT c.category FROM categories c JOIN ad_category ac ON ac.category_id = c.id JOIN ads ON ads.id = ac.ad_id WHERE ads.id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setLong(1, ad.getId());

            // run sql in MySQL and get the results
            ResultSet rs = stmt.executeQuery();

            // add the results into categories list
            while (rs.next()) {
                categories.add(rs.getString("category"));
            }
            return categories;
        } catch (SQLException e) {
            throw new RuntimeException("Error extracting categories.", e);
        }
    }

    // insert a new ad and return the new ad's id
    @Override
    public Long insert(Ad ad) {
        try {
            // set up the query will run in MySQL
            String insertQuery = "INSERT INTO ads(user_id, title, price, rarity, description) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setInt(3, ad.getPrice());
            stmt.setString(4, ad.getRarity());
            stmt.setString(5, ad.getDescription());

            // run query in db and get the results
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            long id = rs.getLong(1);
            return id;
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    // search ads by title
    @Override
    public List<Ad> search(String searchTitle) {
        try {
            // set up the query for MySQL
            String sql = "SELECT * FROM ads WHERE title LIKE ?";
            String searchTermWithWildcards = "%" + searchTitle + "%";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, searchTermWithWildcards);

            // run query in MySQL
            ResultSet rs = stmt.executeQuery();

            // create ads list
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error getting the ads searched.", e);
        }
    }

    // filter/search ads by category
    @Override
    public List<Ad> filter(String category) {
        try {
            String sql = "SELECT * FROM ads JOIN ad_category ac ON ac.ad_id = ads.id JOIN categories c ON c.id = ac.category_id WHERE c.category = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, category);

            // run query in MySQL
            ResultSet rs = stmt.executeQuery();

            // create ads list
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error getting the ads searched.", e);
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
