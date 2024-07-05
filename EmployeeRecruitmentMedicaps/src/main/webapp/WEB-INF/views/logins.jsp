<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background: url('/assets/img/Medicaps Front page.png') no-repeat center center;
            background-size: cover;
            background-color: rgba(0, 0, 0, 0.5); /* Fallback color */
        }

        .wrapper {
            background-color: rgba(300, 300, 300, 1); /* Semi-transparent white background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            position: relative; /* Added for positioning the close button */
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
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }

        .remember-forgot label {
            display: flex;
            align-items: center;
        }

        .remember-forgot a {
            text-decoration: none;
            color: #007BFF;
        }

        .remember-forgot a:hover {
            text-decoration: underline;
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

        .close-btn {
            position: absolute; /* Positioned absolutely within the wrapper */
            top: 10px;
            right: 10px;
            background-color: transparent;
            border: none;
            font-size: 20px;
            cursor: pointer;
        }

        .close-btn i {
            color: black; /* Set the icon color to black */
        }

        .close-btn:hover i {
            color: red; /* Change the icon color to red on hover */
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <button class="close-btn" onclick="window.location.href='home.jsp'">
            <i class="fas fa-times-circle"></i>
        </button>
        <form action="">
            <h1>Login Here</h1>
            <div class="input-box">
                <input type="email" placeholder="Email" required>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Password" required>
            </div>
            <div class="remember-forgot">
                <label for="">
                    <input type="checkbox"> Remember me
                </label>
                <a href="#">forgot password ?</a>
            </div>
            <button class="btn" type="submit">LOGIN</button>
        </form>
    </div>
</body>
</html>