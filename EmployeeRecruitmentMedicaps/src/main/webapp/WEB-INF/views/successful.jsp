<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>OTP Verification</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .container h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }
        .form-group button {
            width: 100%;
            padding: 10px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>OTP Verification</h2>
        <c:if test="${not empty verify}">
            <p class="error-message">${verify}</p>
        </c:if>
        <form action="/medicaps/verifyOtp" method="post">
            <div class="form-group">
                <label for="otp">OTP:</label>
                <input type="text" id="otp" name="otp" required>
            </div>
            <input type="hidden" name="mail" value="${mail}" />
            <div class="form-group">
                <button type="submit">Verify OTP</button>
            </div>
        </form>
    </div>
</body>
</html>