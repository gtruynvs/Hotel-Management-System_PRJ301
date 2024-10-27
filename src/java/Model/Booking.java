/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Date;

/**
 *
 * @author Administrator
 */
public class Booking {
//    BookingID VARCHAR(50) PRIMARY KEY,
//    UserID INT,
//    HomestayID VARCHAR(50),
//    OrderDate DATE,
//    CheckInDate DATE,
//    CheckOutDate DATE,
//    Status VARCHAR(20),

    private String bookingID;
    private int userID;
    private String homestayID;
    private Date orderDate;
    private Date checkInDate;
    private Date checkOutDate;
    private String status;

    public Booking() {
    }

    public String getBookingID() {
        return bookingID;
    }

    public void setBookingID(String bookingID) {
        this.bookingID = bookingID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getHomestayID() {
        return homestayID;
    }

    public void setHomestayID(String homestayID) {
        this.homestayID = homestayID;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public Date getCheckInDate() {
        return checkInDate;
    }

    public void setCheckInDate(Date checkInDate) {
        this.checkInDate = checkInDate;
    }

    public Date getCheckOutDate() {
        return checkOutDate;
    }

    public void setCheckOutDate(Date checkOutDate) {
        this.checkOutDate = checkOutDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String toString() {
        return "Booking{" + "bookingID=" + bookingID + ", userID=" + userID + ", homestayID=" + homestayID + ", orderDate=" + orderDate + ", checkInDate=" + checkInDate + ", checkOutDate=" + checkOutDate + ", status=" + status + '}';
    }

}
