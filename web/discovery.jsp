<%-- 
    Document   : discovery
    Created on : Jul 1, 2024, 3:25:58 PM
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
        <title>StayEase - Discovery</title>
        <link
            href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Playwrite+US+Trad:wght@100..400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
        <link rel="stylesheet" href="css/discovery.css">
        <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
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
            #msg {
                font-size: 16px;
                color: #fff;
                padding-top: 5px;

            }
        </style>
    </head>

    <body>

        <header>
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
                            <li><a href="contactus.jsp">CONTACT US</a></li>
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
                        </ul>
                    </nav>
                </div>
            </div>
        </header>

        <!-- Content -->
        <div id="sideDes">
            <h1>Explore Destination in<br>Viet Nam</h1>
            <div class="container">
                <div class="slide">
                    <div class="item" style="background-image: url(img/hanoi2.jpg);">
                        <div class="content">
                            <div class="name">Hanoi</div>
                            <div class="des">Hanoi - A vibrant city famous for its ancient streets and diverse cuisine.
                            </div>
                            <button>See More</button>
                        </div>
                    </div>
                    <div class="item" style="background-image: url(img/hcm2.jpg);">
                        <div class="content">
                            <div class="name">Ho Chi Minh City</div>
                            <div class="des">Ho Chi Minh City - The bustling economic hub of Vietnam, known for its cultural
                                heritage and delightful cuisine.</div>
                            <button>See More</button>
                        </div>
                    </div>
                    <div class="item" style="background-image: url(img/danang1.jpg);">
                        <div class="content">
                            <div class="name">Da Nang</div>
                            <div class="des">Da Nang - A coastal city with beautiful beaches and a relaxed atmosphere.</div>
                            <button>See More</button>
                        </div>
                    </div>
                    <div class="item" style="background-image: url(img/halongbay.jpg);">
                        <div class="content">
                            <div class="name">Ha Long Bay</div>
                            <div class="des">Ha Long Bay - Famous for its emerald waters and thousands of towering limestone
                                islands topped with rainforests.</div>
                            <button>See More</button>
                        </div>
                    </div>
                    <div class="item" style="background-image: url(img/ninhbinh.jpg);">
                        <div class="content">
                            <div class="name">Ninh Binh</div>
                            <div class="des">Ninh Binh - Known for its stunning landscapes of limestone karsts and tranquil
                                countryside.</div>
                            <button>See More</button>
                        </div>
                    </div>
                    <div class="item" style="background-image: url(img/sapa2.jpg);">
                        <div class="content">
                            <div class="name">Sapa</div>
                            <div class="des">Sapa - Located in the northern mountains, famous for its terraced rice fields
                                and rich cultural diversity.</div>
                            <button>See More</button>
                        </div>
                    </div>
                </div>
                <div class="button">
                    <button class="prev"><i class="fa-solid fa-arrow-left"></i></button>
                    <button class="next"><i class="fa-solid fa-arrow-right"></i></button>
                </div>
            </div>
        </div>

        <div id="sideFood">
            <section id="rcm-food">
                <div class="container">
                    <h1 class="text-center section-heading">Food Recommend</h1>
                </div>
                <div class="container">
                    <div class="swiper rcm-food-slider">
                        <div class="swiper-wrapper">
                            <!-- Slide-start -->
                            <div class="swiper-slide rcm-food-slide">
                                <div class="rcm-food-slide-img">
                                    <img src="img/pho.jpg" alt="rcm-food">
                                </div>
                                <div class="rcm-food-slide-content">

                                    <div class="rcm-food-slide-content-bottom">
                                        <h2 class="food-name">
                                            PHO
                                        </h2>
                                        <h1 class="food-price">Price:<br>20,000VND-100,000VND</h1>
                                    </div>
                                </div>
                            </div>
                            <!-- Slide-end -->
                            <!-- Slide-start -->
                            <div class="swiper-slide rcm-food-slide">
                                <div class="rcm-food-slide-img">
                                    <img src="img/banhchung.png" alt="rcm-food">
                                </div>
                                <div class="rcm-food-slide-content">

                                    <div class="rcm-food-slide-content-bottom">
                                        <h2 class="food-name">
                                            BANH CHUNG
                                        </h2>
                                        <h1 class="food-price">Price:<br>30,000VND-100,000VND</h1>
                                    </div>
                                </div>
                            </div>
                            <!-- Slide-end -->
                            <!-- Slide-start -->
                            <div class="swiper-slide rcm-food-slide">
                                <div class="rcm-food-slide-img">
                                    <img src="img/banhmi.jpg" alt="rcm-food">
                                </div>
                                <div class="rcm-food-slide-content">

                                    <div class="rcm-food-slide-content-bottom">
                                        <h2 class="food-name">
                                            BANH MI
                                        </h2>
                                        <h1 class="food-price">Price:<br>10,000VND-30,000VND</h1>
                                    </div>
                                </div>
                            </div>
                            <!-- Slide-end -->
                            <!-- Slide-start -->
                            <div class="swiper-slide rcm-food-slide">
                                <div class="rcm-food-slide-img">
                                    <img src="img/banhtrangcuonthitheo.jpg" alt="rcm-food">
                                </div>
                                <div class="rcm-food-slide-content">

                                    <div class="rcm-food-slide-content-bottom">
                                        <h2 class="food-name">
                                            BANH TRANG CUON THIT HEO
                                        </h2>
                                        <h1 class="food-price">Price:<br>45,000VND-100,000VND</h1>
                                    </div>
                                </div>
                            </div>
                            <!-- Slide-end -->
                            <!-- Slide-start -->
                            <div class="swiper-slide rcm-food-slide">
                                <div class="rcm-food-slide-img">
                                    <img src="img/banhbotloc.jpg" alt="rcm-food">
                                </div>
                                <div class="rcm-food-slide-content">

                                    <div class="rcm-food-slide-content-bottom">
                                        <h2 class="food-name">
                                            BANH BOT LOC
                                        </h2>
                                        <h1 class="food-price">Price:<br>2,000VND-5,000VND</h1>
                                    </div>
                                </div>
                            </div>
                            <!-- Slide-end -->
                            <!-- Slide-start -->
                            <div class="swiper-slide rcm-food-slide">
                                <div class="rcm-food-slide-img">
                                    <img src="img/chethai.jpg" alt="rcm-food">
                                </div>
                                <div class="rcm-food-slide-content">

                                    <div class="rcm-food-slide-content-bottom">
                                        <h2 class="food-name">
                                            CHE THAI
                                        </h2>
                                        <h1 class="food-price">Price:<br>20,000VND-50,000VND</h1>
                                    </div>
                                </div>
                            </div>
                            <!-- Slide-end -->
                            <!-- Slide-start -->
                            <div class="swiper-slide rcm-food-slide">
                                <div class="rcm-food-slide-img">
                                    <img src="img/banhxeo.jpg" alt="rcm-food">
                                </div>
                                <div class="rcm-food-slide-content">

                                    <div class="rcm-food-slide-content-bottom">
                                        <h2 class="food-name">
                                            BANH XEO
                                        </h2>
                                        <h1 class="food-price">Price:<br>7,000VND-30,000VND</h1>
                                    </div>
                                </div>
                            </div>
                            <!-- Slide-end -->
                        </div>

                        <div class="rcm-food-slider-control">
                            <div class="swiper-button-prev slider-arrow">
                                <ion-icon name="arrow-back-outline"></ion-icon>
                            </div>
                            <div class="swiper-button-next slider-arrow">
                                <ion-icon name="arrow-forward-outline"></ion-icon>
                            </div>
                            <div class="swiper-pagination"></div>
                        </div>

                    </div>
                </div>
            </section>
        </div>

        <!-- FOOTER -->

        <footer class="footer-distributed">
            <div class="footer-left">
                <img src="img/logo_remove_2.png" alt="Logo">
                <p class="footer-links">
                    <a href="index.html">Home</a>
                    |
                    <a href="aboutus.html">About</a>
                    |
                    <a href="contactus.html">Contact</a>
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
            let next = document.querySelector('.next')
            let prev = document.querySelector('.prev')

            next.addEventListener('click', function () {
                let items = document.querySelectorAll('.item')
                document.querySelector('.slide').appendChild(items[0])
            })

            prev.addEventListener('click', function () {
                let items = document.querySelectorAll('.item')
                document.querySelector('.slide').prepend(items[items.length - 1]) // here the length of items = 6
            })
        </script>
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
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
        <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
        <script src="js/discovery.js"></script>
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