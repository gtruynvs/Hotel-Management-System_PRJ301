
<%-- 
    Document   : index
    Created on : Jul 1, 2024, 3:23:22 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" type="x-icon" href="img/only-logo.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>StayEase - Home</title>
        <link rel="stylesheet" href="css/homepage.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Playwrite+US+Trad:wght@100..400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            #banner {
                background: linear-gradient(rgba(0, 0, 0, 0.2), #009688), url(img/hotel3.jpg);
                background-size: cover;
                background-position: center;
                height: 100vh;
            }
            .dropdown-menu {
                display: none;
                position: absolute;
                background-color: #045048;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
                z-index: 1;
            }

            .dropdown-menu li {
                display: block;
            }

            .dropdown-menu li a {
                display: block;
                padding: 10px 20px;
                text-decoration: none;
                color: #ffffff;
            }

            .dropdown:hover .dropdown-menu {
                display: block;
            }
        </style>
    </head>

    <body>
        <section id="banner">
            <img src="img/logo_remove_2.png" class="logo">
            <div class="banner-text">
                <h1>StayEase</h1>
                <br>
                <p>Simplifying Your Homestay Experience.
                    <br>Comfort and Convenience, Just a Click Away.
                </p>
                <div class="banner-btn">
                    <a href="search"><span></span>Book Now</a>
                </div>
            </div>
        </section>

        <div class="menu-icon" onclick="toggleMenu(this)">
            <div class="bar1"></div>
            <div class="bar2"></div>
            <div class="bar3"></div>
        </div>

        <div id="sideNavWrapper">
            <div id="sideNav" hidden>
                <nav>
                    <ul>
                        <li><a href="homepage">HOME</a></li>
                        <li><a href="aboutus.jsp">ABOUT US</a></li>
                        <li><a href="discovery.jsp">DISCOVERY</a></li>
                            <c:if test="${not empty user}">
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle">PROFILE</a>
                                <ul class="dropdown-menu">
                                    <li><a href="logout">LogOut</a></li>
                                    <li><a href="profile">Update Profile</a></li>
                                    <li><a href="search">Booking</a></li>
                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${empty user}">
                            <li><a href="login">LOGIN</a></li>
                            </c:if>
                        <li><a href="contactus.jsp">CONTACT US</a></li>
                    </ul>
                </nav>
            </div>
        </div>


        <!-- Recommend Destination -->
        <div class="rcm_content">
            <h1>Recommend Destination</h1>
            <div id="rcm-details">
                <div class="img-ctr">
                    <h2>Ha Noi</h2>
                    <img src="img/hanoi.jpg" alt="Ha Noi">
                </div>
                <div class="img-ctr">
                    <h2>Ho Chi Minh City</h2>
                    <img src="img/hcm.jpg" alt="Ho Chi Minh City">
                </div>
                <div class="img-ctr">
                    <h2>Da Nang</h2>
                    <img src="img/danang.jpg" alt="Da Nang">
                </div>
                <div class="img-ctr">
                    <h2>Da Lat</h2>
                    <img src="img/dalat.jpg" alt="Da Lat">
                </div>
                <div class="img-ctr">
                    <h2>Nha Trang</h2>
                    <img src="img/nhatrang.jpg" alt="Nha Trang">
                </div>
                <div class="img-ctr">
                    <h2>Mang Den</h2>
                    <img src="img/mangden.jpg" alt="Mang Den">
                </div>
                <div class="img-ctr">
                    <h2>Hue</h2>
                    <img src="img/hue1.jpg" alt="Hue">
                </div>
                <div class="img-ctr">
                    <h2>Sa Pa</h2>
                    <img src="img/sapa.jpg" alt="Sa Pa">
                </div>
            </div>
        </div>

        <!-- Available Service -->

        <div class="srv_content">
            <h1>Available Services</h1>
            <div id="srv-details" class="service-grid">
                <div class="img-ctr">
                    <img src="img/gym.jpg" alt="Gym">
                    <div class="img-info">
                        <h2>Gym</h2>
                        <p>Stay fit and healthy with our state-of-the-art gym facilities.</p>
                    </div>
                </div>
                <div class="img-ctr">
                    <img src="img/nail.png" alt="Nail">
                    <div class="img-info">
                        <h2>Nail</h2>
                        <p>Pamper yourself with a variety of nail care services, including manicures and pedicures.</p>
                    </div>
                </div>
                <div class="img-ctr">
                    <img src="img/hirebike.png" alt="Hire Motobike">
                    <div class="img-info">
                        <h2>Hire Motobike</h2>
                        <p>Explore the city on two wheels with our convenient bike rental service.</p>
                    </div>
                </div>
                <div class="img-ctr">
                    <img src="img/spa.jpg" alt="Spa">
                    <div class="img-info">
                        <h2>Spa</h2>
                        <p>Relax and rejuvenate with our luxurious spa treatments and massages.</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- FOOTER -->

        <footer class="footer-distributed">
            <div class="footer-left">
                <img src="img/logo_remove_2.png" alt="Logo">
                <p class="footer-links">
                    <a href="homepage">Home</a>
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
            function toggleMenu(x) {
                x.classList.toggle("change");
                var sideNav = document.getElementById("sideNav");
                if (sideNav.hidden) {
                    sideNav.hidden = false;
                    requestAnimationFrame(() => {
                        sideNav.classList.add("show");
                    });
                } else {
                    sideNav.classList.remove("show");
                    sideNav.addEventListener('transitionend', () => {
                        sideNav.hidden = true;
                    }, {once: true});
                }
            }
        </script>
        <script>
            document.querySelector('.menu-icon').addEventListener('click', function (event) {
                event.stopPropagation(); // Ngăn chặn sự lan truyền sự kiện click đến sideNav
            });

            document.addEventListener('click', function (event) {
                var sideNavWrapper = document.getElementById('sideNavWrapper');
                var menuIcon = document.querySelector('.menu-icon');
                if (event.target !== menuIcon && !sideNavWrapper.contains(event.target)) {
                    // Nếu không phải là menuIcon hoặc con của sideNavWrapper được click
                    var sideNav = document.getElementById('sideNav');
                    sideNav.classList.remove('show');
                    sideNav.addEventListener('transitionend', function () {
                        sideNav.hidden = true;
                    }, {once: true});

                    menuIcon.classList.remove('change');
                }
            });

        </script>
        <script>
            document.getElementById('scrollToTopButton').addEventListener('click', function () {
                window.scrollTo({top: 0, behavior: 'smooth'});
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