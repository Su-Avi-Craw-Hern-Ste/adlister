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
import java.sql.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set response content type
        response.setContentType("text/html");

        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp")
            .forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User user = (User) request.getSession().getAttribute("user");
        // convert the urls inside hidden input into a list of url
        List<String> urls = new ArrayList<>(Arrays.asList(request.getParameter("images").split(", ")));

        Ad ad = new Ad(
            user.getId(),
            request.getParameter("title"),
            Integer.parseInt(request.getParameter("price")),
            request.getParameter("rarity"),
            request.getParameter("description"),
            Arrays.asList(request.getParameterValues("categories"))
        );

        // insert ad into ads table and categories to ad_category table in db
        long adId = DaoFactory.getAdsDao().insert(ad);
        DaoFactory.getCategoriesDao().insertCategories(ad, adId);
        DaoFactory.getImagesDao().insertImages(adId, urls);
        request.getSession().setAttribute("ad", ad);
        response.sendRedirect("/ad");
    }
}
