package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "EditAdServlet", urlPatterns = "/ad/edit")
public class EditAdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long id = Long.parseLong(request.getParameter("ad_id"));
        Ad ad = DaoFactory.getAdsDao().getAd(id);
        request.setAttribute("ad", ad);

        // get the username who has created the ad
        String username = DaoFactory.getUsersDao().getUsernameByAdId(id);

        User userLogin = (User) request.getSession().getAttribute("user");
        if (username.equals(userLogin.getUsername())) {
            request.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(request, response);
        } else {
            response.sendRedirect("/login");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        long id = Long.parseLong(request.getParameter("id"));
        String title = request.getParameter("title");
        long price = Long.parseLong(request.getParameter("price"));
        String rarity = request.getParameter("rarity");
        String description = request.getParameter("description");
        List<String> categories = Arrays.asList(request.getParameterValues("categories"));

        Ad ad = DaoFactory.getAdsDao().edit(user.getId(), id, title, price, rarity, description, categories);
        request.setAttribute("ad", ad);
        request.getRequestDispatcher("/WEB-INF/ads/adIndex.jsp").forward(request, response);
    }
}
