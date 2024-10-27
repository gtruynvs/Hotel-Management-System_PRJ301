package Ultilities;

import Model.Amenities;
import Model.HomeStay;
import Model.HomeStayDetail;
import static Ultilities.DB.DBURL;
import static Ultilities.DB.DRIVERNAME;
import static Ultilities.DB.PASSDB;
import static Ultilities.DB.USERDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import java.util.List;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author Administrator
 */
public class HomestayDAO implements DB {

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

    public static List<HomeStay> getAllHomeStay() throws SQLException {
        try (Connection con = getConnect()) {
            List<HomeStay> list = new ArrayList<>();
            String sql = "SELECT * FROM Homestay";
            try (PreparedStatement statement = con.prepareStatement(sql)) {
                ResultSet rs = statement.executeQuery();
                while (rs.next()) {
                    HomeStay temp = new HomeStay();
                    temp.setHomeStayID(rs.getString("HomestayID"));
                    temp.setHomeStayName(rs.getString("HomestayName"));
                    temp.setHomeStayType(rs.getString("HomestayType"));
                    temp.setHomeStayLocation(rs.getString("Location"));
                    temp.setHomeStayDescription(rs.getString("Description"));
                    temp.setHomeStayContactNumber(rs.getString("ContactNumber"));
                    temp.setHomeStayImg(rs.getString("HomestayImage"));
                    temp.setHomeStayFeedback(rs.getString("Feedback"));
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

    public static boolean addHomestay(HomeStay temp) throws SQLException {
        try (Connection con = getConnect()) {

            String sql1 = "SELECT MAX(HomestayID) FROM Homestay";
            PreparedStatement statement1 = con.prepareStatement(sql1);
            ResultSet rs1 = statement1.executeQuery();
            int maxUserID = 0;
            if (rs1.next()) {
                maxUserID = Integer.parseInt(rs1.getString(1).split("S")[1]);
            }
            maxUserID++;
            String homestayID = "HS0" + maxUserID;
            statement1.close();

            String sql2 = "INSERT INTO Homestay (HomestayID, HomestayName, HomestayType, Location, Description, ContactNumber, HomestayImage, Feedback) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement statement2 = con.prepareStatement(sql2);
            statement2.setString(1, homestayID);
            statement2.setString(2, temp.getHomeStayName());
            statement2.setString(3, temp.getHomeStayType());
            statement2.setString(4, temp.getHomeStayLocation());
            statement2.setString(5, temp.getHomeStayDescription());
            statement2.setString(6, temp.getHomeStayContactNumber());
            statement2.setString(7, temp.getHomeStayImg());
            statement2.setString(8, temp.getHomeStayFeedback());
            int rowsInserted = statement2.executeUpdate();
            statement2.close();

            return rowsInserted > 0;
        } catch (Exception e) {
            System.out.println("Error in addHomestay: " + e);
        }
        return false;
    }
//---------------------------------------------------------------------------------------------------

    public static boolean deleteHomestay(String homeStayID) throws Exception {
        try (Connection con = getConnect()) {
            String deleteHomestayAmenitiesSQL = "DELETE FROM HomestayAmenities WHERE HomestayID = ?";
            PreparedStatement psHomestayAmenities = con.prepareStatement(deleteHomestayAmenitiesSQL);
            psHomestayAmenities.setString(1, homeStayID);
            psHomestayAmenities.executeUpdate();

            // Delete from HomestayDetails
            String deleteHomestayDetailsSQL = "DELETE FROM HomestayDetails WHERE HomestayID = ?";
            PreparedStatement psHomestayDetails = con.prepareStatement(deleteHomestayDetailsSQL);
            psHomestayDetails.setString(1, homeStayID);
            psHomestayDetails.executeUpdate();

            // Delete from Homestay
            String deleteHomestaySQL = "DELETE FROM Homestay WHERE HomestayID = ?";
            PreparedStatement psHomestay = con.prepareStatement(deleteHomestaySQL);
            psHomestay.setString(1, homeStayID);
            int rowsDeleted = psHomestay.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
//---------------------------------------------------------------------------------------------------     

    public static boolean updateHomestayInfo(String homestayId, String homestayName, String homestayType, String location, String description, String contactNumber, String homestayImage, String feedback) {
        StringBuilder sql = new StringBuilder("UPDATE Homestay SET");
        List<Object> params = new ArrayList<>();

        boolean isFirst = true;

        if (homestayName != null && !homestayName.isEmpty()) {
            if (!isFirst) {
                sql.append(",");
            }
            sql.append(" HomestayName = ?");
            params.add(homestayName);
            isFirst = false;
        }

        if (homestayType != null && !homestayType.isEmpty()) {
            if (!isFirst) {
                sql.append(",");
            }
            sql.append(" HomestayType = ?");
            params.add(homestayType);
            isFirst = false;
        }

        if (location != null && !location.isEmpty()) {
            if (!isFirst) {
                sql.append(",");
            }
            sql.append(" Location = ?");
            params.add(location);
            isFirst = false;
        }

        if (description != null && !description.isEmpty()) {
            if (!isFirst) {
                sql.append(",");
            }
            sql.append(" Description = ?");
            params.add(description);
            isFirst = false;
        }

        if (contactNumber != null && !contactNumber.isEmpty()) {
            if (!isFirst) {
                sql.append(",");
            }
            sql.append(" ContactNumber = ?");
            params.add(contactNumber);
            isFirst = false;
        }

        if (homestayImage != null && !homestayImage.isEmpty()) {
            if (!isFirst) {
                sql.append(",");
            }
            sql.append(" HomestayImage = ?");
            params.add(homestayImage);
            isFirst = false;
        }

        if (feedback != null && !feedback.isEmpty()) {
            if (!isFirst) {
                sql.append(",");
            }
            sql.append(" Feedback = ?");
            params.add(feedback);
            isFirst = false;
        }

        sql.append(" WHERE HomestayID = ?");
        params.add(homestayId);

        try (Connection connection = getConnect(); PreparedStatement statement = connection.prepareStatement(sql.toString())) {
            for (int i = 0; i < params.size(); i++) {
                statement.setObject(i + 1, params.get(i));
            }

            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
//---------------------------------------------------------------------------------------------------

    public static List<HomeStay> searchHomestay(String nameHomestay, String checkindate, String checkoutdate, String numAdults, String numChildren, String homestayType, String rating, String location) {
        List<HomeStay> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
                "SELECT H.*, HD.*, R.Rating "
                + "FROM Homestay H "
                + "JOIN HomestayDetails HD ON H.HomestayID = HD.HomestayID "
                + "LEFT JOIN Reviews R ON H.HomestayID = R.HomestayID "
                + "WHERE 1=1"
        );

        List<Object> params = new ArrayList<>();

        // Điều kiện tên homestay
        if (nameHomestay != null && !nameHomestay.isEmpty()) {
            sql.append(" AND H.HomestayName LIKE ?");
            params.add("%" + nameHomestay + "%");
        }

        // Điều kiện ngày check-in, check-out
        if (checkindate != null && !checkindate.isEmpty() && checkoutdate != null && !checkoutdate.isEmpty()) {
            sql.append(" AND H.HomestayID NOT IN ("
                    + "SELECT B.HomestayID FROM Booking B "
                    + "WHERE (? < B.CheckOutDate AND ? > B.CheckInDate))");
            params.add(java.sql.Date.valueOf(checkindate));
            params.add(java.sql.Date.valueOf(checkoutdate));
        }

        // Điều kiện số lượng người lớn
        if (numAdults != null && !numAdults.isEmpty()) {
            sql.append(" AND HD.NumAdult >= ?");
            params.add(Integer.parseInt(numAdults));
        }

        // Điều kiện số lượng trẻ em
        if (numChildren != null && !numChildren.isEmpty()) {
            sql.append(" AND HD.NumChild >= ?");
            params.add(Integer.parseInt(numChildren));
        }

        // Điều kiện loại homestay
        if (homestayType != null && !homestayType.isEmpty()) {
            sql.append(" AND H.HomestayType = ?");
            params.add(homestayType);
        }

        // Điều kiện đánh giá chính xác
        if (rating != null && !rating.isEmpty()) {
            sql.append(" AND R.Rating >= ?");
            params.add(Integer.parseInt(rating));
        }

        // Điều kiện vị trí
        if (location != null && !location.isEmpty()) {
            sql.append(" AND H.Location LIKE ?");
            params.add("%" + location + "%");
        }

        try (Connection connection = getConnect(); PreparedStatement statement = connection.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                statement.setObject(i + 1, params.get(i));
            }

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                HomeStay homestay = new HomeStay();
                HomeStayDetail detail = new HomeStayDetail();

                homestay.setHomeStayID(resultSet.getString("HomestayID"));
                homestay.setHomeStayName(resultSet.getString("HomestayName"));
                homestay.setHomeStayLocation(resultSet.getString("Location"));
                homestay.setHomeStayDescription(resultSet.getString("Description"));
                homestay.setHomeStayContactNumber(resultSet.getString("ContactNumber"));
                homestay.setHomeStayImg(resultSet.getString("HomestayImage"));
                homestay.setHomeStayFeedback(resultSet.getString("Feedback"));
                homestay.setHomeStayType(resultSet.getString("HomestayType"));

                String roomTypeID = resultSet.getString("RoomTypeID");
                detail.setRoomTypeID(resultSet.getString("RoomTypeID"));
                detail.setAcreage(resultSet.getString("Acreage"));
                detail.setNumRoom(resultSet.getInt("NumRoom"));
                detail.setNumBeds(resultSet.getInt("NumBeds"));
                detail.setNumBathroom(resultSet.getInt("NumBathrooms"));
                detail.setNumAdult(resultSet.getInt("NumAdult"));
                detail.setNumChild(resultSet.getInt("NumChild"));
                detail.setCapacity(resultSet.getInt("Capacity"));
                detail.setPrice(resultSet.getInt("Price"));
                detail.setRating(resultSet.getInt("Rating"));
                detail.setListAmenities(getFullAmenities(resultSet.getString("HomestayID")));

                String sql2 = "SELECT * FROM RoomType WHERE RoomTypeID = ?";
                PreparedStatement statement2 = connection.prepareStatement(sql2);
                statement2.setString(1, roomTypeID);
                ResultSet rs2 = statement2.executeQuery();
                if (rs2.next()) {
                    detail.setRoomType(rs2.getString("TypeName"));
                }
                homestay.getHomeStayDetail().add(detail);
                list.add(homestay);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

//---------------------------------------------------------------------------------------------------    
    public static List<Amenities> getFullAmenities(String homestayID) throws SQLException {
        List<Amenities> list = new ArrayList<>();
        String sql = "SELECT * from HomestayAmenities WHERE HomestayID = ?";

        try (Connection con = getConnect(); PreparedStatement statement = con.prepareStatement(sql)) {
            statement.setString(1, homestayID);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                String amenityID = rs.getString("AmenityID");
                String sql2 = "SELECT * from Amenities WHERE AmenityID = ?";

                try (PreparedStatement statement2 = con.prepareStatement(sql2)) {
                    statement2.setString(1, amenityID);
                    ResultSet rs2 = statement2.executeQuery();

                    while (rs2.next()) {
                        Amenities temp2 = new Amenities();
                        temp2.setAmenityID(amenityID);
                        temp2.setAmenityDescription(rs2.getString("Description"));
                        temp2.setAmenityName(rs2.getString("AmenityName"));
                        list.add(temp2);
                    }

                    rs2.close();
                }
            }

            rs.close();
        }

        return list;
    }

//---------------------------------------------------------------------------------------------------  
    public static void main(String[] args) {
        for(HomeStay i: searchHomestay(null,null, null, null, null, "Villa", null, null)){
            System.out.println(i.getHomeStayName());
            for(HomeStayDetail j : i.getHomeStayDetail()){
                System.out.println(j.getRoomTypeID());
                System.out.println(j.getRoomType());
                
            }
        }
    }
}
