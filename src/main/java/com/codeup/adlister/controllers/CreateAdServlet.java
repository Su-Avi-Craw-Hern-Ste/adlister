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
        List<String> categoryList = Arrays.asList(categories);

        String[] images = request.getParameterValues("images");
        List<String> imageList = Arrays.asList(images);

        Ad ad = new Ad(
            user.getId(),
            request.getParameter("title"),
            Integer.parseInt(request.getParameter("price")),
            request.getParameter("rarity"),
            request.getParameter("description")
        );
        long adId = DaoFactory.getAdsDao().insert(ad);
        request.setAttribute("ad", ad);
        request.setAttribute("categories", categoryList);
        request.setAttribute("images", imageList);
        request.getRequestDispatcher("/WEB-INF/ads/ad")
                .forward(request, response);
    }
}
