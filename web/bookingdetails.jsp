<%-- 
    Document   : bookingdetails
    Created on : Jul 9, 2024, 11:20:19 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>StayEase - Booking Details</title>
        <link rel="stylesheet" href="css/bookingdetails.css">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Playwrite+US+Trad:wght@100..400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            #msg {
                font-size: 16px;
                color: #fff;
                padding-top: 5px;

            }
        </style>
    </head>
    <style>
        #booking {
            margin-top: 120px;
            margin-bottom: 40px;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            flex-wrap: wrap;
        }

        #booking .booking-infor {
            flex: 1;
            padding: 40px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 10px 30px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .booking-infor .room-type {
            padding-top: 20px;
        }

        .booking-infor img {
            width: 500px;
            border-radius: 10%;
        }

        .booking-infor:hover {
            transform: scale(1.05);
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }

        .booking-actions {
            display: flex;
            justify-content: space-around;
            margin-top: 20px;
        }

        .booking-actions .details span {
            color: #009688;
            font-weight: bold;
        }

        .booking-actions a {
            padding: 10px 20px;
            background-color: #009688;
            color: #fff;
            text-decoration: none;
            border-radius: 3px;
            transition: background-color 0.3s, transform 0.3s;
        }

        .booking-actions a:hover {
            background-color: #00796b;
            transform: scale(1.05);
        }

        .booking-detail {
            flex: 3;
            background-color: #fff;
            padding: 40px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin: 10px;
        }

        .booking-detail h2 {
            font-family: "Playwrite US Trad", cursive;
            color: #009688;
            margin-bottom: 20px;
            font-size: 50px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            color: #009688;
        }

        #book-btn {
            display: block;
            width: 100%;
            padding: 15px;
            margin-top: 20px;
            background-color: #009688;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        #book-btn:hover {
            background-color: #00796b;
            transform: scale(1.05);
        }


        input[type="text"],
        input[type="date"],
        input[type="email"],
        input[type="tel"],
        input[type="number"],
        textarea,
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        textarea {
            resize: vertical;
        }

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fff;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            border-radius: 10px; /* Rounded corners */
            box-shadow: 0 5px 15px rgba(0,0,0,0.3); /* Box shadow */
            animation: fadeIn 0.5s; /* Fade in animation */
        }

        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
            cursor: pointer;
            transition: color 0.3s;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
        }

        .error {
            color: red; /* Or any other styling you prefer */
        }

        /* Fade in animation */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }


    </style>
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

        <section id="booking">
            <div class="booking-infor">
                <img class="booking-img" src="img/${sessionScope.image}" alt="Image">
                <div class="room-type">
                    <label for="roomType">Information Details:</label>
                </div>
                <div class="booking-actions">
                    <div class="details">
                        <p>Price: <span id="roomPrice">${sessionScope.price}</span> VND per night</p>
                        <p>Name: <span>${sessionScope.name}</span></p>
                        <p>Type of Room:<span>${sessionScope.roomtype}</span></p>
                        <p>Acreage: <span>${sessionScope.acreage}</span></p>
                        <p>Number of Rooms: <span>${sessionScope.numRoom}</span></p>
                        <p>Number of Adults: <span>${sessionScope.numAdult}</span></p>
                        <p>Number of Children: <span>${sessionScope.numChild}</span></p>
                        <p>Capacity: <span>${sessionScope.capacity}</span></p>
                        <p>Number of Beds: <span>${sessionScope.numBed}</span></p>
                        <p>Number of Bathrooms: <span>${sessionScope.numBath}</span></p>
                    </div>
                </div>
            </div>
            <div class="booking-detail">
                <h2>Booking Details</h2>
                <form action="booking" method="POST">
                    <c:set var="x" value="${sessionScope.user}"/>
                    <div class="form-group">
                        <label for="fullName">Full Name:</label>
                        <input type="text" id="fullName" name="fullName" value="${x.firstName} ${x.lastName}" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone:</label>
                        <input type="tel" id="phone" name="phone" value="${x.phone}" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <textarea id="address" name="address" rows="2" required>${x.address}</textarea>
                    </div>
                    <div class="form-group">
                        <label for="phone">Email:</label>
                        <input type="text" id="email" name="email" value="${x.email}" required>
                    </div>
                    <div class="form-group">
                        <label for="checkin">Check-In:</label>
                        <input type="date" id="checkin" name="checkin" required>
                    </div>
                    <div class="form-group">
                        <label for="checkout">Check-Out:</label>
                        <input type="date" id="checkout" name="checkout" required>
                    </div>
                    <div class="form-group">
                        <label for="numDays">Number of Days:</label>
                        <input type="number" id="numDays" name="numDays" required readonly>
                    </div>
                    <div class="form-group">
                        <label for="totalAmount">Total Amount (VND):</label>
                        <input type="text" id="totalAmount" name="totalAmount" readonly>
                    </div>                          
                    <input type="hidden" value="${sessionScope.homestayID}" name="homestayID">
                    <input type="hidden" value="${sessionScope.roomtype}" name="roomType" >
                    <input type="hidden" value="${sessionScope.name}" name="stayName" >
                    <input type="hidden" value="${sessionScope.acreage}" name="acreage" >
                    <input type="hidden" value="${sessionScope.numRoom}" name="numRoom" >
                    <input type="hidden" value="${sessionScope.numAdult}" name="numAdult" >
                    <input type="hidden" value="${sessionScope.numChild}" name="numChild" >
                    <input type="hidden" value="${sessionScope.capacity}" name="capacity" >
                    <input type="hidden" value="${sessionScope.numBed}" name="numBed" >
                    <input type="hidden" value="${sessionScope.numBath}" name="numBath" > 
                    <button type="submit" id="book-btn">Book Now</button>
                </form>
            </div>
            <c:if test="${not empty error}">
                <div id="errorModal" class="modal">
                    <div class="modal-content">
                        <span class="close">&times;</span>
                        <p>${error}</p>
                    </div>
                </div>
            </c:if>


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
                <form name="submit-to-google-sheet" id="newsletter-form">
                    <input type="email" id="newsletter-email" name="Email" placeholder="Enter your email" required>
                    <button type="submit"><i class="fas fa-arrow-right"></i></button>
                </form>
                <span id="msg"></span>
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
        <script>

            const scriptURL = 'https://script.google.com/macros/s/AKfycbyEo0g4xdMEoix91SvaKl-m639nDN8bcQCqBVC9yjW5yo_gd08ZI9hm6OmFFmy10_Kn8g/exec';
            const form = document.forms['submit-to-google-sheet'];

            form.addEventListener('submit', e => {
                e.preventDefault();
                fetch(scriptURL, {method: 'POST', body: new FormData(form)})
                        .then(response => {
                            msg.innerHTML = "Successfully! Thank You."
                            setTimeout(function () {
                                msg.innerHTML = ""
                            }, 2000)
                            form.reset()
                        })
                        .catch(error => console.error('Error!', error.message));
            });


        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const checkinInput = document.getElementById('checkin');
                const checkoutInput = document.getElementById('checkout');
                const numDaysInput = document.getElementById('numDays');
                const totalAmountInput = document.getElementById('totalAmount');
                const priceElement = document.getElementById('roomPrice');
                const price = parseInt(priceElement.textContent);

                function calculateDaysAndTotal() {
                    const checkinDate = new Date(checkinInput.value);
                    const checkoutDate = new Date(checkoutInput.value);

                    if (checkinDate && checkoutDate && checkoutDate > checkinDate) {
                        const timeDiff = checkoutDate.getTime() - checkinDate.getTime();
                        const numDays = Math.ceil(timeDiff / (1000 * 3600 * 24));
                        numDaysInput.value = numDays;
                        const totalAmount = numDays * price;
                        totalAmountInput.value = totalAmount.toLocaleString('en-US');
                    } else {
                        numDaysInput.value = '';
                        totalAmountInput.value = '';
                    }
                }

                checkinInput.addEventListener('change', calculateDaysAndTotal);
                checkoutInput.addEventListener('change', calculateDaysAndTotal);
            });
        </script>
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
        <script>
            window.onload = function () {
                var modal = document.getElementById("errorModal");

                if (modal) {
                    modal.style.display = "block";

                    // Close the modal after 2 seconds
                    setTimeout(function () {
                        modal.style.display = "none";
                    }, 2000);

                    // Get the <span> element that closes the modal
                    var span = document.getElementsByClassName("close")[0];

                    // When the user clicks on <span> (x), close the modal
                    span.onclick = function () {
                        modal.style.display = "none";
                    }

                    // When the user clicks anywhere outside of the modal, close it
                    window.onclick = function (event) {
                        if (event.target == modal) {
                            modal.style.display = "none";
                        }
                    }
                }
            }
        </script>

    </body>

</html>