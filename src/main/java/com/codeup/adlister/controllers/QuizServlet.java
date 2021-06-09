package com.codeup.adlister.controllers;

import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name="controllers.QuizServlet", urlPatterns = "/quiz")
public class QuizServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/quiz.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String hadAdventure = request.getParameter("adventure");
        String adventureTime = request.getParameter("adv-time");
        String groupSize = request.getParameter("adv-group");
        String idealAdventure = request.getParameter("ideal-adventure");
        User user = new User();
        Long userMoney = user.getMoney();
    }
}