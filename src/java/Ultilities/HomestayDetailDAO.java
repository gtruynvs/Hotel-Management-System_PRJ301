/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ultilities;

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

/**
 *
 * @author Administrator
 */
public class HomestayDetailDAO implements DB {

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

    public static List<HomeStayDetail> getHomestayMoreDetail(String homestayID) throws SQLException {
        try (Connection con = getConnect()) {
            List<HomeStayDetail> list = new ArrayList<>();
            String sql = "SELECT * FROM HomestayDetails WHERE HomestayID = ?";
            try (PreparedStatement statement = con.prepareStatement(sql)) {
                statement.setString(1, homestayID);
                ResultSet rs = statement.executeQuery();
                while (rs.next()) {
                    HomeStayDetail temp = new HomeStayDetail();
                    temp.setHomestayDetailID(rs.getString("HomestayDetailID"));
                    temp.setRoomTypeID(rs.getString("RoomTypeID"));
                    temp.setAcreage(rs.getString("Acreage"));
                    temp.setNumRoom(rs.getInt("NumRoom"));
                    temp.setNumAdult(rs.getInt("NumAdult"));
                    temp.setNumChild(rs.getInt("NumChild"));
                    temp.setCapacity(rs.getInt("Capacity"));
                    temp.setNumBeds(rs.getInt("NumBeds"));
                    temp.setNumBathroom(rs.getInt("NumBathrooms"));
                    temp.setPrice(rs.getInt("Price"));
                    list.add(temp);
                }
                rs.close(); 
                return list;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
//---------------------------------------------------------------------------------------------------
     public static boolean deleteDetail(String HomestayDetailID) throws Exception {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("DELETE FROM HomestayDetails WHERE HomestayDetailID = ?");
            stmt.setString(1, HomestayDetailID);
            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
//---------------------------------------------------------------------------------------------------
     public static boolean updateHomestayDetails(String homestayDetailID, String roomTypeId, String acreage, String numRoom, String numAdult, String numChild, String capacity, String numBeds, String numBathrooms, String price) {
    StringBuilder sql = new StringBuilder("UPDATE HomestayDetails SET");
    List<Object> params = new ArrayList<>();

    boolean isFirst = true;

    if (roomTypeId != null && !roomTypeId.isEmpty()) {
        if (!isFirst) {
            sql.append(",");
        }
        sql.append(" RoomTypeID = ?");
        params.add(roomTypeId);
        isFirst = false;
    }

    if (acreage != null && !acreage.isEmpty()) {
        if (!isFirst) {
            sql.append(",");
        }
        sql.append(" Acreage = ?");
        params.add(acreage);
        isFirst = false;
    }

    if (numRoom != null && !numRoom.isEmpty()) {
        if (!isFirst) {
            sql.append(",");
        }
        sql.append(" NumRoom = ?");
        params.add(numRoom);
        isFirst = false;
    }

    if (numAdult != null && !numAdult.isEmpty()) {
        if (!isFirst) {
            sql.append(",");
        }
        sql.append(" NumAdult = ?");
        params.add(numAdult);
        isFirst = false;
    }

    if (numChild != null && !numChild.isEmpty()) {
        if (!isFirst) {
            sql.append(",");
        }
        sql.append(" NumChild = ?");
        params.add(numChild);
        isFirst = false;
    }

    if (capacity != null && !capacity.isEmpty()) {
        if (!isFirst) {
            sql.append(",");
        }
        sql.append(" Capacity = ?");
        params.add(capacity);
        isFirst = false;
    }

    if (numBeds != null && !numBeds.isEmpty()) {
        if (!isFirst) {
            sql.append(",");
        }
        sql.append(" NumBeds = ?");
        params.add(numBeds);
        isFirst = false;
    }

    if (numBathrooms != null && !numBathrooms.isEmpty()) {
        if (!isFirst) {
            sql.append(",");
        }
        sql.append(" NumBathrooms = ?");
        params.add(numBathrooms);
        isFirst = false;
    }

    if (price != null && !price.isEmpty()) {
        if (!isFirst) {
            sql.append(",");
        }
        sql.append(" Price = ?");
        params.add(price);
        isFirst = false;
    }

    sql.append(" WHERE HomestayDetailID = ?");
    params.add(homestayDetailID);

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
     public static void main(String[] args) throws Exception {
         System.out.println(deleteDetail("HD003"));
    }
}
