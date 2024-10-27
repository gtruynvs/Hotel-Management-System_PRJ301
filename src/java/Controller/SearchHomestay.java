/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Model.HomeStay;
import Model.HomeStayDetail;
import Ultilities.HomestayDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class SearchHomestay extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nameHomestay = request.getParameter("nameHomestay");
        String checkindate = request.getParameter("checkindate");
        String checkoutdate = request.getParameter("checkoutdate");
        String adults = request.getParameter("adults");
        String children = request.getParameter("children");
        String propertytype = request.getParameter("propertytype");
        String rating = request.getParameter("rating");
        String location = request.getParameter("location");

        if (nameHomestay == null || nameHomestay.equals("")) {
            nameHomestay = null;
        }
        if (checkindate == null || checkindate.equals("")) {
            checkindate = null;
        }
        if (checkoutdate == null || checkoutdate.equals("")) {
            checkoutdate = null;
        }
        if (adults == null || adults.equals("")) {
            adults = null;
        }
        if (children == null || children.equals("")) {
            children = null;
        }
        if (propertytype == null || propertytype.equals("")) {
            propertytype = null;
        }
        if (rating == null || rating.equals("")) {
            rating = null;
        }
        if (location == null || location.equals("")) {
            location = null;
        }

        List<HomeStay> list = HomestayDAO.searchHomestay(nameHomestay, checkindate, checkoutdate, adults, children, propertytype, rating, location);

        request.setAttribute("search", list);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
