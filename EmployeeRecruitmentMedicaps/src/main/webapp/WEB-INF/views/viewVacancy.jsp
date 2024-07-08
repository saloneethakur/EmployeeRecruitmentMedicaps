<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>Vacancies</title>
</head>
<body>
    <h1>Vacancies</h1>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Faculty</th>
                <th>Department</th>
                <th>Post Applied For</th>
                <th>Start Date</th>
                <th>Last Date</th>
                <th>User</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="vacancy" items="${vacancies}">
                <tr>
                    <td>${vacancy.id}</td>
                    <td>${vacancy.faculty}</td>
                    <td>${vacancy.department}</td>
                    <td>${vacancy.postAppliedFor}</td>
                    <td>${vacancy.vstart}</td>
                    <td>${vacancy.vlast}</td>
                    <td>${vacancy.user.name}</td> <!-- assuming user has a name field -->
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>