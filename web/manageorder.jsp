<%-- 
    Document   : manageuser
    Created on : Jul 1, 2024, 3:28:03 PM
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
        <title>StayEase - Manage Order</title>
        <link rel="stylesheet" href="css/manageuser.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Playwrite+US+Trad:wght@100..400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script>
            function showModal() {
                document.getElementById('addUserModal').style.display = 'block';
            }

            function hideModal() {
                document.getElementById('addUserModal').style.display = 'none';
            }
            function openModal(modalId) {
                document.getElementById(modalId).style.display = 'block';
            }
        </script>
        <style>
            /* Modal */
            .modal {
                display: none;
                position: fixed;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 9999;
                overflow: auto;
            }

            /* Modal Content */
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #ccc;
                width: 80%;
                max-width: 600px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                border-radius: 8px;
            }

            /* Close Button */
            .modal-content .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                cursor: pointer;
            }

            .modal-content .close:hover,
            .modal-content .close:focus {
                color: black;
                text-decoration: none;
            }

            /* Form inside the modal */
            .modal-content form {
            }

            /* Labels for inputs */
            .modal-content label {
                font-weight: bold;
                display: block;
                margin-bottom: 8px;
            }

            /* Input fields */
            .modal-content input[type="text"],
            .modal-content input[type="email"],
            .modal-content input[type="date"],
            .modal-content input[type="tel"],
            .modal-content textarea,
            .modal-content select,
            .modal-content input[type="file"] {
                width: calc(100% - 20px);
                padding: 12px;
                border: 1px solid #ccc;
                border-radius: 4px;
                font-size: 14px;
                transition: border-color 0.3s ease;
                box-sizing: border-box;
            }

            /* Input focus state */
            .modal-content input:focus,
            .modal-content textarea:focus {
                border-color: #009688; /* Highlight border color on focus */
                outline: none; /* Remove default outline */
            }

            /* Textarea */
            .modal-content textarea {
                resize: vertical; /* Allow vertical resizing */
                min-height: 80px; /* Minimum height for textarea */
            }

            /* Submit button */
            .modal-content .btn-submit {
                background-color: #009688;
                color: white;
                border: none;
                padding: 12px 20px;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .modal-content .btn-submit:hover {
                background-color: #00796b;
            }

            /* Cancel button */
            .modal-content .btn-cancel {
                background-color: #f44336;
                color: white;
                border: none;
                padding: 12px 20px;
                border-radius: 4px;
                cursor: pointer;
                transition: background-color 0.3s ease;
            }

            .modal-content .btn-cancel:hover {
                background-color: #d32f2f;
            }

            /* Button container */
            .modal-content .form-buttons {
                text-align: center;
            }

            /* Hover effect for buttons */
            .modal-content .form-buttons button:hover {
                opacity: 0.8;
            }

        </style>
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

        <section id="manage-user">
            <h2>Manage Order</h2>
            
            <table class="user-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>UserID</th>
                        <th>HomestayID</th>
                        <th>OrderDate</th>
                        <th>CheckInDate</th>
                        <th>CheckOutDate</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <c:forEach var="c" items="${sessionScope.listBooking}">
                    <tbody>
                        
                        <tr>
                            <td>${c.bookingID}</td>
                            <td>${c.userID}</td>
                            <td>${c.homestayID}</td>
                            <td>${c.orderDate}</td>
                            <td>${c.checkInDate}</td>
                            <td>${c.checkOutDate}</td>
                            <td>${c.status}</td>
                            <td>
                                <form action="booking-manage" method="POST">
                                    <input type="hidden" name="bookingID" value="${c.bookingID}">
                                    <button type="submit" name="button" value="confirm" class="btn-edit">Confirm</button>
                                </form>
                                <button onclick="openModal('deleteModal${c.bookingID}')" type="submit" name="button" value="delete" class="btn-delete">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
            <c:forEach var="c" items="${sessionScope.listBooking}">
                <!-- Modal for Delete Homestay -->
                <div id="deleteModal${c.bookingID}" class="modal">
                    <div class="modal-content">
                        <span class="close" onclick="document.getElementById('deleteModal${c.userID}').style.display = 'none'">&times;</span>
                        <h2>Delete User</h2>
                        <p>Are you sure you want to delete this booking "${c.bookingID}"?</p>
                        <form action="booking-manage" method="POST">
                            <input type="hidden" name="bookingID" value="${c.bookingID}">
                            <div class="form-buttons">
                                <button type="submit" name="button" value="delete" class="btn-submit">Delete</button>
                                <button type="button" onclick="document.getElementById('deleteModal${c.bookingID}').style.display = 'none'" class="btn-cancel">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </section>

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



