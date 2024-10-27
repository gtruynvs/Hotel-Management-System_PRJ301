/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller.Admin;

import Model.Booking;
import Ultilities.BookingDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
public class BookingManage extends HttpServlet {
 
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            List<Booking> list = BookingDAO.getAllBooking();
            session.setAttribute("listBooking", list);
            request.getRequestDispatcher("manageorder.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(BookingManage.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String button = request.getParameter("button");
        if (button.equalsIgnoreCase("delete")) {
            deleteBooking(request, response);
        } else if (button.equalsIgnoreCase("confirm")) {
            confirmTask(request, response);
        }
        response.sendRedirect("booking-manage");
    }

    private static void confirmTask(HttpServletRequest request, HttpServletResponse response){
        String id = request.getParameter("bookingID");
        BookingDAO.updateBooking(id);
    }
    private static void deleteBooking(HttpServletRequest request, HttpServletResponse response){
        try {
            String id = request.getParameter("bookingID");
            BookingDAO.deleteBooking(id);
        } catch (Exception ex) {
            Logger.getLogger(BookingManage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
