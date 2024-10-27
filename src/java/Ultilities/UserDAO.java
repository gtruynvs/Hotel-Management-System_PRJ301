/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Ultilities;

import Model.User;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author Administrator
 */
public class UserDAO implements DB {

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

    public static List<User> getAllUser() throws SQLException {
        try (Connection con = getConnect()) {
            List<User> list = new ArrayList<>();
            String sql = "SELECT * FROM Users";
            try (PreparedStatement statement = con.prepareStatement(sql)) {
                ResultSet rs = statement.executeQuery();
                while (rs.next()) {
                    User temp = new User();
                    temp.setUserID(rs.getInt("UserID"));
                    temp.setFirstName(rs.getString("FirstName"));
                    temp.setLastName(rs.getString("LastName"));
                    temp.setGender(rs.getString("Gender"));
                    temp.setNationality(rs.getString("Nationality"));
                    temp.setUserName(rs.getString("Username"));
                    temp.setPassword(rs.getString("Password"));
                    temp.setRole(rs.getString("Role"));
                    temp.setRegistrationDate(rs.getDate("RegistrationDate"));
                    temp.setPhone(rs.getString("Phone"));
                    temp.setAddress(rs.getString("Address"));
                    temp.setDobDate(rs.getDate("DOB"));
                    temp.setEmail(rs.getString("Email"));
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

    public static User getUserByUserPass(String user, String pass) throws SQLException {
        try (Connection con = getConnect()) {
            String sql = "SELECT * FROM Users WHERE Username = ? AND Password = ?";
            try (PreparedStatement statement = con.prepareStatement(sql)) {
                statement.setString(1, user);
                statement.setString(2, pass);
                ResultSet rs = statement.executeQuery();
                if (rs.next()) {
                    User temp = new User();
                    temp.setUserID(rs.getInt("UserID"));
                    temp.setFirstName(rs.getString("FirstName"));
                    temp.setLastName(rs.getString("LastName"));
                    temp.setGender(rs.getString("Gender"));
                    temp.setNationality(rs.getString("Nationality"));
                    temp.setUserName(rs.getString("Username"));
                    temp.setPassword(rs.getString("Password"));
                    temp.setRole(rs.getString("Role"));
                    temp.setRegistrationDate(rs.getDate("RegistrationDate"));
                    temp.setPhone(rs.getString("Phone"));
                    temp.setAddress(rs.getString("Address"));
                    temp.setDobDate(rs.getDate("DOB"));
                    temp.setEmail(rs.getString("Email"));
                    return temp;
                }
                rs.close();
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
//---------------------------------------------------------------------------------------------------

    public static boolean addUser(User temp) throws SQLException {
        try (Connection con = getConnect()) {

            String sql1 = "SELECT MAX(userID) FROM Users";
            PreparedStatement statement1 = con.prepareStatement(sql1);
            ResultSet rs1 = statement1.executeQuery();
            int maxUserID = 0;
            if (rs1.next()) {
                maxUserID = rs1.getInt(1);
            }
            maxUserID++;
            statement1.close();

            String sql = "INSERT INTO Users (UserID, Username, Email, Password, Role, FirstName, LastName, Gender, Phone, DOB, Nationality) VALUES (?,?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement statement2 = con.prepareStatement(sql);
            statement2.setInt(1, maxUserID);
            statement2.setString(2, temp.getUserName());
            statement2.setString(3, temp.getEmail());
            statement2.setString(4, temp.getPassword());
            statement2.setString(5, temp.getRole());
            statement2.setString(6, temp.getFirstName());
            statement2.setString(7, temp.getLastName());
            statement2.setString(8, temp.getGender());
            statement2.setString(9, temp.getPhone());
            statement2.setDate(10, (java.sql.Date) temp.getDobDate());
            statement2.setString(11, temp.getNationality());
            int rowsInserted = statement2.executeUpdate();
            statement2.close();

            return rowsInserted > 0;
        } catch (Exception e) {
            System.out.println("Error in addUser: " + e);
        }
        return false;
    }
//---------------------------------------------------------------------------------------------------

    public static boolean register(User temp) throws SQLException {
        try (Connection con = getConnect()) {

            String sql1 = "SELECT MAX(userID) FROM Users";
            PreparedStatement statement1 = con.prepareStatement(sql1);
            ResultSet rs1 = statement1.executeQuery();
            int maxUserID = 0;
            if (rs1.next()) {
                maxUserID = rs1.getInt(1);
            }
            maxUserID++;
            statement1.close();
            temp.setRole("user");
            String sql = "INSERT INTO Users (UserID, Username, Email, Password, Role) VALUES (?,?,?,?,?)";
            PreparedStatement statement2 = con.prepareStatement(sql);
            statement2.setInt(1, maxUserID);
            statement2.setString(2, temp.getUserName());
            statement2.setString(3, temp.getEmail());
            statement2.setString(4, temp.getPassword());
            statement2.setString(5, temp.getRole());
            int rowsInserted = statement2.executeUpdate();
            statement2.close();

            return rowsInserted > 0;
        } catch (Exception e) {
            System.out.println("Error in addUser: " + e);
        }
        return false;
    }
//---------------------------------------------------------------------------------------------------

    public static boolean deleteUser(int userID) throws Exception {
        try (Connection con = getConnect()) {
            PreparedStatement stmt = con.prepareStatement("DELETE FROM Users WHERE userID = ?");
            stmt.setInt(1, userID);
            int rowsDeleted = stmt.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return false;
    }
//---------------------------------------------------------------------------------------------------

    public static boolean updateUserInfo(int userId, String firstName, String lastName, String gender, String address, String phone, String nationality, String dob, String registrationDate) {
        StringBuilder sql = new StringBuilder("UPDATE Users SET");
        List<Object> params = new ArrayList<>();

        boolean isFirst = true;

        if (firstName != null && !firstName.isEmpty()) {
            if (!isFirst) {
                sql.append(",");
            }
            sql.append(" FirstName = ?");
            params.add(firstName);
            isFirst = false;
        }

        if (lastName != null && !lastName.isEmpty()) {
            if (!isFirst) {
                sql.append(",");
            }
            sql.append(" LastName = ?");
            params.add(lastName);
            isFirst = false;
        }

        if (gender != null && !gender.isEmpty()) {
            if (!isFirst) {
                sql.append(",");
            }
            sql.append(" Gender = ?");
            params.add(gender);
            isFirst = false;
        }

        if (address != null && !address.isEmpty()) {
            if (!isFirst) {
                sql.append(",");
            }
            sql.append(" Address = ?");
            params.add(address);
            isFirst = false;
        }

        if (phone != null && !phone.isEmpty()) {
            if (!isFirst) {
                sql.append(",");
            }
            sql.append(" Phone = ?");
            params.add(phone);
            isFirst = false;
        }

        if (nationality != null && !nationality.isEmpty()) {
            if (!isFirst) {
                sql.append(",");
            }
            sql.append(" Nationality = ?");
            params.add(nationality);
            isFirst = false;
        }

        if (dob != null && !dob.isEmpty()) {
            if (!isFirst) {
                sql.append(",");
            }
            sql.append(" DOB = ?");
            params.add(convertStringtoDate(dob));
            isFirst = false;
        }

        if (registrationDate != null && !registrationDate.isEmpty()) {
            if (!isFirst) {
                sql.append(",");
            }
            sql.append(" RegistrationDate = ?");
            params.add(convertStringtoDate(registrationDate));
            isFirst = false;
        }

        sql.append(" WHERE UserId = ?");
        params.add(userId);

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

    public static Date convertStringtoDate(String day) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        df.setLenient(false);
        try {
            return df.parse(day);
        } catch (ParseException e) {
            System.out.println(e);
            return null;
        }
    }

    public static String convertDatetoString(Date day) {
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
        return df.format(day);
    }
//---------------------------------------------------------------------------------------------------  

    public static boolean checkExistUser(String username) throws Exception {
        boolean exists = false;
        try (Connection con = getConnect()) {
            String sql = "SELECT Username FROM Users WHERE Username = ?";
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setString(1, username);
                try (ResultSet rs = stmt.executeQuery()) {
                    exists = rs.next(); 
                }
            }
        } catch (SQLException e) {
            System.out.println(e);
            throw new Exception("Database error");
        }
        return exists;
    }
}
