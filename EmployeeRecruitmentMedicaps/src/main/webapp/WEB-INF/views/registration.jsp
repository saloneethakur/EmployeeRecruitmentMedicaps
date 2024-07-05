<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('/assets/img/Medicaps Front page.png.') no-repeat center center fixed;
            background-size: cover;
            background-color: rgba(0, 0, 0, 0.5); /* Fallback color */
        }

        .modal {
            background-color: rgba(255, 255, 255, 1);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            position: relative;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        .input-box {
            margin-bottom: 15px;
        }

        .input-box input {
            width: 93%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .remember-forgot {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .remember-forgot label {
            display: flex;
            align-items: center;
        }

        .remember-forgot input[type="checkbox"] {
            margin-right: 10px;
        }

        .btn {
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #007BFF;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        p {
            text-align: center;
        }

        p a {
            color: #007BFF;
            text-decoration: none;
        }

        p a:hover {
            text-decoration: underline;
        }

        .close-btn {
            position: absolute;
            top: 10px;
            right: 10px;
            background-color: transparent;
            border: none;
            font-size: 20px;
            cursor: pointer;
        }

        .close-btn i {
            color: black;
        }

        .close-btn:hover i {
            color: red;
        }
    </style>
</head>
<body>
    <div class="modal">
        <button class="close-btn" onclick="location.href='home1'">
            <i class="fas fa-times-circle"></i>
        </button>
        <form id="registerForm" action="/medicaps/user_reg" method="post" onsubmit="return validateForm()">
            <h1>Register Here</h1>
            <div class="input-box">
                <input type="text" id="username" name="username" placeholder="Full Name" required>
            </div>
            <div class="input-box">
                <input type="email" id="email" name="email" placeholder="Email" required>
            </div>
            <div class="input-box">
                <input type="tel" id="mobile" name="mobile" placeholder="Mobile Number" maxlength="10" required oninput="this.value = this.value.replace(/[^0-9]/g, '');">
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

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            function validateForm() {
                const mobileInput = document.getElementById('mobile');
                const mobileValue = mobileInput.value.trim();

                if (mobileValue.length !== 10 || !/^[6789]\d{9}$/.test(mobileValue)) {
                    alert('Please enter a valid 10-digit Indian mobile number starting with 6, 7, 8, or 9.');
                    return false;
                }

                const password = document.getElementById('password').value;
                const confirmPassword = document.getElementById('confirmPassword').value;

                if (password !== confirmPassword) {
                    alert('Passwords do not match.');
                    return false;
                }

                return true;
            }

            const registerForm = document.getElementById('registerForm');
            registerForm.addEventListener('submit', function (event) {
                if (!validateForm()) {
                    event.preventDefault();
                }
            });
        });
    </script>
</body>
</html>
