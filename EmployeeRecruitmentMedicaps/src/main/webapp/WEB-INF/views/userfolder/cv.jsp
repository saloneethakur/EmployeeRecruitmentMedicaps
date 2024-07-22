<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Upload Your Resume</title>
    <link rel="stylesheet" href="/assets/css/cvt.css" />
  </head>
  <body>
   <c:if test="${not empty resumePath}">
        <!-- Display PDF directly in the browser using an iframe -->
         <object data="/assets/resume/${resumePath}" type="application/pdf" width="100%" height="600px">
            <p>View Resume. <a href="/assets/resume/${resumePath}">View Resume</a>.</p>
        </object>
    </c:if>
    <c:if test="${not empty error}">
        <p>Error: ${error}</p>
    </c:if>
    <c:if test="${empty resumePath}">
    <div class="container">
      <h1>Upload Your CV</h1>
      <button type="button" id="editBtn">Edit</button>
      <form action="/user/add_resume" method="post" enctype="multipart/form-data">
        <div class="form-group">
          <label for="file">Upload Resume:</label>
          <input type="file" id="cv" name="file" required />
        </div>
        
        <div>
          <!-- <id = "myForm" onsubmit="validateForm(event)">
         -->

          <div class="confirm-field">
            <input type="checkbox" id="confirm" name="confirm" />
            <label for="confirm" class="confirm-label">
              I hereby confirm that all the information provided is correct.
            </label>
          </div>
        </div>
        <button type="submit" class="submit-btn">Submit</button>
      </form>
    </div>
    </c:if>
        <!-- JavaScript File -->
        <script src="/assets/JS/cvt.js"></script>
  </body>
</html>
