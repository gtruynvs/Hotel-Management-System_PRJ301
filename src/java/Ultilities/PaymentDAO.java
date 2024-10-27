/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ultilities;

import Model.HomeStay;
import Model.Payment;
import static Ultilities.DB.DBURL;
import static Ultilities.DB.DRIVERNAME;
import static Ultilities.DB.PASSDB;
import static Ultilities.DB.USERDB;
import static Ultilities.HomestayDAO.getConnect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class PaymentDAO implements DB {

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

    public static List<Payment> getAllPayment() throws SQLException {
        try (Connection con = getConnect()) {
            List<Payment> list = new ArrayList<>();
            String sql = "Select * from Payments";
            try (PreparedStatement statement = con.prepareStatement(sql)) {
                ResultSet rs = statement.executeQuery();
                while (rs.next()) {
                    Payment temp = new Payment();
                    temp.setPaymentID(rs.getString("PaymentID"));
                    temp.setBookingID(rs.getString("BookingID"));
                    temp.setPaymentDate(rs.getDate("PaymentDate"));
                    temp.setAmount(rs.getInt("Amount"));
                    temp.setPaymentMethod(rs.getString("PaymentMethod"));
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

    public static boolean savePayment(Payment temp) throws SQLException {
        try (Connection con = getConnect()) {

            String sql1 = "SELECT MAX(PaymentID) FROM Payments";
            PreparedStatement statement1 = con.prepareStatement(sql1);
            ResultSet rs1 = statement1.executeQuery();
            int maxPaymentID = 0;
            String paymentID = "";
            if (rs1.next()) {
                maxPaymentID = Integer.parseInt(rs1.getString(1).split("P")[1]);
            }
            maxPaymentID++;
            if (maxPaymentID < 10) {
                paymentID = "P00" + maxPaymentID;
            }
            if (maxPaymentID < 100 && maxPaymentID > 10) {
                paymentID = "P0" + maxPaymentID;
            }
            statement1.close();

            String sql2 = "INSERT INTO Payments (PaymentID, BookingID, PaymentDate, Amount, PaymentMethod) VALUES (?,?,?,?,?)";
            PreparedStatement statement2 = con.prepareStatement(sql2);
            statement2.setString(1, paymentID);
            statement2.setString(2, temp.getBookingID());
            statement2.setDate(3, new java.sql.Date(temp.getPaymentDate().getTime()));
            statement2.setInt(4, temp.getAmount());
            statement2.setString(5, temp.getPaymentMethod());
            int rowsInserted = statement2.executeUpdate();
            statement2.close();
            return rowsInserted > 0;
        } catch (Exception e) {
            System.out.println("Error in addPayment: " + e);
        }
        return false;
    }
}
