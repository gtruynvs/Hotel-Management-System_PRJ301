/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ultilities;

import Model.Booking;
import static Ultilities.DB.DBURL;
import static Ultilities.DB.DRIVERNAME;
import static Ultilities.DB.PASSDB;
import static Ultilities.DB.USERDB;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class BookingDAO implements DB {

    public static Connection getConnect() {
        try {
            Class.forName(DRIVERNAME);
        } catch (ClassNotFoundException e) {
            System.out.println("Error loading driver" + e);
        }
        try {
            Connection con = DriverManager.getConnection(DBURL, USERDB, PASSDB);
            return con;
        } catch (SQLException e) {
            System.out.println("Error: " + e);
        }
        return null;
    }
//---------------------------------------------------------------------------------------------------    

    public static List<Booking> getAllBooking() throws SQLException {
        try (Connection con = getConnect()) {
            List<Booking> list = new ArrayList<>();
            String sql = "SELECT * FROM Booking";
            try (PreparedStatement statement = con.prepareStatement(sql)) {
                ResultSet rs = statement.executeQuery();
                while (rs.next()) {
                    Booking temp = new Booking();
                    temp.setBookingID(rs.getString("BookingID"));
                    temp.setUserID(rs.getInt("UserID"));
                    temp.setHomestayID(rs.getString("HomestayID"));
                    temp.setOrderDate(rs.getDate("OrderDate"));
                    temp.setCheckInDate(rs.getDate("CheckInDate"));
                    temp.setCheckOutDate(rs.getDate("CheckOutDate"));
                    temp.setStatus(rs.getString("Status"));

                    list.add(temp);
                }
                rs.close();
            }
            return list;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
//---------------------------------------------------------------------------------------------------    

    public static String getLastBookingID() throws SQLException {
        try (Connection con = getConnect()) {
            String bookingID = "";
            String sql = "SELECT MAX(BookingID) FROM Booking";
            try (PreparedStatement statement = con.prepareStatement(sql)) {
                ResultSet rs = statement.executeQuery();
                if (rs.next()) {
                    bookingID = rs.getString(1);
                }
                rs.close();
            }
            return bookingID;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
//---------------------------------------------------------------------------------------------------

    public static boolean addBooking(Booking temp) throws SQLException {
        try (Connection con = getConnect()) {

            String sql1 = "SELECT MAX(BookingID) FROM Booking";
            PreparedStatement statement1 = con.prepareStatement(sql1);
            ResultSet rs1 = statement1.executeQuery();
            int maxUserID = 0;
            String bookingID = "";
            if (rs1.next()) {
                maxUserID = Integer.parseInt(rs1.getString(1).split("B")[1]);
            }
            maxUserID++;
            if (maxUserID < 10) {
                bookingID = "B00" + maxUserID;
            } else if (maxUserID < 100) {
                bookingID = "B0" + maxUserID;
            }

            statement1.close();

            String sql2 = "INSERT INTO Booking (BookingID, UserID, HomestayID, OrderDate, CheckInDate, CheckOutDate, Status) VALUES (?,?,?,?,?,?,?)";
            PreparedStatement statement2 = con.prepareStatement(sql2);
            statement2.setString(1, bookingID);
            statement2.setInt(2, temp.getUserID());
            statement2.setString(3, temp.getHomestayID());
            statement2.setDate(4, new java.sql.Date(temp.getOrderDate().getTime()));
            statement2.setDate(5, new java.sql.Date(temp.getCheckInDate().getTime()));
            statement2.setDate(6, new java.sql.Date(temp.getCheckOutDate().getTime()));
            statement2.setString(7, "Pending");

            int rowsInserted = statement2.executeUpdate();
            statement2.close();

            return rowsInserted > 0;
        } catch (Exception e) {
            System.out.println("Error in addBooking: " + e);
        }
        return false;
    }
//---------------------------------------------------------------------------------------------------

    public static boolean deleteBooking(String bookingID) throws Exception {
        try (Connection con = getConnect()) {
            String deleteBookingstaySQL = "DELETE FROM Booking WHERE BookingID = ?";
            PreparedStatement psHomestay = con.prepareStatement(deleteBookingstaySQL);
            psHomestay.setString(1, bookingID);
            int rowsDeleted = psHomestay.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
//---------------------------------------------------------------------------------------------------

    public static boolean updateBooking(String bookingID) {
        try (Connection con = getConnect()) {
            String sql = "UPDATE Booking SET status = ? WHERE BookingID = ?";
            PreparedStatement statement = con.prepareStatement(sql);

            statement.setString(1, "Confirmed");
            statement.setString(2, bookingID);

            int rowsInserted = statement.executeUpdate();
            statement.close();
            return rowsInserted > 0;
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }
//---------------------------------------------------------------------------------------------------

    public static List<Booking> getBookingsByHomestayID(String homestayID) throws Exception {
        List<Booking> bookings = new ArrayList<>();
        try (Connection con = getConnect()) {
            String query = "SELECT * FROM Booking WHERE HomestayID = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, homestayID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Booking booking = new Booking();
                booking.setCheckInDate(rs.getDate("CheckInDate"));
                booking.setCheckOutDate(rs.getDate("CheckOutDate"));
                bookings.add(booking);
            }
        }
        return bookings;
    }

//    public static void main(String[] args) throws Exception {
//        SimpleDateFormat inputFormat = new SimpleDateFormat("MM/dd/yyyy");
//        SimpleDateFormat dbFormat = new SimpleDateFormat("yyyy-MM-dd");
//        Date checkinDate = inputFormat.parse("07/01/2024");
//        Date checkoutDate = inputFormat.parse("07/03/2024");
//        String checkinDB = dbFormat.format(checkinDate);
//        String checkoutDB = dbFormat.format(checkoutDate);
//        List<Booking> existBooking = BookingDAO.getBookingsByHomestayID("HS001");
//        boolean dateConflict = existBooking.stream().anyMatch(booking
//                -> (checkinDB.equals(booking.getCheckInDate().toString()) || checkoutDB.equals(booking.getCheckOutDate().toString()))
//        );
//        System.out.println(dateConflict);
//    }
}
