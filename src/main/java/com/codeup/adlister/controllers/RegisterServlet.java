package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.dao.ValidationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        // call methods in ValidationDao
        if (DaoFactory.getValidationDao().usernameHasError(username)) {
            //Username error message
            String usernameError = "Username must be unique, less than 20 letters, can include numbers, and contain no special characters";
            request.getSession().setAttribute("usernameError", usernameError);
        }


        if (DaoFactory.getValidationDao().emailHasError(email)){
            //Email error
            String emailError = "input correct email format";
            request.getSession().setAttribute("emailError", emailError);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }

        if (DaoFactory.getValidationDao().passwordHasError(password)) {
            // password error message
            String passwordError = "Password should be at least 8 digits long and must contain special characters";
            request.setAttribute("passwordError", passwordError);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }

        if (DaoFactory.getValidationDao().isPasswordConfirmed(password,passwordConfirmation)) {
            // green check
            String passwordMatchError = "Password does not match!";
            request.setAttribute("confirmPass", passwordMatchError);
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }


        // create and save a new user
        User user = new User(username, email, password);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }
}
