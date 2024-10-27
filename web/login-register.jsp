<%-- 
    Document   : LoginRegister
    Created on : Jul 1, 2024, 11:20:46 AM
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
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link rel="stylesheet" href="css/login-register.css">
        <style>
            .error-container {
                text-align: center;
                margin-bottom: 20px;
            }

            .error-message {
                color: red;
                margin-top: 10px;
                font-weight: bold;
                font-size: 14px;
            }
            .complete-message {
                color: green;
                margin-top: 10px;
                font-weight: bold;
                font-size: 16px;
            }

        </style>
        <title>StayEase - SignIn/SignUp</title>
    </head>

    <body>
        <div class="error-container">
            <c:if test="${not empty error}">
                <p class="error-message">${error}</p>
            </c:if>
            <c:if test="${not empty complete}">
                <p class="complete-message">${complete}</p>
            </c:if>
        </div>
        <div class="container" id="container">
            <div class="form-container sign-up">
                <form action="login" method="POST">
                    <h1>Create Account</h1>
                    <div class="social-icons">
                        <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                    </div>
                    <span>or use your email for registration</span>
                    <input class="input-info" type="text" placeholder="Username" name="username" required>
                    <input class="input-info" type="email" placeholder="Email" name="email" required />
                    <input class="input-info" type="password" placeholder="Password" name="password" id="signup-password" required>
                    <input class="input-info" type="password" placeholder="Confirm Password" name="confirmpassword" id="signup-confirm-password" required>
                    <div class="show-password">
                        <input type="checkbox" id="show-signup-password">
                        <label for="show-signup-password">Show Password</label>
                    </div>
                    <button name="button" value="signUp" class="form-btn" type="Submit" >Sign Up</button>
                </form>
            </div>
            <div class="form-container sign-in">
                <form action="login" method="POST">
                    <div class="logo-container">
                        <img class="img-logo1" src="img/logo_remove.png" alt="StayEase">
                    </div><br>
                    <h1>Sign In</h1>
                    <div class="social-icons">
                        <a href="#" class="icon"><i class="fa-brands fa-google-plus-g"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-github"></i></a>
                        <a href="#" class="icon"><i class="fa-brands fa-linkedin-in"></i></a>
                    </div>
                    <span>or use your account</span>
                    <input class="input-info" type="text" placeholder="Username" name="username" required>
                    <input class="input-info" type="password" placeholder="Password" name="password" id="signin-password" required> 
                    <div class="show-password">
                        <input type="checkbox" id="show-signin-password">
                        <label for="show-signin-password">Show Password</label>
                    </div>
                    <a href="#" class="forget-btn">Forget Your Password?</a>
                    <button name="button" value="signIn" class="form-btn" type="Submit">Sign In</button>
                </form>
            </div>      
            <div class="toggle-container">
                <div class="toggle">
                    <div class="toggle-panel toggle-left">
                        <img class="img-logo2" src="img/logo_remove.png" alt="StayEase">
                        <p>Let's register. It's quick and easy.</p>
                        <button class="hidden signin-btn" id="login">Already have an account? Signin.</button>
                    </div>
                    <div class="toggle-panel toggle-right">
                        <h1>Welcome Back!</h1>
                        <p>Enter your personal details to use all of site features</p>
                        <button class="hidden signup-btn" id="register">No account yet? Signup.</button>
                    </div>
                </div>
            </div>
        </div>
        <a href="index.jsp" class="back-btn">Back to Homepage</a>
        <script src="js/login-register.js"></script>
        <script>
            window.onload = function () {
                if (window.history.replaceState) {
                    window.history.replaceState(null, null, window.location.href);
                }
            }
        </script>

    </body>

</html>
