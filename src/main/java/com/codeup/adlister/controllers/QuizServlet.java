package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLUsersDao;
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
        User user = (User)request.getSession().getAttribute("user");
        long userMoney = user.getMoney();

        user.setMoney(userMoney);

        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        if (userMoney == 2100) {
            String quizError = "You've already completed the quiz!";
            request.setAttribute("quizError", quizError);
            response.sendRedirect("/profile");
            return;
        }


        request.getRequestDispatcher("/WEB-INF/quiz.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        long userMoney = Long.parseLong(request.getParameter("user-money"));
        User user = (User)request.getSession().getAttribute("user");
        boolean quizCompleted = Boolean.parseBoolean(request.getParameter("quiz-complete"));

        if (!quizCompleted) {
            String quizError = "You've already completed the quiz!";
            request.setAttribute("quizError", quizError);
            response.sendRedirect("/profile");
            return;
        }

        userMoney += 2000;
        user.setMoney(userMoney);

        response.sendRedirect("/profile");
    }
}