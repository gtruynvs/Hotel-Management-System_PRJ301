<%-- 
    Document   : profile
    Created on : Jul 1, 2024, 3:28:29 PM
    Author     : Administrator
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" type="x-icon" href="img/only-logo.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>StayEase - Customer Profile</title>
        <link rel="stylesheet" href="css/profile.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
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
        <c:set var="x" value="${sessionScope.user}"/>
        <section id="profile">
            <div class="profile-avatar">
                <c:if test="${x.gender == 'Male'}">
                    <img src="img/male-avt.jpg" alt="Avatar">
                </c:if>
                <c:if test="${x.gender == 'Female'}">
                    <img src="img/female-avt.jpg" alt="Avatar">
                </c:if>
                    <c:if test="${x.gender == 'male'}">
                    <img src="img/male-avt.jpg" alt="Avatar">
                </c:if>
                <c:if test="${x.gender == 'female'}">
                    <img src="img/female-avt.jpg" alt="Avatar">
                </c:if>
                <div class="profile-actions">
                    <a href="logout">Logout</a>
                </div>
            </div>
            <div class="profile-info">
                <h2>Your Profile</h2>
                <form action="profile" method="POST">
                    <div class="form-group">
                        <label for="firstName">First Name:</label>
                        <input type="text" id="firstName" name="firstName" value="${x.firstName}" >
                    </div>
                    <div class="form-group">
                        <label for="lastName">Last Name:</label>
                        <input type="text" id="lastName" name="lastName" value="${x.lastName}" >
                    </div>
                    <div class="form-group">
                        <label for="birthday">Birthday:</label>
                        <input type="date" id="birthday" name="birthday" value="${x.dobDate}">
                    </div>
                    <div class="form-group">
                        <label for="gender">Gender:</label>
                        <select id="gender" name="gender">
                            <option value="male" <c:if test="${x.gender == 'Male'}">selected</c:if>>Male</option>
                            <option value="female" <c:if test="${x.gender == 'Female'}">selected</c:if>>Female</option>
                            <option value="other" <c:if test="${x.gender == 'Other'}">selected</c:if>>Other</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="address">Address:</label>
                            <textarea id="address" name="address" value="${x.address}" rows="4">${x.address}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone:</label>
                        <input type="tel" id="phone" name="phone" value="${x.phone}">
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" id="email" name="email" value="${x.email}">
                    </div>
                    <div class="submit-btn">
                        <input type="hidden" value="${x.userID}" name="userID">
                        <input type="submit" name="button" value="Update">
                    </div>
                </form>
            </div>
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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $('.navbar-toggler').on('click', function () {
                    $('.navbar-collapse').toggleClass('open');
                });
            });
        </script>

    </body>

</html>
