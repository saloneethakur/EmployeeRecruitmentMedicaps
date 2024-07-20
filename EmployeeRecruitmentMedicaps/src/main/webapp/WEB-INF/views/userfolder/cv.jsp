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
    <div class="container">
      <h1>Upload Your CV</h1>
      <button type="button" id="editBtn">Edit</button>
      <form action="/upload" method="post" enctype="multipart/form-data">
        <div class="form-group">
          <label for="cv">Upload Resume:</label>
          <input type="file" id="cv" name="cv" required />
        </div>
        <div class="form-group">
          <label for="coverLetter">Upload Cover Letter:</label>
          <input type="file" id="coverLetter" name="coverLetter" required />
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
        <!-- JavaScript File -->
        <script src="/assets/JS/cvt.js"></script>
  </body>
</html>
