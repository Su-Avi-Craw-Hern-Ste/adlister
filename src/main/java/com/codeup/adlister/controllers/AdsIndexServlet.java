package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
        request.getRequestDispatcher("/WEB-INF/ads/ads.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest  request, HttpServletResponse response) throws ServletException, IOException {
        if (!request.getParameter("search").isEmpty()) {
            String searchTitle = request.getParameter("search");
            request.setAttribute("searchTitle", searchTitle);
            List<Ad> ads = DaoFactory.getAdsDao().search(searchTitle);
            request.setAttribute("ads", ads);
            request.getRequestDispatcher("/WEB-INF/ads/ads.jsp").forward(request, response);
        } else {
            response.sendRedirect("/ads");
        }
    }
}
