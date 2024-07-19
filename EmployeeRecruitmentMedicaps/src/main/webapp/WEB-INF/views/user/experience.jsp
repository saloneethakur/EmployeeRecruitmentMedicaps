<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee Work Experience Form</title>
    <link rel="stylesheet" href="/assets/css/work.css" />
  </head>
  <body>
    <div class="container">
      <h2>Work Experience</h2>
      <button type="button" id="editBtn">edit</button>
      <form id="workExperienceForm">
        <h3>Experience (Latest to Oldest)</h3>
        <div id="workExperienceSections">
          <div class="section">
            <div class="flex-container">
              <div class="flex-item">
                <label for="jobTitle1">Job Title:</label>
                <input type="text" id="jobTitle1" name="jobTitle1" required />
              </div>
              <div class="flex-item">
                <label for="instituteName1">Institute Name:</label>
                <input
                  type="text"
                  id="instituteName1"
                  name="instituteName1"
                  required
                />
              </div>
            </div>
            <div class="flex-container">
              <div class="flex-item">
                <label for="startDate1">Start Date:</label>
                <input type="date" id="startDate1" name="startDate1" required />
              </div>
              <div class="flex-item">
                <label for="endDate1">End Date:</label>
                <input type="date" id="endDate1" name="endDate1" required />
                <input
                  type="checkbox"
                  id="currentlyWorking1"
                  name="currentlyWorking1"
                />
                <label for="currentlyWorking1">Currently Working</label>
              </div>
            </div>
          </div>
        </div>
        <button type="button" id="addSectionBtn">Add Experience</button>
        <!-- <button type="submit" id="nextbtn">Next</button>-->
      </form>
    </div>

    <script src="/assets/JS/work.js"></script>
  </body>
</html>
