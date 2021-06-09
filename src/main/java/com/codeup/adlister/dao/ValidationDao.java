package com.codeup.adlister.dao;

import com.mysql.cj.jdbc.Driver;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ValidationDao {
    private boolean validation;
    private Connection connection;

    public ValidationDao(Config config) {
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

    public boolean usernameHasError(String username) {
        boolean inputHasErrors = username.isEmpty()
                || username.contains("@") || username.contains("#")
                || username.contains("!") || username.contains("~")
                || username.contains("$") || username.contains("%")
                || username.contains("^") || username.contains("&")
                || username.contains("*") || username.contains("(")
                || username.contains(")") || username.contains("-")
                || username.contains("+") || username.contains("/")
                || username.contains(":") || username.contains(".")
                || username.contains(", ") || username.contains("<")
                || username.contains(">") || username.contains("?")
                || username.contains("|");
        return inputHasErrors;
    }


    public boolean emailHasError(String email) {
        return email.isEmpty() || (!email.contains("@"));
    }


    public boolean passwordHasError(String password) {
        boolean inputHasError = password.isEmpty() || (password.length()<=8)
                || (!(password.contains("@") || password.contains("#")
                || password.contains("!") || password.contains("~")
                || password.contains("$") || password.contains("%")
                || password.contains("^") || password.contains("&")
                || password.contains("*") || password.contains("(")
                || password.contains(")") || password.contains("-")
                || password.contains("+") || password.contains("/")
                || password.contains(":") || password.contains(".")
                || password.contains(", ") || password.contains("<")
                || password.contains(">") || password.contains("?")
                || password.contains("|")));

        return inputHasError;
    }


//    public boolean isPasswordConfirmed(String password, String passwordConfirmation) {
//        return password.equals(passwordConfirmation);
//    }
}
