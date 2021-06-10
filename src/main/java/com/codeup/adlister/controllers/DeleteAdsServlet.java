package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(urlPatterns = "/ads/delete")
public class DeleteAdsServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // check if the user is logged in first
        User user = (User) req.getSession().getAttribute("user");
        if(user == null){
            resp.sendRedirect("/login");
        }
        Long id = Long.parseLong(req.getParameter("ad_id"));
        DaoFactory.getAdsDao().delete(user.getId(), id);
        resp.sendRedirect("/ads");
    }
}