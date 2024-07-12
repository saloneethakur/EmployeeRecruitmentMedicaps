<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OTP Pop-up Example</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        /* OTP Popup Styling */
        body{
          font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
          background-image: url('/assets/img/reg_image_bg.jpg'); /* Replace with your image path */
    background-size: cover;
    background-position: center;
    background-repeat: no-repeat;
    background-color: rgba(5, 4, 4, 0.5); /*Adjust the opacity (last value)*/
    background-blend-mode: overlay; 
        }
        .otp-popup {
            display: none;
            position: fixed;
            z-index: 999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .otp-popup-content {
            background-color: #fefefe;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            max-width: 400px;
            position: relative;
            border-radius: 8px;
        }

        .otp-popup-content h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .otp-popup-content input[type="text"] {
            width: calc(100% - 10px);
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            margin-bottom: 10px;
        }

        .otp-popup-content button {
            background-color: #8b0000;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        .otp-popup-content button:hover {
            background-color: #c11111;
        }

        .otp-popup-content .close-btn {
            position: absolute;
            top: 10px;
            right: 15px;
            font-size: 28px;
            color: #aaa;
            cursor: pointer;
        }
        
        .message {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid transparent;
            border-radius: 5px;
        }
        .message_error {
            border-color: #f8d7da;
            background-color: #f8d7da;
            color: #721c24;
            display:flex;
            /*align-items:center;*/
            justify-content:center;
            position:absolute;
           	top: 8rem;
           	left: 38.5rem;
            margin:0 auto;
            font-size: 33px;
            
            width:300px;
        }
       


    </style>
</head>
<body>
    <!-- OTP Popup -->
    <c:if test="${not empty verify}">
    <p class="message_error">${verify}</p>
    </c:if>
    <form action="/medicaps/verifyOtp">
    <div id="otpPopup" class="otp-popup">
        <div class="otp-popup-content">
            <span id="redirectSpan" class="close-btn" onclick="closeOtpPopup()">&times;</span>
          
            <h2>Enter OTP</h2>
            <input type="text" id="otpInput" placeholder="Enter OTP" maxlength="6" name="otp" >
            <input type="hidden" name="mail" value="${mail}" /><br><br>
            
            <button type="submit">Submit</button>
            <button id="resendOtpBtn" onclick="resendOtp()" disabled>Resend OTP in <span id="resendTimer">30</span> sec</button>
        </div>
    </div>
    </form>
    <script>
        function openOtpPopup() {
            document.getElementById('otpPopup').style.display = 'block';
            startResendTimer();
        }

        function closeOtpPopup() {
            document.getElementById('otpPopup').style.display = 'none';
            window.location.href = '/home/home1'; // Replace with your actual API endpoint
        }


        function startResendTimer() {
            let seconds = 30;
            let resendTimerEl = document.getElementById('resendTimer');
            let resendOtpBtn = document.getElementById('resendOtpBtn');
            resendOtpBtn.disabled = true;
            resendTimerEl.textContent = seconds;

            let countdown = setInterval(() => {
                seconds--;
                resendTimerEl.textContent = seconds;

                if (seconds <= 0) {
                    clearInterval(countdown);
                    resendOtpBtn.disabled = false;
                }
            }, 1000);
        }

        function resendOtp() {
            // Logic to resend OTP goes here
            startResendTimer(); // Restart timer after clicking resend
        }

        function displaySuccessMessage() {
            alert("Registered Successfully!");
        }

        function redirectToUserPortal() {
           location.href = "userPanel";
        }
        // Open the OTP popup as soon as the page loads
        window.onload = openOtpPopup;
        
       
    </script>
</body>
</html>
