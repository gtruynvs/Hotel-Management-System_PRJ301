/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Model.Payment;
import Ultilities.BookingDAO;
import Ultilities.PaymentDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Administrator
 */
public class Pay extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       response.sendRedirect("payment.jsp");
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        try {
            if(request.getParameter("button").equalsIgnoreCase("cancel")){
               BookingDAO.deleteBooking(request.getParameter("bookingID"));
               response.sendRedirect("search");
            }
            String bookingID = request.getParameter("bookingID");
            int finalAmount = Integer.parseInt(request.getParameter("finalAmount").replace(",", ""));
            java.util.Date paymentDate = new java.util.Date();
            String payment = request.getParameter("payment");
            Payment temp = new Payment();
            temp.setBookingID(bookingID);
            temp.setPaymentMethod(payment);
            temp.setAmount(finalAmount);
            temp.setPaymentDate(paymentDate);
            PaymentDAO.savePayment(temp);
            BookingDAO.updateBooking(bookingID);
            response.sendRedirect("profile");
        } catch (SQLException ex) {
            Logger.getLogger(Pay.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(Pay.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
