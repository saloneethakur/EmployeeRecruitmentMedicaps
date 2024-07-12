<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Personal Information</title>
    <script type="text/javascript">
        function enableForm() {
            var elements = document.getElementsByClassName("form-control");
            for (var i = 0; i < elements.length; i++) {
                elements[i].disabled = false;
            }
        }

        function enableField(fieldId) {
            document.getElementById(fieldId).disabled = false;
        }
    </script>
</head>
<body>
    <h1>Personal Information</h1>

    <c:choose>
        <c:when test="${res.status == true}">
            <!-- Form with personal information displayed and fields disabled -->
            <form action="/user/updatepersonalDetails" method="post">
                <label>Alternate Phone Number:</label>
                <input type="text" class="form-control" name="alternatePhoneNumber" value="${res.data.alternatePhoneNumber}" disabled /><br>

                <label>Date of Birth:</label>
                <input type="date" class="form-control" name="dob" value="${res.data.dob}" disabled /><br>

                <label>Gender:</label>
                <input type="text" class="form-control" name="gender" value="${res.data.gender}" disabled /><br>

                <label>Caste:</label>
                <input type="text" class="form-control" name="caste" value="${res.data.caste}" disabled /><br>

                <label>Address:</label>
                <input type="text" class="form-control" name="address" value="${res.data.address}" disabled /><br>

                <label>Pincode:</label>
                <input type="text" class="form-control" name="pincode" value="${res.data.pincode}" disabled /><br>

                <label>District:</label>
                <input type="text" class="form-control" name="district" value="${res.data.district}" disabled /><br>

                <label>State:</label>
                <input type="text" class="form-control" name="state" value="${res.data.state}" disabled /><br>

                <label>Country:</label>
                <input type="text" class="form-control" name="country" value="${res.data.country}" disabled /><br>

                <label>Exam Qualified:</label>
                <input type="text" class="form-control" name="examQualified" value="${res.data.examQualified}" disabled /><br>

                <button type="button" onclick="enableForm()">Edit</button>
                <input type="submit" value="Save" />
            </form>

            <!-- Separate forms for adding Researcher ID, Scopus ID, and ORCID ID -->
            <form action="/user/addResearcherId" method="post">
                <label>Researcher ID:</label>
                <input type="text" id="researcherId" name="researcherId" value="${res.data.researcherId}" disabled />
                <button type="button" onclick="enableField('researcherId')">Add</button>
                <input type="submit" value="Save" />
            </form>

            <form action="/user/addScopusId" method="post">
                <label>Scopus ID:</label>
                <input type="text" id="scopusId" name="scopusId" value="${res.data.scopusId}" disabled />
                <button type="button" onclick="enableField('scopusId')">Add</button>
                <input type="submit" value="Save" />
            </form>

            <form action="/user/addOrcidId" method="post">
                <label>ORCID:</label>
                <input type="text" id="orcid" name="orcid" value="${res.data.orcid}" disabled />
                <button type="button" onclick="enableField('orcid')">Add</button>
                <input type="submit" value="Save" />
            </form>
        </c:when>
        <c:otherwise>
            <!-- Form for entering personal information -->
            <form action="/user/personalDetails" method="post">
                <label>Alternate Phone Number:</label>
                <input type="text" name="alternatePhoneNumber" /><br>

                <label>Date of Birth:</label>
                <input type="date" name="dob" /><br>

                <label>Gender:</label>
                <input type="text" name="gender" /><br>

                <label>Caste:</label>
                <input type="text" name="caste" /><br>

                <label>Address:</label>
                <input type="text" name="address" /><br>

                <label>Pincode:</label>
                <input type="text" name="pincode" /><br>

                <label>District:</label>
                <input type="text" name="district" /><br>

                <label>State:</label>
                <input type="text" name="state" /><br>

                <label>Country:</label>
                <input type="text" name="country" /><br>

                <label>Exam Qualified:</label>
                <input type="text" name="examQualified" /><br>

                <input type="submit" value="Save" />
            </form>

            <!-- Separate forms for adding Researcher ID, Scopus ID, and ORCID ID -->
            <form action="/user/addResearcherId" method="post">
                <label>Researcher ID:</label>
                <input type="text" name="researcherId" /><br>
                <input type="submit" value="Add" />
            </form>

            <form action="/user/addScopusId" method="post">
                <label>Scopus ID:</label>
                <input type="text" name="scopusId" /><br>
                <input type="submit" value="Add" />
            </form>

            <form action="/user/addOrcidId" method="post">
                <label>ORCID:</label>
                <input type="text" name="orcid" /><br>
                <input type="submit" value="Add" />
            </form>
        </c:otherwise>
    </c:choose>
</body>
</html>


