<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/assets/css/appliedapplicationform.css">
    <title>My Applied Applications</title>
</head>
<body>
    <header>
        <h1>My Applied Applications</h1>
        <nav>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">View Vacancy</a></li>
                <li><a href="#">My Applications</a></li>
                <li><a href="#">My Profile</a></li>
            </ul>
        </nav>
    </header>
    
    <section class="dashboard">
        <!-- Example card for each application -->
        
        <c:forEach var="application" items="${application}">
        <div class="card">
            <div class="card-header">
                <h2><strong> Application for:</strong>  ${application.vacancy.postAppliedFor}  </h2>
            </div>
            <div class="card-body">
                <p><strong>Applicant Name: </strong>${application.personalInformation.user.name}</p>
     
                <p><strong>Faculty: </strong>${application.vacancy.faculty}</p>
                <p><strong>Department: </strong>${application.vacancy.department}</p>
          
               
            </div>
            <div class="card-footer">
                <button class="view-details-btn">View Details</button>
                <button class="view-resume-btn">View Resume</button>
            </div>
        </div>
        </c:forEach>
        <!-- Repeat the above card structure for each application -->
        
    </section>
    
    <script src="/assets/JS/script.js"></script>
</body>
</html>
