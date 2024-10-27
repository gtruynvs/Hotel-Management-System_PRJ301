/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class HomeStay {
//     HomestayID VARCHAR(50) PRIMARY KEY,
//    HomestayName NVARCHAR(255),
//    Location NVARCHAR(200),
//    Description TEXT,
//	ContactNumber VARCHAR(20),
//    HomestayImage VARCHAR(MAX),
//	Feedback TEXT,
//	HomestayDetailID VARCHAR(50),

    private String homeStayID;
    private String homeStayName;
    private String homeStayLocation;
    private String homeStayDescription;
    private String homeStayContactNumber;
    private String homeStayImg;
    private String homeStayFeedback;
    private String homeStayType;
    private List<HomeStayDetail> homeStayDetail;
    

    public HomeStay() {
        
        homeStayDetail = new ArrayList<>();
    }

    public List<HomeStayDetail> getHomeStayDetail() {
        return homeStayDetail;
    }

    public void setHomeStayDetail(List<HomeStayDetail> homeStayDetail) {
        this.homeStayDetail = homeStayDetail;
    }

    public String getHomeStayID() {
        return homeStayID;
    }

    public void setHomeStayID(String homeStayID) {
        this.homeStayID = homeStayID;
    }

    public String getHomeStayName() {
        return homeStayName;
    }

    public void setHomeStayName(String homeStayName) {
        this.homeStayName = homeStayName;
    }

    public String getHomeStayLocation() {
        return homeStayLocation;
    }

    public void setHomeStayLocation(String homeStayLocation) {
        this.homeStayLocation = homeStayLocation;
    }

    public String getHomeStayDescription() {
        return homeStayDescription;
    }

    public void setHomeStayDescription(String homeStayDescription) {
        this.homeStayDescription = homeStayDescription;
    }

    public String getHomeStayContactNumber() {
        return homeStayContactNumber;
    }

    public void setHomeStayContactNumber(String homeStaycontactNumber) {
        this.homeStayContactNumber = homeStaycontactNumber;
    }

    public String getHomeStayImg() {
        return homeStayImg;
    }

    public void setHomeStayImg(String homeStayImg) {
        this.homeStayImg = homeStayImg;
    }

    public String getHomeStayFeedback() {
        return homeStayFeedback;
    }

    public void setHomeStayFeedback(String homeStayFeedback) {
        this.homeStayFeedback = homeStayFeedback;
    }

    public String getHomeStayType() {
        return homeStayType;
    }

    public void setHomeStayType(String homeStayType) {
        this.homeStayType = homeStayType;
    }

    @Override
    public String toString() {
        return "HomeStay{" + "homeStayID=" + homeStayID + ", homeStayName=" + homeStayName + ", homeStayLocation=" + homeStayLocation + ", homeStayDescription=" + homeStayDescription + ", homeStaycontactNumber=" + homeStayContactNumber + ", homeStayImg=" + homeStayImg + ", homeStayFeedback=" + homeStayFeedback + ", homeStayType=" + homeStayType + '}';
    }

}
