package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.http.HttpHeaders;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String referer = request.getHeader("referer");
        User user = DaoFactory.getUsersDao().findByUsername(username);

        // if user hasn't logged in, redirect to /login page
        if (user == null) {
            response.sendRedirect("/login");
            return;
        }

        // check is password matches the password in db
        boolean validAttempt = Password.check(password, user.getPassword());

        if (validAttempt) {
            request.getSession().setAttribute("user", user);

            // check if the user has submitted all info to db
            boolean isProfileCreated = user.getPhoneNumber() != null && user.getRole() != null;

            if (isProfileCreated && referer != null) { // phoneNumber and role are not null in db
                response.sendRedirect("/profile");
            } else {
                response.sendRedirect("/profile/create");
            }
        } else {
            response.sendRedirect("/login");
        }
    }
}
