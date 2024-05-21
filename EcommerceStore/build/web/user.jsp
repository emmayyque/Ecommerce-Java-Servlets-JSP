<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<!DOCTYPE html>
<!--
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Html.html to edit this template
-->
<html>
    <head>
        <title>Login Page</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        
        <!-- Link to the Style Sheet -->
        <link rel="stylesheet" href="css/style.css">
        
        <!-- Link to Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <!-- Link to Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body>
        <button id="returnBtn"><a href="index.jsp">Return to Home</a></button>
        <section class="container" id="cont">
            <div class="frm">
                <div id="textCard">
                    <h1 id="textHeading">Welcome Back</h1>
                    <p id="textPara">Your presence brightens our digital space.
                        Please enter your credentials below to access
                        your account and continue your journey with us.
                        We're delighted to have you back, and we're
                        committed to ensuring a seamless and secure
                        experience. If you encounter any challenges
                        or have any questions, our support team
                        is here to assist you. Thank you for choosing us,
                        and let's make your time here exceptional!</p>
                </div>
                <div>
                    <div id="signInFrmRight">
                        <img src="imgs/logo.png" alt="" id="logo">
                        <form action="Login" method="post">
                            <label for="lgUsername">Username</label>
                            <input type="username" name="lgUsername" id="lgUsername" required>
                            <label for="lgPassword">Password</label>
                            <input type="password" name="lgPassword" id="lgPassword" required>
                            <span><p><input type="checkbox" name="lgRemember" id="lgRemember"> Remember Me</p><a href="#">Forgot Password</a></span>
                            <div id="buttons">
                                <input type="submit" id="lgBtn1" value="Login">
                                <a id="sgBtn1" onclick="shiftPanel(this)">Sign Up</a>
                            </div>
                            <p>By signing in you agrees to Terms & Conditions, and Privacy Policy</p>
                        </form>
                    </div>
                    <div id="signUpFrmRight">
                        <form action="SignUp" method="post">
                            <label for="sgName">Name</label>
                            <input type="text" name="sgName" id="sgName" required>
                            <label for="sgUsername">Username</label>
                            <input type="text" name="sgUsername" id="sgUsername" required>
                            <label for="sgEmail">Email</label>
                            <input type="email" name="sgEmail" id="sgEmail" required>
                            <label for="sgPassword">Password</label>
                            <input type="password" name="sgPassword" id="sgPassword" required>
                            <div id="buttons">
                                <a id="lgBtn2" onclick="shiftPanel(this)">Login</a>
                                <input type="submit" id="sgBtn2" value="Sign Up" >
                            </div>
                            <p>By signing up you agrees to the Terms & Conditions, and Privacy Policy</p>

                        </form>
                    </div>
                </div>
            </div>
        </section>   
        <script src="js/script.js"></script>
    </body>
</html>
