/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Administrator
 */
public class User {
//    UserID INT PRIMARY KEY,
//	FirstName NVARCHAR(255),
//    LastName NVARCHAR(255), 
//    Username VARCHAR(255),
//    Email VARCHAR(100),
//    Password NVARCHAR(100),
//	Gender VARCHAR(50),
//    Address VARCHAR(255),
//    Phone VARCHAR(20),
//	Nationality NVARCHAR(100),
//	DOB Date,
//    RegistrationDate DATE,
//	Role CHAR(10)
    private int userID;
    private String firstName;
    private String lastName;
    private String userName;
    private String email;
    private String password;
    private String gender;
    private String address;
    private String phone;
    private String nationality;
    private Date dobDate;
    private Date registrationDate;
     private String role;
    

    public User() {
    }

    public User(String userName, String email, String password) {
        this.userID = -1;
        this.firstName = null;
        this.lastName = null;
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.gender = null;
        this.address = null;
        this.phone = null;
        this.nationality = null;
        this.dobDate = null;
        this.registrationDate = null;
        this.role = null;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public Date getDobDate() {
        return dobDate;
    }

    public void setDobDate(Date dobDate) {
        this.dobDate = dobDate;
    }

    public Date getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(Date registrationDate) {
        this.registrationDate = registrationDate;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    


    @Override
    public String toString() {
        return "User{" + "userID=" + userID + ", firstName=" + firstName + ", lastName=" + lastName + ", userName=" + userName + ", email=" + email + ", password=" + password + ", gender=" + gender + ", address=" + address + ", phone=" + phone + ", nationality=" + nationality + ", dobDate=" + dobDate + ", registrationDate=" + registrationDate + ", role=" + role + '}';
    }
}
