/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import Model.User;
import Ultilities.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class UserManage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            List<User> list = UserDAO.getAllUser();
            session.setAttribute("listUser", list);

            request.getRequestDispatcher("manageuser.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(UserManage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String button = request.getParameter("button");
        if (button.equalsIgnoreCase("delete")) {
            deleteUser(request, response);
        } else if (button.equalsIgnoreCase("edit")) {
            updateUser(request, response);
        } else if (button.equalsIgnoreCase("add")) {
            addUser(request, response);
        }
        response.sendRedirect("user-manage");
    }

    private static void deleteUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("userID"));
            boolean check = UserDAO.deleteUser(id);
        } catch (Exception ex) {
            Logger.getLogger(UserManage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void addUser(HttpServletRequest request, HttpServletResponse response) {
        try {
            String fName = request.getParameter("fName");
            String lName = request.getParameter("lName");
            String userName = request.getParameter("userName");
            String password = request.getParameter("password");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            String nationality = request.getParameter("nationality");

            User temp = new User();
            temp.setUserName(userName);
            temp.setPassword(password);
            temp.setFirstName(fName);
            temp.setLastName(lName);
            temp.setGender(gender);
            temp.setPhone(phone);
            temp.setEmail(email);
            temp.setRole(role);
            temp.setNationality(nationality);

            if (dob != null && !dob.isEmpty()) {
                try {
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                    java.util.Date parsedDate = sdf.parse(dob);
                    java.sql.Date sqlDate = new java.sql.Date(parsedDate.getTime());
                    temp.setDobDate(sqlDate);
                } catch (ParseException e) {
                    System.out.println(e);
                    return;
                }
            }

            UserDAO.addUser(temp);
        } catch (SQLException ex) {
            Logger.getLogger(UserManage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void updateUser(HttpServletRequest request, HttpServletResponse response) {
        int userID = Integer.parseInt(request.getParameter("userID"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String userName = request.getParameter("userName");
        String dobDate = request.getParameter("dobDate");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String role = request.getParameter("role");
        String nationality = request.getParameter("nationality");
        UserDAO.updateUserInfo(userID, firstName, lastName, gender, null, phone, nationality, dobDate, null);

    }
}
