<%-- 
    Document   : admin
    Created on : Jul 1, 2024, 11:47:10 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" type="x-icon" href="img/only-logo.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>StayEase - Admin Homepage</title>
    <link rel="stylesheet" href="css/admin.css">
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
                <a class="navbar-brand logo_h" href="index.jsp"><img src="img/logo_remove_2.png"></a>
                <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse"
                    data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                    aria-label="Toggle navigation">
                    <span class="fas fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                    <ul class="nav navbar-nav menu_nav ml-auto">
                        <li class="nav-item"><a class="nav-link" href="aboutus.jsp">ABOUT US</a></li>
                        <li class="nav-item"><a class="nav-link" href="discovery.jsp">DISCOVERY</a></li>
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="#" class="dropdown-toggle">ADMIN</a>
                            <ul class="dropdown-menu">
                                <li><a href="homestay-manage">Manage Homestay</a></li>
                                <li><a href="user-manage">Manage Users</a></li>
                                <li><a href="booking-manage">Manage Orders</a></li>
                                <li><a href="logout">Log Out</a></li>
                            </ul>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="contactus.jsp">CONTACT US</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <!-- End Header Area -->

    <!-- Admin Content -->
    <section id="admin-content">
        <h2>Admin Homepage</h2>
        <div class="admin-options">
            <div class="admin-functions">
                <div class="function">
                    <h3>Manage Homestay</h3>
                    <p>Add, delete, and update homestay listings.</p>
                    <a href="homestay-manage" class="btn btn-primary">Go to Homestay Management</a>
                </div>
                <div class="function">
                    <h3>Manage Users</h3>
                    <p>Add, delete, and update user profiles.</p>
                    <a href="user-manage" class="btn btn-primary">Go to User Management</a>
                </div>
                <div class="function">
                    <h3>Manage Orders</h3>
                    <p>View, update, and manage booking orders.</p>
                    <a href="booking-manage" class="btn btn-primary">Go to Order Management</a>
                </div>
            </div>
        </div>
    </section>
    <!-- End Admin Content -->

    <!-- Footer -->
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
        document.getElementById('scrollToTopButton').addEventListener('click', function () {
            window.scrollTo({ top: 0, behavior: 'smooth' });
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
