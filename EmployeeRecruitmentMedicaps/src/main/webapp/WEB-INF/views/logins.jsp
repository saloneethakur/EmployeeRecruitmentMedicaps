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
            background: url('/assets/img/reg_image_bg.jpg') no-repeat center center;
            background-size: cover;
          
            background-color: rgba(5, 4, 4, 0.5); /*Adjust the opacity (last value)*/
            background-blend-mode: overlay;
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
            color: #8b0000;
        }

        .remember-forgot a:hover {
            text-decoration: underline;
        }

        .btn {
            padding: 10px;
            border: none;
            border-radius: 5px;
            background-color: #8b0000;
            color: white;
            cursor: pointer;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #c11111;
        }

        .close-btn{
		  	background: none;
		    border: none;
		    color: #999;
		    font-size: 24px;
		    cursor: pointer;
		    position:absolute;
		    top: 10px;
		    right: 10px;
		}
		
		.close-btn i{
			color: #8b0000;
		}
		
		.close-btn:hover {
		    color: #555;
		}
		        
        .message.error {
        
            border-color: #f8d7da;
            background-color: #f8d7da;
            color: #721c24;
            font-size:28px;
            border-radius: 5px;
            display:flex;
            border: 1px solid transparent;
            position:absolute;
           top: 8rem;
            left: 32rem;
            margin:0 auto;
        
    </style>
</head>
<body>

        <c:if test="${not empty errorMsg}">
            <div class="message error">
                ${errorMsg}
            </div>
        </c:if>
        
        <c:if test="${not empty msg}">
            <div class="message error">
                ${msg}
            </div>
        </c:if>

    <div class="wrapper">
        <button class="close-btn" onclick="location.href='home1'">
            <i class="fas fa-times-circle"></i>
        </button>
        <form action="/medicaps/login" method="post" >
            <h1>Login Here</h1>
            <div class="input-box">
                <input type="email" placeholder="Email" name="email" required>
            </div>
            <div class="input-box">
                <input type="password" placeholder="Password" name="password" required>
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