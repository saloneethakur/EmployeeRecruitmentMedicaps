<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    
    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee Work Experience Form</title>
    <link rel="stylesheet" href="/assets/css/work.css" />
  </head>
  <body>
  
  <c:set var="hasExperiences" value="${false}" scope="page"/>
  
 <c:forEach var="experience" items="${personalInformation.experiences}">
    <c:set var="hasExperiences" value="${true}" scope="page"/>
</c:forEach> 
  
  <c:if test="${not empty personalInformation.experiences}">
  
    <c:if test="${hasExperiences}">
    <c:forEach var="experience" items="${personalInformation.experiences}">
    <div class="container">
      <h2>Work Experience</h2>
      <button type="button" id="editBtn">edit</button>
      <form id="workExperienceForm" action="/user/updateExperience" method="post" >
        <h3>Experience (Latest to Oldest)</h3>
        <div id="workExperienceSections">
          <div class="section">
            <div class="flex-container">
              <div class="flex-item">
                <label for="jobTitle1">Job Title:</label>
                <input type="text" id="jobTitle1" name="jobTitle" value="${experience.jobTitle}" required />
              </div>
              <div class="flex-item">
                <label for="instituteName1">Institute Name:</label>
                <input
                  type="text"
                  id="instituteName1"
                  name="instituteName"
                  value="${experience.instituteName}"
                  required
                />
              </div>
            </div>
            <div class="flex-container">
              <div class="flex-item">
                <label for="startDate1">Start Date:</label>
                <input type="date" id="startDate1" name="startDate" value="${experience.startDate}" required />
              </div>
              <div class="flex-item">
                <label for="endDate1">End Date:</label>
                <input type="date" id="endDate1" name="endDate" value="${experience.endDate}" required />
                
                <input type="hidden" id="10thGrade" name="experience_id" value="${experience.experienceId}" required />
                <button type="submit" id="nextbtn">Submit</button>
              
              </div>
            </div>
          </div>
        </div>
        <button type="button" id="addSectionBtn">Add Experience</button>
        <!-- <button type="submit" id="nextbtn">Next</button>-->
      </form>
      
      <button onclick="location.href='/user/cv'">Next</button>
    </div>
    </c:forEach>
    </c:if>
    </c:if>
    
    <!-- Entering first time -->
    <c:if test="${!hasExperiences}">
    <div class="container">
      <h2>Work Experience</h2>
      <button type="button" id="editBtn">edit</button>
      <form id="workExperienceForm" action="/user/saveExperience" method="post" >
        <h3>Experience (Latest to Oldest)</h3>
        <div id="workExperienceSections">
          <div class="section">
            <div class="flex-container">
              <div class="flex-item">
                <label for="jobTitle1">Job Title:</label>
                <input type="text" id="jobTitle1" name="jobTitle"  required />
              </div>
              <div class="flex-item">
                <label for="instituteName1">Institute Name:</label>
                <input
                  type="text"
                  id="instituteName1"
                  name="instituteName"
                  
                  required
                />
              </div>
            </div>
            <div class="flex-container">
              <div class="flex-item">
                <label for="startDate1">Start Date:</label>
                <input type="date" id="startDate1" name="startDate" required />
              </div>
              <div class="flex-item">
                <label for="endDate1">End Date:</label>
                <input type="date" id="endDate1" name="endDate"  required />
                
                 
                <button type="submit" id="nextbtn">Submit</button>
              
              </div>
            </div>
          </div>
        </div>
        
        <!-- <button type="submit" id="nextbtn">Next</button>-->
      </form>
      <form action="">
           <button type="button" id="addSectionBtn" onclick="location.href='/user/saveExperience'" >Add Experience</button>      
      </form>
      <button onclick="location.href='/user/cv'">Next</button>
    </div>
    </c:if>
    
    
        
    <script src="/assets/JS/work.js"></script>
  </body>
</html>
