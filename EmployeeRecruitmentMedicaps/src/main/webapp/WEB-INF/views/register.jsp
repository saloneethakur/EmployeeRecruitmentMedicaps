<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Page</title>
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
        .message {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid transparent;
            border-radius: 5px;
        }
        .message.success {
            border-color: #d4edda;
            background-color: #d4edda;
            color: #155724;
        }
        .message.error {
            border-color: #f8d7da;
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Register</h2>
        
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

        <form action="/medicaps/user_reg" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="number">Number:</label>
                <input type="text" id="number" name="number" required>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <button type="submit">Register</button>
            </div>
        </form>
        <form action="/medicaps/loginpage">
            <button type="submit">Login</button>
        </form>
    </div>
</body>
</html>
