<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration with OTP</title>
    <link rel="stylesheet" href="/assets/css/registration.css">
</head>
<body>

 <!-- Display message based on the response -->
        <c:if test="${not empty response}">
            <div class="message error">
                ${response}
            </div>
        </c:if>
        <c:if test="${not empty status}">
            <div class="message success">
                Registration successful!
            </div>
        </c:if>
        <c:if test="${not empty msg}">
            <div class="message error">
                ${msg}
            </div>
        </c:if>
    <div class="modal">
        <button class="close-btn" onclick="location.href='home1'">
            <i class="fas fa-times-circle"></i>
        </button>
        <form id="registerForm" action="/medicaps/user_reg" method="post" onsubmit="return openOtpPopup(event)">
            <h1>Register Here</h1>
            <div class="input-box">
                <input type="text" id="username" name="name" placeholder="Full Name" required>
            </div>
            <div class="input-box">
                <input type="email" id="email" name="email" placeholder="Email" required>
            </div>
            <div class="input-box">
                <input type="tel" id="mobile" name="number" placeholder="Mobile Number" maxlength="10" required oninput="this.value = this.value.replace(/[^0-9]/g, '');">
            </div>
            <div class="input-box">
                <input type="password" id="password" name="password" placeholder="Password" required>
            </div>
            <div class="input-box">
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required>
            </div>
            <div class="remember-forgot">
                <label>
                    <input type="checkbox" id="agree" name="agree" required> I agree to the terms and conditions
                </label>
            </div>
            <button class="btn" type="submit">Register</button>
            <p>Already have an account? <a href="/home/logins">Login Now</a></p>
        </form>
    </div>

 <div id="otpPopup" class="otp-popup">
        <div class="otp-popup-content">
            <span class="close-btn" onclick="closeOtpPopup()">&times;</span>
            <h2>Enter OTP</h2>
             <form action="/medicaps/verifyOtp" method="post">
            <input type="text" id="otpInput" name="otp" placeholder="Enter OTP" maxlength="6">
            <input type="hidden" name="mail" id="mail" value="" value="${mail}" />
            <button onclick="submitOtp()">Submit</button>
            <button onclick="closeOtpPopup()">Cancel</button>
            </form>
        </div>
    </div>

    <script src="/assets/JS/registration.js"></script>
</body>
</html>

