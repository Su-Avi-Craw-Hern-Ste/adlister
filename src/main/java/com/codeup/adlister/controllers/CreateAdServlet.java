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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = (User) request.getSession().getAttribute("user");

        String[] categories = request.getParameterValues("categories");
        long[] categoryIds = new long[categories.length];
        for(int i = 0; i < categoryIds.length; i++) {
            categoryIds[i] = Long.parseLong(categories[i]);
        }

        String[] images = request.getParameterValues("images");
        List<String> imageList = Arrays.asList(images);

        Ad ad = new Ad(
            user.getId(),
            request.getParameter("title"),
            Integer.parseInt(request.getParameter("price")),
            request.getParameter("rarity"),
            request.getParameter("description")
        );
//        ad.setCategoryIds(categoryIds);

        // insert ad into ads table in db & get ad_id
        DaoFactory.getAdsDao().insert(ad);
        request.getSession().setAttribute("ad", ad);
        response.sendRedirect("/ad");
    }
}
