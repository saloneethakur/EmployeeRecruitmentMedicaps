<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Personal Details Form</title>
</head>
<body>
    <h2>Personal Details Form</h2>
    <form action="/user/personalDetails" method="post">
        <label for="alternatePhoneNumber">Alternate Phone Number:</label>
        <input type="text" id="alternatePhoneNumber" name="alternatePhoneNumber"><br><br>
        
        <label for="dob">Date of Birth (yyyy-mm-dd):</label>
        <input type="text" id="dob" name="dob"><br><br>
        
        <label for="gender">Gender:</label>
        <input type="text" id="gender" name="gender"><br><br>
        
        <label for="caste">Caste:</label>
        <input type="text" id="caste" name="caste"><br><br>
        
        <label for="address">Address:</label>
        <input type="text" id="address" name="address"><br><br>
        
        <label for="pincode">Pincode:</label>
        <input type="text" id="pincode" name="pincode"><br><br>
        
        <label for="district">District:</label>
        <input type="text" id="district" name="district"><br><br>
        
        <label for="state">State:</label>
        <input type="text" id="state" name="state"><br><br>
        
        <label for="country">Country:</label>
        <input type="text" id="country" name="country"><br><br>
        
        <label for="researcherId">Researcher ID:</label>
        <input type="text" id="researcherId" name="researcherId"><br><br>
        
        <label for="scopusId">Scopus ID:</label>
        <input type="text" id="scopusId" name="scopusId"><br><br>
        
        <label for="orcid">ORCID:</label>
        <input type="text" id="orcid" name="orcid"><br><br>
        
        <label for="examQualified">Exam Qualified:</label>
        <input type="text" id="examQualified" name="examQualified"><br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
