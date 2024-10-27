<%-- 
    Document   : aboutus
    Created on : Jul 1, 2024, 3:24:29 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" type="x-icon" href="img/only-logo.png">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>StayEase - About Us</title>
        <link rel="stylesheet" href="css/aboutus.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Pacifico&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Playwrite+US+Trad:wght@100..400&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <script src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
        <style>
            .dropdown-menu {
                display: none;
                position: absolute;
                background-color: #045048;
                color: #fff;
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
        <fmt:setLocale value="${sessionScope.lang}"/>
        <fmt:setBundle basename="language.lang"/>
        <header class="header_area">
            <div class="container">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="navbar-brand logo_h" href="homepage"><img src="img/logo_remove_2.png"></a>
                    <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse"
                            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="fas fa-bars"></span>
                    </button>
                    <div class="collapse navbar-collapse offset" id="navbarSupportedContent">
                        <ul class="nav navbar-nav menu_nav ml-auto">
                            <li class="nav-item active"><a class="nav-link" href="homepage"><fmt:message>home.home</fmt:message></a></li> 
                            <li class="nav-item"><a class="nav-link" href="discovery.jsp"><fmt:message>home.discovery</fmt:message></a></li>
                            <li class="nav-item"><a class="nav-link" href="#contact"><fmt:message>home.contact</fmt:message></a></li>

                            <c:if test="${empty user}">
                                <li class="nav-item"><a class="nav-link" href="login"><fmt:message>home.login</fmt:message></a></li>
                                </c:if>
                                <c:if test="${not empty user}">
                                <li class="nav-item dropdown">
                                    <a class="nav-link" href="#" class="dropdown-toggle">PROFILE</a>
                                    <ul class="dropdown-menu">
                                        <li><a href="logout">LogOut</a></li>
                                        <li><a href="profile">Update Profile</a></li>
                                    </ul>
                                </li>
                            </c:if>
                            <li class="nav-item dropdown">
                                <a class="nav-link" href="#" class="dropdown-toggle"><fmt:message>home.language</fmt:message></a>
                                <ul class="dropdown-menu">
                                    <li class="nav-item active"><a class="nav-link" href="?lang=en_US">English</a></li>
                                    <li class="nav-item"><a class="nav-link" href="?lang=vi_VN">Vietnamese</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </header>
        <!-- End Header Area -->
        
        <section id="home" class="home">
            <div class="home-img">
                <img src="img/only-logo.png" alt="Profile Image">
            </div>
            <div class="home-content">
                <h3><fmt:message>home.header</fmt:message></h3>
                <h1><fmt:message>home.header2</fmt:message></h1>
                    <h3>Here is a <span class="multiple-text"></span>service</h3>
                    <p><fmt:message>home.content</fmt:message></p> <br>
                <p><fmt:message>home.content2</fmt:message></p>
                <div class="social-media">
                    <a href="#"><i class='bx bxl-linkedin'></i></a>
                    <a href="#"><i class='bx bxl-github'></i></a>
                    <a href="#"><i class='bx bxl-facebook'></i></a>
                    <a href="#"><i class='bx bxl-instagram'></i></a>
                </div>
            </div>
        </section>

        <div class="our-team">
            <h2 class="heading">Our <span>Team</span> </h2>
            <section id="about">
                <div class="about">
                    <div class="about-img">
                        <img src="img/male-avt.jpg" alt="">
                    </div>
                    <div class="about-content">
                        <h3>I'm <span>Nguyen Dinh Quoc Khoi</span></h3>
                        <p>-IT student: LEADER, Backend Developer-</p>
                    </div>
                    <div class="social-media">
                        <a href="#"><i class='bx bxl-linkedin'></i></a>
                        <a href="#"><i class='bx bxl-github'></i></a>
                        <a href="#"><i class='bx bxl-facebook'></i></a>
                        <a href="#"><i class='bx bxl-instagram'></i></a>
                    </div>
                </div>
                <div class="about">
                    <div class="about-img">
                        <img src="img/female-avt.jpg" alt="">
                    </div>
                    <div class="about-content">
                        <h3>I'm <span>Vo Ngoc Gia Truyen</span></h3>
                        <p>-IT student: Frontend Developer, Database Designer-</p>
                    </div>
                    <div class="social-media">
                        <a href="#"><i class='bx bxl-linkedin'></i></a>
                        <a href="#"><i class='bx bxl-github'></i></a>
                        <a href="#"><i class='bx bxl-facebook'></i></a>
                        <a href="#"><i class='bx bxl-instagram'></i></a>
                    </div>
                </div>
                <div class="about">
                    <div class="about-img">
                        <img src="img/female-avt.jpg" alt="">
                    </div>
                    <div class="about-content">
                        <h3>I'm <span>Huynh Vu Tuong Vy</span></h3>
                        <p>-IT student: Backend Developer-</p>
                    </div>
                    <div class="social-media">
                        <a href="#"><i class='bx bxl-linkedin'></i></a>
                        <a href="#"><i class='bx bxl-github'></i></a>
                        <a href="#"><i class='bx bxl-facebook'></i></a>
                        <a href="#"><i class='bx bxl-instagram'></i></a>
                    </div>
                </div>
                <div class="about">
                    <div class="about-img">
                        <img src="img/male-avt.jpg" alt="">
                    </div>
                    <div class="about-content">
                        <h3>I'm <span>Nguyen Xuan Linh</span></h3>
                        <p>-IT student: Backend Developer-</p>
                    </div>
                    <div class="social-media">
                        <a href="#"><i class='bx bxl-linkedin'></i></a>
                        <a href="#"><i class='bx bxl-github'></i></a>
                        <a href="#"><i class='bx bxl-facebook'></i></a>
                        <a href="#"><i class='bx bxl-instagram'></i></a>
                    </div>
                </div>
            </section>
        </div>

        <!-- Contact Section -->

        <section id="contact" class="contact">
            <h2 class="heading">Contact <span>Me</span></h2>
            <form id="contact-form">
                <div class="input-box">
                    <input type="text" id="name" placeholder="Full Name" required>
                    <input type="email" id="email" placeholder="Email Address" required>
                </div>
                <div class="input-box">
                    <input type="tel" id="phone" placeholder="Mobile Number" required>
                    <input type="text" id="subject" placeholder="Email Subject" required>
                </div>
                <textarea name="" id="message" placeholder="Your Message" cols="20" rows="10" required></textarea>
                <button type="submit" class="btn">Send Message</button>
            </form>
        </section>

        <!-- Footer -->
        <footer class="footer-distributed">
            <div class="footer-left">
                <img src="img/logo_remove_2.png" alt="Logo">
                <p class="footer-links">
                    <a href="user">Home</a>
                    |
                    <a href="#home">About</a>
                    |
                    <a href="#contact">Contact</a>
                </p>
            </div>
            <div class="footer-center">
                <h3>Contact</h3>
                <div class="contact-item">
                    <i class="fa fa-map-marker"></i>
                    <p>Hoa Hai, Ngu Hanh Son, Da Nang</p>
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
        <script src="https://unpkg.com/typed.js@2.1.0/dist/typed.umd.js"></script>
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
        <script>
            const typed = new Typed('.multiple-text', {
                strings: ['fast', 'convenient', 'simple', 'free', 'beautiful'],
                typeSpeed: 80,
                backSpeed: 80,
                backDelay: 1200,
                loop: true,
            });
        </script>
        <script>
            (function () {
                emailjs.init('JoBB8lIPuBiZ3B2qg');
            })();

            document.getElementById('contact-form').addEventListener('submit', function (event) {
                event.preventDefault();

                const name = document.getElementById('name').value;
                const email = document.getElementById('email').value;
                const phone = document.getElementById('phone').value;
                const subject = document.getElementById('subject').value;
                const message = document.getElementById('message').value;

                console.log('Form Data:', {name, email, phone, subject, message});

                emailjs.send('service_0gx93ar', 'template_wuntfpj', {
                    sendername: name,
                    senderemail: email,
                    phone: phone,
                    subject: subject,
                    message: message,
                })
                        .then(response => {
                            console.log('SUCCESS!', response.status, response.text);
                            alert('Your message has been sent successfully!');
                        })
                        .catch(error => {
                            console.log('FAILED...', error);
                            alert('There was an error sending your message. Please try again.');
                        });
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

    </body>

</html>