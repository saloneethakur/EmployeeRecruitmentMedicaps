<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Real-time Vacancy Updates</title>
    <link rel="stylesheet" href="/assets/css/admincheck.css">
</head>
<body>
 <c:forEach var="vacancy" items="${vacancies}">
    <div class="box-container">
        <div id="card-container" class="card-container">
       
            <div class="card">
                <div class="card-content">
                    <h3>${vacancy.faculty}</h3>
                    <p>${vacancy.department}</p>
                </div>
                <div class="card-popup">
                    <button class="eligibility-button">ELIGIBILITY</button>
                    <button class="apply-button">APPLY</button>
                </div>
            </div>
            
            <!-- Cards will be dynamically inserted here -->
        </div>
    </div>
</c:forEach>
    <script src="/assets/JS/admincheck.js"></script>
</body>
</html>
