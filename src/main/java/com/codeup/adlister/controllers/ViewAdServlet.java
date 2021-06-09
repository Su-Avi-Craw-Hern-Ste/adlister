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

@WebServlet(name = "controllers.ViewAdServlet", urlPatterns = "/ad")
public class ViewAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // check if the user is logged in first
        User user = (User) request.getSession().getAttribute("user");
        if(user == null){
            long id = Long.parseLong(request.getParameter("id"));
            Ad ad = DaoFactory.getAdsDao().getAd(id);
            request.setAttribute("ad", ad);
            System.out.println(ad.getTitle());
        }

        request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);
    }
}
