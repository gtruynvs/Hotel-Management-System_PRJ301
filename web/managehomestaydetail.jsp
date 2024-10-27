<%-- 
    Document   : managehomestaydetail
    Created on : Jul 2, 2024, 1:05:37 PM
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
        <title>StayEase - Manage HomestayDetail</title>
        <link rel="stylesheet" href="css/managehomestaydetail.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Playwrite+US+Trad:wght@100..400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script> 
           function openModal(modalId) {
                document.getElementById(modalId).style.display = 'block';
            }
            function showModal() {
                document.getElementById('addDetailModal').style.display = 'block';
            }

            function hideModal() {
                document.getElementById('addDetailModal').style.display = 'none';
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
            .modal-content textarea,
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

        <section id="manage-homestaydetail">
            <h2>Manage HomestayDetail</h2>
            <table class="order-table">
                
<button class="btn-addNew" onclick="showModal()" style="background-color: #009688; color: white; border: none; padding: 10px 20px; text-align: center; display: block; width: 200px; margin: 20px auto;">Add New Detail</button>

                <div id="addDetailModal" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="hideModal()">&times;</span>
                    <h2>Add New Detail</h2>
                <form action="homestaydetail-manage" method="POST">
                        <label>Room Type:</label>
                        <input type="text" name="roomTypeID" value="" ><br><br>
                        
                        <label>Acreage:</label>
                        <input type="text"  name="acreage" value="" ><br><br>
                        
                        <label>Number of Rooms:</label>
                        <input type="text" name="numRoom" value="" ><br><br>
                        
                        <label>Number of Adults:</label>
                        <input type="text"  name="numAdult" value=""><br><br>
                        
                        <label>Number of Children:</label>
                        <input type="text" name="numChild" value=""><br><br>
                        
                        <label>Capacity:</label>
                        <input type="text" name="capacity" value=""><br><br>
                        
                        <label>Number of Beds:</label>
                        <input type="text" name="numBeds" value=""><br><br>
                        
                        <label>Number of Bathrooms:</label>
                        <input type="text" name="numBathroom" value=""><br><br>
                        
                        <label>Price:</label>
                        <input type="text"  name="price" value=""><br><br>

                        <button type="submit" name="button" value="add" style="background-color: #009688; color: white; border: none; padding: 12px 20px; border-radius: 4px; cursor: pointer; transition: background-color 0.3s ease;">Add Detail</button>

                        <button type="button" onclick="hideModal()" style="background-color: #f44336; color: white; border: none; padding: 12px 20px; border-radius: 4px; cursor: pointer; transition: background-color 0.3s ease;">Cancel</button>
                </form>
                </div>
            </div>
                
                
                
                <thead>
                    <tr>
                        <th>HomestayDetail ID</th>
                        <th>Room Type</th>
                        <th>Acreage</th>
                        <th>Number of Rooms</th>
                        <th>Number of Adults</th>
                        <th>Number of Children</th>
                        <th>Capacity</th>
                        <th>Number of Beds</th>
                        <th>Number of Bathrooms</th>
                        <th>Price</th>
                        <th>Actions</th>
                    </tr>
                </thead>

                <tbody>
                    <c:forEach var="s" items="${sessionScope.homestayMoreDetail}">
                        <tr>
                            <td>${s.homestayDetailID}</td>
                            <td>${s.roomTypeID}</td>
                            <td>${s.acreage}</td>
                            <td>${s.numRoom}</td>
                            <td>${s.numAdult}</td>
                            <td>${s.numChild}</td>
                            <td>${s.capacity}</td>
                            <td>${s.numBeds}</td>
                            <td>${s.numBathroom}</td>
                            <td>$${s.price}</td>
                            <td> 
                                <button value="${s.homestayDetailID}" onclick="openModal('editModal${s.homestayDetailID}')" type="submit" class="btn-edit">Edit</button>
                                <button value="${s.homestayDetailID}" onclick="openModal('deleteModal${s.homestayDetailID}')" type="submit" class="btn-delete">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </section>
        <!-- comment -->
        <c:forEach var="s" items="${sessionScope.homestayMoreDetail}">
            <div id="editModal${s.homestayDetailID}" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="document.getElementById('editModal${s.homestayDetailID}').style.display = 'none'">&times;</span>
                    <h2>Edit HomestayDetail</h2>
                    <form action="homestaydetail-manage" method="POST">
                        <input type="hidden" name="homestayDetailID" value="${s.homestayDetailID}">
                        <label>Room Type:</label>
                        <input type="text" id="roomTypeID{s.roomTypeID}" name="roomTypeID" value="${s.roomTypeID}" ><br><br>
                        <label>Acreage:</label>
                        <input type="text" id="acreage{s.acreage}" name="acreage" value="${s.acreage}" ><br><br>
                        <label>Number of Rooms:</label>
                        <input type="text" id="numRoom{s.numRoom}" name="numRoom" value="${s.numRoom}" ><br><br>
                        <label>Number of Adults:</label>
                        <input type="text" id="numAdult{s.numAdult}" name="numAdult" value="${s.numAdult}"><br><br>
                        <label>Number of Children:</label>
                        <input type="text" id="numChild{s.numChild}" name="numChild" value="${s.numChild}"><br><br>
                        <label>Capacity:</label>
                        <input type="text" id="capacity{s.capacity}" name="capacity" value="${s.capacity}"><br><br>
                        <label>Number of Beds:</label>
                        <input type="text" id="numBeds{s.numBeds}" name="numBeds" value="${s.numBeds}"><br><br>
                        <label>Number of Bathrooms:</label>
                        <input type="text" id="numBathroom{s.numBathroom}" name="numBathroom" value="${s.numBathroom}"><br><br>
                        <label>Price:</label>
                        <input type="text" id="price{s.price}" name="price" value="${s.price}"><br><br>
                        <div class="form-buttons">
                            <input type="hidden" name="homestayDetailID" value="${s.homestayDetailID}"><br><br>
                            <input type="hidden" name="homeStayID" value="${requestScope.homeStayID}"><br><br>
                            <button type="submit" name="button" value="edit" class="btn-submit">Save Changes</button>
                            <button type="button" onclick="document.getElementById('editModal${s.homestayDetailID}').style.display = 'none'" class="btn-cancel">Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </c:forEach>
        <!-- Delte -->
        <c:forEach var="s" items="${sessionScope.homestayMoreDetail}">
        <div id="deleteModal${s.homestayDetailID}" class="modal">
                    <div class="modal-content">
                        <span class="close" onclick="document.getElementById('deleteModal${s.homestayDetailID}').style.display = 'none'">&times;</span>
                        <h2>Delete Homestay</h2>
                        <p>Are you sure you want to delete homestay "${s.homestayDetailID}"?</p>
                        <form action="homestaydetail-manage" method="POST">   
                            <div class="form-buttons">
                                <input type="hidden" name="homestayDetailID" value="${s.homestayDetailID}">
                                <input type="hidden" name="homeStayID" value="${requestScope.homeStayID}">
                                <button type="submit" name="button" value="delete" class="btn-submit">Delete</button>
                                <button type="button" onclick="document.getElementById('deleteModal${s.homestayDetailID}').style.display = 'none'" class="btn-cancel">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
        </c:forEach>
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