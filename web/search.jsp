<%-- 
    Document   : search
    Created on : Jul 1, 2024, 3:28:51 PM
    Author     : Administrator
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" type="x-icon" href="img/only-logo.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>StayEase - Searching Details</title>
        <link rel="stylesheet" href="css/search.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Playwrite+US+Trad:wght@100..400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    </head>

    <body>
        <!-- Header Area -->
        <header class="header_area">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand logo_h" href="user"><img src="img/logo_remove_2.png"></a>
                    <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="fas fa-bars"></span>
                    </button>
                    <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                        <ul class="nav navbar-nav menu_nav ml-auto">
                            <li class="nav-item active"><a class="nav-link" href="user">HOME</a></li>
                            <li class="nav-item"><a class="nav-link" href="aboutus.jsp">ABOUT US</a></li>
                            <li class="nav-item"><a class="nav-link" href="discovery.jsp">DISCOVERY</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link" href="#" class="dropdown-toggle">PROFILE</a>
                                <ul class="dropdown-menu">
                                    <li><a href="logout">LogOut</a></li>
                                    <li><a href="profile">Update Profile</a></li>
                                </ul>
                            </li>
                            <li class="nav-item"><a class="nav-link" href="contactus.jsp">CONTACT US</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>
        <!-- End Header Area -->

        <section id="searching">
            <div class="search-container">
                <h1>Searching for Booking</h1>
                <form action="search" method="GET">
                    <div class="search-bar">
                        <input type="text" id="searchInput" name="nameHomestay" placeholder="Search...">
                        <button type="submit" id="searchButton">Search</button>
                    </div>
                    <div class="filters-line">
                        <label for="checkindate">Check-in Date:</label>
                        <input type="date" name="checkindate" id="checkindate">

                        <label for="checkoutdate">Check-out Date:</label>
                        <input type="date" name="checkoutdate" id="checkoutdate">

                        <label for="adults">Adults:</label>
                        <input type="number" name="adults" id="adults" min="0">

                        <label for="children">Children:</label>
                        <input type="number" name="children" id="children" min="0">

                        <label for="propertytype">Property Type:</label>
                        <select id="propertytype" name="propertytype">
                            <option value=""></option
                            <option value="Homestay">Homestay</option>
                            <option value="Hotel">Hotel</option>
                            <option value="Villa">Villa</option>
                            <option value="Motel">Motel</option>
                            <option value="Resort">Resort</option>
                        </select>
                    </div>
                    <div class="filters-line">
                        <label for="guest-rating">Guest Rating:</label>
                        <select id="rating" name="rating">
                            <option value=""></option>
                            <option value="1">&gt;1 star</option>
                            <option value="2">&gt;2 star</option>
                            <option value="3">&gt;3 star</option>
                            <option value="4">&gt;4 star</option>
                        </select>

                        <label for="location">Location:</label>
                        <input type="text" name="location" id="location">
                    </div>
                </form>
            </div>

            <c:forEach var="c" items="${requestScope.search}" >
                <div class="search-result">
                    <div class="left-side">
                        <img src="img/${c.homeStayImg}" alt="Your Hotel Name">
                        <div class="search-details">
                            <div class="search-title">
                                <h2>${c.homeStayName}</h2>
                            </div>
                            <p><strong>Type:</strong> ${c.homeStayType}</p>
                            <p class="location"><strong>Location:</strong> ${c.homeStayLocation}</p>                           
                            <c:forEach var="detail" items="${c.homeStayDetail}">
                                <p class="rating"><strong>Rating:</strong> ${detail.rating}*</p>
                                <p class="roomType"><strong>RoomType:</strong> ${detail.roomType}</p>
                                <p class="adult"><strong>Adult:</strong> ${detail.numAdult}</p>
                                <p class="child"><strong>Child:</strong> ${detail.numChild}</p>
                                <p class="bed"><strong>Beds:</strong> ${detail.numBeds}</p>
                                <p class="child"><strong>Bathroom:</strong> ${detail.numBathroom}</p>       
                            </div>
                        </div>
                        <div class="right-side">
                            <div class="price">
                                <h3>Price per night:</h3>
                                <p>${detail.price}</p>
                            </div>
                            <div class="amenities">
                                <h3>Amenities:</h3>
                                <ul>
                                    <c:forEach var="amenities" items="${detail.listAmenities}">
                                        <li>${amenities.amenityName}</li>
                                        </c:forEach>
                                </ul>
                            </div>  

                            <div class="book-now">
                                <a href="booking?image=${c.homeStayImg}&price=${detail.price}&name=${c.homeStayName}&roomtype=${detail.roomType}&acreage=${detail.acreage}&numRoom=${detail.numRoom}&numAdult=${detail.numAdult}&numChild=${detail.numChild}&capacity=${detail.capacity}&numBed=${detail.numBeds}&numBath=${detail.numBathroom}&homestayID=${c.homeStayID}" class="btn-book">Book Now</a>
                            </div>
                        </c:forEach> 
                    </div>
                </div>   
            </c:forEach>
        </section>


        <!-- Footer -->
        <footer class="footer-distributed">
            <div class="footer-left">
                <img src="img/logo_remove_2.png" alt="Logo">
                <p class="footer-links">
                    <a href="user">Home</a>
                    |
                    <a href="aboutus.jsp">About</a>
                    |
                    <a href="contactus.jsp">Contact</a>
                </p>
            </div>
            <div class="footer-center">
                <h3>Contact</h3>
                <div class="contact-item">
                    <i class="fa fa-map-marker"></i>
                    <p><span>Hoa Hai, Ngu Hanh Son</span> Da Nang</p>
                </div>
                <div class="contact-item">
                    <i class="fa fa-phone"></i>
                    <p>Phone: +84 886823142</p>
                </div>
                <div class="contact-item">
                    <i class="fa fa-envelope"></i>
                    <p class="email-id">stayease2024@gmail.com</p>
                </div>
            </div>
            <div class="footer-right">
                <p class="footer-company-about">
                    <span>Newsletter</span>
                <form id="newsletter-form">
                    <input type="email" id="newsletter-email" placeholder="Enter your email" required>
                    <button type="submit"><i class="fas fa-arrow-right"></i></button>
                </form>
                </p>
                <div class="footer-icons">
                    <a href="#"><i class="fab fa-facebook"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
            <div class="footer-bottom">
                <button id="scrollToTopButton">Back to Top</button>
                <p class="copyright">StayEase © 2024 - All Rights Reserved</p>
            </div>
        </footer>

        <script>
            document.getElementById('scrollToTopButton').addEventListener('click', function () {
                window.scrollTo({top: 0, behavior: 'smooth'});
            });
        </script>
        <script src="js/bookingdetails.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

        <!-- JavaScript để xử lý toggle menu -->
        <script>
            $(document).ready(function () {
                $('.navbar-toggler').on('click', function () {
                    $('.navbar-collapse').toggleClass('open');
                });
            });
        </script>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const profileLink = document.querySelector(".dropdown-toggle");
                const dropdownMenu = document.querySelector(".dropdown-menu");

                profileLink.addEventListener("click", function (event) {
                    event.preventDefault();
                    dropdownMenu.classList.toggle("show");
                });
            });

        </script>
    </body>

</html>