/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import Model.Booking;
import Model.User;
import Ultilities.BookingDAO;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author Administrator
 */
public class BookingHomestay extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String img = request.getParameter("image");
        String price = request.getParameter("price");
        String name = request.getParameter("name");
        String roomtype = request.getParameter("roomtype");
        String acreage = request.getParameter("acreage");
        String numRoom = request.getParameter("numRoom");
        String numAdult = request.getParameter("numAdult");
        String numChild = request.getParameter("numChild");
        String capacity = request.getParameter("capacity");
        String numBed = request.getParameter("numBed");
        String numBath = request.getParameter("numBath");
        String homestayID = request.getParameter("homestayID");

        HttpSession session = request.getSession();

        session.setAttribute("image", img);
        session.setAttribute("price", price);
        session.setAttribute("name", name);
        session.setAttribute("roomtype", roomtype);
        session.setAttribute("acreage", acreage);
        session.setAttribute("numRoom", numRoom);
        session.setAttribute("numAdult", numAdult);
        session.setAttribute("numChild", numChild);
        session.setAttribute("capacity", capacity);
        session.setAttribute("numBed", numBed);
        session.setAttribute("numBath", numBath);
        session.setAttribute("homestayID", homestayID);
        request.getRequestDispatcher("bookingdetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            //
            String checkin = request.getParameter("checkin");
            String checkout = request.getParameter("checkout");
            String homestayID = request.getParameter("homestayID");
            List<Booking> existBooking = BookingDAO.getBookingsByHomestayID(homestayID);
            boolean dateConflict = existBooking.stream().anyMatch(booking
                    -> (checkin.equals(booking.getCheckInDate().toString()) || checkout.equals(booking.getCheckOutDate().toString()))
            );
            if (dateConflict) {
                request.setAttribute("error", "Booking dates are already taken. Please choose different dates.");
                request.getRequestDispatcher("bookingdetails.jsp").forward(request, response);
            } else {
                String numDays = request.getParameter("numDays");
                int totalAmount = Integer.parseInt(request.getParameter("totalAmount").replace(",", ""));
                int finalAmount = (totalAmount * 110) / 100;
                //
                String stayName = request.getParameter("stayName");
                String email = request.getParameter("email");
                String roomType = request.getParameter("roomType");
                String acreage = request.getParameter("acreage");
                String numRoom = request.getParameter("numRoom");
                String numAdult = request.getParameter("numAdult");
                String numChild = request.getParameter("numChild");
                String capacity = request.getParameter("capacity");
                String numBed = request.getParameter("numBed");
                String numBath = request.getParameter("numBath");
                //
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date CheckIn = sdf.parse(checkin);
                java.util.Date CheckOut = sdf.parse(checkout);
                java.util.Date now = new java.util.Date();
                //
                NumberFormat numberFormat = NumberFormat.getNumberInstance(Locale.US);
                HttpSession session = request.getSession();
                User test = (User) session.getAttribute("user");
                Booking temp = new Booking();
                temp.setUserID(test.getUserID());
                temp.setCheckInDate(CheckIn);
                temp.setCheckOutDate(CheckOut);
                temp.setOrderDate(now);
                temp.setHomestayID(homestayID);
                temp.setStatus("Pending");
                BookingDAO.addBooking(temp);
                //
                request.setAttribute("checkin", checkin);
                request.setAttribute("checkout", checkout);
                request.setAttribute("bookingID", BookingDAO.getLastBookingID());
                request.setAttribute("stayName", stayName);
                request.setAttribute("roomType", roomType);
                request.setAttribute("acreage", acreage);
                request.setAttribute("numRoom", numRoom);
                request.setAttribute("numAdult", numAdult);
                request.setAttribute("numChild", numChild);
                request.setAttribute("capacity", capacity);
                request.setAttribute("numBed", numBed);
                request.setAttribute("numBath", numBath);
                request.setAttribute("email", email);
                request.setAttribute("totalAmount", numberFormat.format(totalAmount));
                request.setAttribute("finalAmount", numberFormat.format(finalAmount));
                request.getRequestDispatcher("payment.jsp").forward(request, response);
            }
        } catch (ParseException ex) {
            Logger.getLogger(BookingHomestay.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(BookingHomestay.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(BookingHomestay.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
