/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import Ultilities.UserDAO;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class LoginRegister extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login-register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String button = request.getParameter("button");
        if (button.equalsIgnoreCase("signIn")) {
            login(request, response);
        } else if (button.equalsIgnoreCase("signUp")) {
            register(request, response);
        }
    }

    private void login(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String user = request.getParameter("username");
        String pass = request.getParameter("password");
        HttpSession session = request.getSession();
        try {
            User temp = UserDAO.getUserByUserPass(user, pass);
            if (temp != null) {
                if (temp.getRole().trim().equalsIgnoreCase("admin")) {
                    session.setAttribute("admin", temp);
                    response.sendRedirect("admin-manage");
                } else {
                    session.setAttribute("user", temp);
                    response.sendRedirect("user");
                }
            } else {
                request.setAttribute("error", "Username or Password Error");
                request.getRequestDispatcher("login-register.jsp").forward(request, response);
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginRegister.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void register(HttpServletRequest request, HttpServletResponse response) {
        try {
            String user = request.getParameter("username");
            if (UserDAO.checkExistUser(user) == true) {
                request.setAttribute("error", "Username Existed");
                request.getRequestDispatcher("login-register.jsp").forward(request, response);
            } else {
                String pass = request.getParameter("password");
                String confirmpass = request.getParameter("confirmpassword");
                String email = request.getParameter("email");
                if (pass.equalsIgnoreCase(confirmpass)) {
                    try {
                        User temp = new User();
                        temp.setUserName(user);
                        temp.setEmail(email);
                        temp.setPassword(pass);
                        UserDAO.register(temp);
                        request.setAttribute("complete", "Register Successful");
                        request.getRequestDispatcher("login-register.jsp").forward(request, response);
                    } catch (SQLException ex) {
                        Logger.getLogger(LoginRegister.class.getName()).log(Level.SEVERE, null, ex);
                    }
                } else {
                    request.setAttribute("error", "Pass is not same");
                    request.getRequestDispatcher("login-register.jsp").forward(request, response);
                }
            }
        } catch (IOException ex) {
            Logger.getLogger(LoginRegister.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(LoginRegister.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
