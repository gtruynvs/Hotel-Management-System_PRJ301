/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import Model.HomeStay;
import Ultilities.HomestayDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class HomestayManage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            List<HomeStay> list = HomestayDAO.getAllHomeStay();
            session.setAttribute("listHomeStay", list);
            request.getRequestDispatcher("managehomestay.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(HomestayManage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String button = request.getParameter("button");
        if (button.equalsIgnoreCase("delete")) {
            deleteHomestay(request, response);
        } else if (button.equalsIgnoreCase("edit")) {
            updateHomestay(request, response);
        } else if (button.equalsIgnoreCase("add")) {
            addHomestay(request, response);
        }
        response.sendRedirect("homestay-manage");
    }

    private static void deleteHomestay(HttpServletRequest request, HttpServletResponse response) {
        try {
            String id = request.getParameter("homeStayID");
            HomestayDAO.deleteHomestay(id);
        } catch (Exception ex) {
            Logger.getLogger(UserManage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void updateHomestay(HttpServletRequest request, HttpServletResponse response) {
        try {
            String homeStayID = request.getParameter("homeStayID");
            String homeStayName = request.getParameter("homeStayName");
            String homeStayType = request.getParameter("homeStayType");
            String location = request.getParameter("location");
            String description = request.getParameter("description");
            String contactNumber = request.getParameter("contactNumber");
            String homeStayImg = request.getParameter("homeStayImg");
            String feedback = request.getParameter("feedback");
            HomestayDAO.updateHomestayInfo(homeStayID, homeStayName, homeStayType, location, description, contactNumber, homeStayImg, feedback);
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    private static void addHomestay(HttpServletRequest request, HttpServletResponse response) {
        try {
            String homeStayName = request.getParameter("homeStayName");
            String homeStayType = request.getParameter("homeStayType");
            String location = request.getParameter("location");
            String description = request.getParameter("description");
            String contactNumber = request.getParameter("contactNumber");
            String homeStayImg = request.getParameter("homeStayImg");
            String feedback = request.getParameter("feedback");
            HomeStay temp = new HomeStay();
            temp.setHomeStayName(homeStayName);
            temp.setHomeStayType(homeStayType);
            temp.setHomeStayLocation(location);
            temp.setHomeStayImg(homeStayImg);
            temp.setHomeStayFeedback(feedback);
            temp.setHomeStayContactNumber(contactNumber);
            temp.setHomeStayDescription(description);
            HomestayDAO.addHomestay(temp);
        } catch (SQLException ex) {
            Logger.getLogger(HomestayManage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
