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
public class HomeStayDetail {

    private String homestayDetailID;
    private String roomType;
    private String roomTypeID;
    private String acreage;
    private int numRoom;
    private int numAdult;
    private int numChild;
    private int capacity;
    private int numBeds;
    private int numBathroom;
    private int price;
    private int rating;
    private List<Amenities> listAmenities;
    
    public HomeStayDetail() {
        listAmenities = new ArrayList<>();
    }

    public List<Amenities> getListAmenities() {
        return listAmenities;
    }

    public void setListAmenities(List<Amenities> listAmenities) {
        this.listAmenities = listAmenities;
    }

    public String getHomestayDetailID() {
        return homestayDetailID;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getRoomTypeID() {
        return roomTypeID;
    }

    public void setRoomTypeID(String roomTypeID) {
        this.roomTypeID = roomTypeID;
    }


    public void setHomestayDetailID(String homestayDetailID) {
        this.homestayDetailID = homestayDetailID;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }


    public String getAcreage() {
        return acreage;
    }

    public void setAcreage(String acreage) {
        this.acreage = acreage;
    }

    public int getNumRoom() {
        return numRoom;
    }

    public void setNumRoom(int numRoom) {
        this.numRoom = numRoom;
    }

    public int getNumAdult() {
        return numAdult;
    }

    public void setNumAdult(int numAdult) {
        this.numAdult = numAdult;
    }

    public int getNumChild() {
        return numChild;
    }

    public void setNumChild(int numChild) {
        this.numChild = numChild;
    }

    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getNumBeds() {
        return numBeds;
    }

    public void setNumBeds(int numBeds) {
        this.numBeds = numBeds;
    }

    public int getNumBathroom() {
        return numBathroom;
    }

    public void setNumBathroom(int numBathroom) {
        this.numBathroom = numBathroom;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }



 
}
