package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "CreateProfileServlet", urlPatterns = "/profile/create")
public class CreateProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/createProfile.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        String imageUrl = request.getParameter("image");
        System.out.println(imageUrl);

        user.setPhoneNumber(request.getParameter("phoneNumber"));
        user.setImage(request.getParameter("image"));
        user.setRole(request.getParameter("role"));

        DaoFactory.getUsersDao().addInfo(user);
        response.sendRedirect("/profile");
    }

}
