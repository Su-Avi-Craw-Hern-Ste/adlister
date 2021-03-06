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
        ad.setImages(retrieveImages(ad));
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

    // get the images for specific ad from db
    @Override
    public List<String> retrieveImages(Ad ad) {
        List<String> images = new ArrayList<>();
        try {
            String sql = "SELECT images.image FROM images JOIN ad_image ai ON ai.image_id = images.id JOIN ads ON ads.id = ai.ad_id WHERE ads.id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setLong(1, ad.getId());

            // run query in MySQL
            ResultSet rs = stmt.executeQuery();

            // add the results into images list
            while(rs.next()) {
                images.add(rs.getString("image"));
            }
            return images;
        } catch (SQLException e) {
            throw new RuntimeException("Error getting the images.", e);
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
            stmt.setLong(3, ad.getPrice());
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

    // get an ad by id
    @Override
    public Ad getAd(long id) {
        try {
            String sql = "SELECT * FROM ads WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setLong(1, id);
            // run query in db and get the results
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return extractAd(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error getting the ad.", e);
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
            rs.next();

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
            rs.next();

            // create ads list
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error getting the ads searched.", e);
        }
    }

    //Deleting an add from the card
    public void delete(long userId, long adId) {
        try {
            String insertQuery = "DELETE FROM ads WHERE id = ? AND user_id = ?";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, adId);
            stmt.setLong(2, userId);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error deleting product #" + adId, e);
        }
    }

    @Override
    public Ad edit(long userId, long adId, String title, long price, String rarity, String description, List<String> categories) {
        try {
            // set up sql for MySQL to update data in ads
            String sql = "UPDATE ads SET title = ?, price = ?, rarity = ?, description = ? WHERE id = ?";
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, title);
            stmt.setLong(2, price);
            stmt.setString(3, rarity);
            stmt.setString(4, description);
            stmt.setLong(5, adId);

            // run sql in MySQL to update ads table
            stmt.executeUpdate();

            // update title, price, rarity and description
            Ad ad = new Ad (
                    adId,
                    userId,
                    title,
                    price,
                    rarity,
                    description
                    );

            // update categories
            ad.setCategories(editCategories(adId, categories));

            return ad;
        } catch (SQLException e) {
            throw new RuntimeException("Error updating ad #" + adId, e);
        }
    }

    // update category_id in ad_category in db
    public List<String> editCategories(long adId, List<String> categories) {
        try {
            List<String> newCategories = new ArrayList<>();
            for (String category : categories) {
                String query = "UPDATE ad_category SET category_id = (SELECT c.id FROM categories c WHERE c.category = ?) WHERE ad_id = ?";
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, category);
                statement.setLong(2, adId);
                int number = statement.executeUpdate();
                if (number == 1) {
                    newCategories.add(category);
                }
            }
            return newCategories;
        } catch (SQLException e) {
            throw new RuntimeException("Error updating categories on ad #" + adId, e);
        }
    }

}
