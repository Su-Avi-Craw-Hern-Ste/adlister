package com.codeup.adlister.dao;

import com.mysql.cj.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class QuizDao {
    private boolean isAnswered = false;
    private Connection connection;

    public QuizDao(Config config) {
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

    //TODO: check for questions answered, if questions are answered add money to user's total money
    //TODO: style quiz page
    //TODO: make sure money attribute is properly updated

//    public boolean questionAnswered(String question) {
//        if (question.length() == 0) {
//
//        }
//    }

}
