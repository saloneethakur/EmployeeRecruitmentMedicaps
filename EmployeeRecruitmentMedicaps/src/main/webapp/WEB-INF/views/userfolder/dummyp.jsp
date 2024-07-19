<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Information Form</title>
</head>
<body>
    <h2>User Information Form</h2>
    <form id="userForm" action="/user/personalDetails" method="POST">
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" value="${user.name}" required><br><br>
        
        <label for="email">Email:</label><br>
        <input type="email" id="email" name="email" value="${user.email}" required disabled><br><br>
        
        <label for="phone">Phone:</label><br>
        <input type="tel" id="phone" name="phone" value="${user.number}" required><br><br>
        
        <label for="alternatePhoneNumber">Alternate Phone Number:</label><br>
        <input type="tel" id="alternatePhoneNumber" name="alternatePhoneNumber"><br><br>
        
        <label for="dob">Date of Birth:</label><br>
        <input type="date" id="dob" name="dob" required><br><br>
        
        <label for="gender">Gender:</label><br>
        <input type="text" id="gender" name="gender" required><br><br>
        
        <label for="caste">Caste:</label><br>
        <input type="text" id="caste" name="caste" required><br><br>
        
        <label for="address">Address:</label><br>
        <input type="text" id="address" name="address" required><br><br>
        
        <label for="pincode">Pincode:</label><br>
        <input type="text" id="pincode" name="pincode" required><br><br>
        
        <label for="district">District:</label><br>
        <input type="text" id="district" name="district" required><br><br>
        
        <label for="state">State:</label><br>
        <input type="text" id="state" name="state" required><br><br>
        
        <label for="country">Country:</label><br>
        <input type="text" id="country" name="country" required><br><br>
        
        <label for="researcherId">Researcher ID:</label><br>
        <input type="text" id="researcherId" name="researcherId"><br><br>
        
        <label for="scopusId">Scopus ID:</label><br>
        <input type="text" id="scopusId" name="scopusId"><br><br>
        
        <label for="orcid">ORCID:</label><br>
        <input type="text" id="orcid" name="orcid"><br><br>
        
        <label for="examQualified">Exam Qualified:</label><br>
        <input type="text" id="examQualified" name="examQualified"><br><br>
        
        <input type="submit" value="Submit">
    </form>

    <script>
        document.getElementById('userForm').addEventListener('submit', function(event) {
            const nullableFields = ['researcherId', 'scopusId', 'orcid', 'examQualified'];

            nullableFields.forEach(function(fieldId) {
                const field = document.getElementById(fieldId);
                if (!field.value.trim()) {
                    field.value = 'null';
                }
            });
        });
    </script>
</body>
</html>
