<%-- 
    Document   : managehomestay
    Created on : Jul 1, 2024, 3:26:45 PM
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
        <title>StayEase - Manage Homestay</title>
        <link rel="stylesheet" href="css/managehomestay.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Playwrite+US+Trad:wght@100..400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <script>
            function showModal() {
                document.getElementById('addHomestayModal').style.display = 'block';
            }

            function hideModal() {
                document.getElementById('addHomestayModal').style.display = 'none';
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

        <section id="manage-homestay">
            <h2>Manage Homestays</h2>
            <button class="btn-addNew" onclick="showModal()" style="background-color: #009688; color: white; border: none; padding: 10px 20px; text-align: center; display: block; width: 200px; margin: 20px auto;">Add New Homestay</button>


            <!-- The Modal -->
            <div id="addHomestayModal" class="modal">
                <div class="modal-content">
                    <span class="close" onclick="hideModal()">&times;</span>
                    <h2>Add New Homestay</h2>
                    <form action="homestay-manage" method="POST">
                        <label for="homeStayName">Name:</label>
                        <input type="text" id="homeStayName" name="homeStayName" required><br><br>

                        <label for="homeStayType">Type:</label>
                        <input type="text" id="homeStayType" name="homeStayType" required><br><br>

                        <label for="location">Location:</label>
                        <input type="text" id="location" name="location" required><br><br>

                        <label for="description">Description:</label><br>
                        <textarea id="description" name="description" rows="4" cols="50"></textarea><br><br>

                        <label for="contactNumber">Contact Number:</label>
                        <input type="text" id="contactNumber" name="contactNumber"><br><br>

                        <label for="homeStayImg">Image URL:</label>
                        <input type="text" id="homeStayImg" name="homeStayImg"><br><br>

                        <label for="feedback">Feedback:</label><br>
                        <textarea id="feedback" name="feedback" rows="4" cols="50"></textarea><br><br>

                        <button type="submit" name="button" value="add" style="background-color: #009688; color: white; border: none; padding: 12px 20px; border-radius: 4px; cursor: pointer; transition: background-color 0.3s ease;">Add Homestay</button>

                        <button type="button" onclick="hideModal()" style="background-color: #f44336; color: white; border: none; padding: 12px 20px; border-radius: 4px; cursor: pointer; transition: background-color 0.3s ease;">Cancel</button>

                    </form>
                </div>
            </div>
            <table class="homestay-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Property Type</th>
                        <th>Location</th>
                        <th>Description</th>
                        <th>Contact Number</th>
                        <th>Link Image</th>
                        <th>Feedback</th>
                        <th>More Detail</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <c:forEach var="c" items="${sessionScope.listHomeStay}">
                    <tbody>
                        <tr>
                            <td>${c.homeStayID}</td>
                            <td>${c.homeStayName}</td>
                            <td>${c.homeStayType}</td>
                            <td>${c.homeStayLocation}</td>
                            <td>${c.homeStayDescription}</td>
                            <td>${c.homeStayContactNumber}</td>
                            <td>${c.homeStayImg}</td>
                            <td>${c.homeStayFeedback}</td>
                            <td>
                                <a href="homestaydetail-manage?homeStayID=${c.homeStayID}">Edit</a>
                            </td>
                            <td>
                                <button value="${c.homeStayID}" onclick="openModal('editModal${c.homeStayID}')" type="submit" class="btn-edit">Edit</button>
                                <button value="${c.homeStayID}" onclick="openModal('deleteModal${c.homeStayID}')" type="submit" class="btn-delete">Delete</button>
                            </td>
                        </tr>
                    </tbody>
                </c:forEach>
            </table>
            <c:forEach var="c" items="${sessionScope.listHomeStay}">
                <!-- Modal for Edit Homestay -->
                <div id="editModal${c.homeStayID}" class="modal">
                    <div class="modal-content">
                        <span class="close" onclick="document.getElementById('editModal${c.homeStayID}').style.display = 'none'">&times;</span>
                        <h2>Edit Homestay</h2>
                        <form action="homestay-manage" method="POST">
                            <input type="hidden" name="homeStayID" value="${c.homeStayID}">
                            <label>Name:</label>
                            <input type="text" id="homeStayName${c.homeStayID}" name="homeStayName" value="${c.homeStayName}" ><br><br>
                            <label>Type:</label>
                            <input type="text" id="homeStayType${c.homeStayID}" name="homeStayType" value="${c.homeStayType}" ><br><br>
                            <label>Location:</label>
                            <input type="text" id="location${c.homeStayID}" name="location" value="${c.homeStayLocation}" ><br><br>
                            <label>Description:</label>
                            <textarea id="description${c.homeStayID}" name="description" value="${c.homeStayDescription}" rows="4" cols="50">${c.homeStayDescription}</textarea><br><br>
                            <label>Contact Number:</label>
                            <input type="text" id="contactNumber${c.homeStayID}" name="contactNumber" value="${c.homeStayContactNumber}"><br><br>
                            <label>Image URL:</label>
                            <input type="text" id="homeStayImg${c.homeStayID}" name="homeStayImg" value="${c.homeStayImg}"><br><br>
                            <label>Feedback:</label>
                            <textarea id="feedback${c.homeStayID}" name="feedback" value="${c.homeStayFeedback} rows="4" cols="50">${c.homeStayFeedback}</textarea><br><br>
                            <div class="form-buttons">
                                <c:set var="id" value="${c.homeStayID}"/>
                                <input type="hidden" name="homeStayID" value="${id}"><br><br>
                                <button type="submit" name="button" value="edit" class="btn-submit">Save Changes</button>
                                <button type="button" onclick="document.getElementById('editModal${c.homeStayID}').style.display = 'none'" class="btn-cancel">Cancel</button>
                            </div>
                        </form>
                    </div>
                </div>
            </c:forEach>

            <c:forEach var="c" items="${sessionScope.listHomeStay}">
                <!-- Modal for Delete Homestay -->
                <div id="deleteModal${c.homeStayID}" class="modal">
                    <div class="modal-content">
                        <span class="close" onclick="document.getElementById('deleteModal${c.homeStayID}').style.display = 'none'">&times;</span>
                        <h2>Delete Homestay</h2>
                        <p>Are you sure you want to delete homestay "${c.homeStayName}"?</p>
                        <form action="homestay-manage" method="POST">   
                            <div class="form-buttons">
                                 <c:set var="id" value="${c.homeStayID}"/>
                                <input type="hidden" name="homeStayID" value="${id}">
                                <button type="submit" name="button" value="delete" class="btn-submit">Delete</button>
                                <button type="button" onclick="document.getElementById('deleteModal${c.homeStayID}').style.display = 'none'" class="btn-cancel">Cancel</button>
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
