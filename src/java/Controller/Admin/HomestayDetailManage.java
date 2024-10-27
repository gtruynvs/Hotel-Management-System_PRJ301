/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Admin;

import Model.HomeStayDetail;
import Ultilities.HomestayDetailDAO;
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
public class HomestayDetailManage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String homestayID = request.getParameter("homeStayID");
            HttpSession session = request.getSession();
            List<HomeStayDetail> list = HomestayDetailDAO.getHomestayMoreDetail(homestayID);
            session.setAttribute("homestayMoreDetail", list);
            request.setAttribute("homestayID", homestayID);
            request.getRequestDispatcher("managehomestaydetail.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(HomestayDetailManage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String button = request.getParameter("button");
        
        if (button.equalsIgnoreCase("delete")) {
            deleteDetail(request, response);
            response.sendRedirect("homestay-manage");
        } else if (button.equalsIgnoreCase("edit")) {
            editDetail(request, response);
            response.sendRedirect("homestay-manage");
        }
        else if (button.equalsIgnoreCase("add")) {
           
        }
    }

    private static void deleteDetail(HttpServletRequest request, HttpServletResponse response) {
        try {
            String id = request.getParameter("homestayDetailID");
            HomestayDetailDAO.deleteDetail(id);
        } catch (Exception ex) {
            Logger.getLogger(UserManage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private static void editDetail(HttpServletRequest request, HttpServletResponse response) {
        String homestayDetailID = request.getParameter("homestayDetailID");
        String acreage = request.getParameter("acreage");
        String numRoom = request.getParameter("numRoom");
        String numAdult = request.getParameter("numAdult");
        String numChild = request.getParameter("numChild");
        String capacity = request.getParameter("capacity");
        String numBeds = request.getParameter("numBeds");
        String numBathroom = request.getParameter("numBathroom");
        String price = request.getParameter("price");
        HomestayDetailDAO.updateHomestayDetails(homestayDetailID, numBeds, acreage, numRoom, numAdult, numChild, capacity, numBeds, numBathroom, price);
    }
    private static void addDetail(HttpServletRequest request, HttpServletResponse response) {
        String homestayDetailID = request.getParameter("homestayDetailID");
        String acreage = request.getParameter("acreage");
        String numRoom = request.getParameter("numRoom");
        String numAdult = request.getParameter("numAdult");
        String numChild = request.getParameter("numChild");
        String capacity = request.getParameter("capacity");
        String numBeds = request.getParameter("numBeds");
        String numBathroom = request.getParameter("numBathroom");
        String price = request.getParameter("price");
        
    }
}
