<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>College Job Vacancy Form</title>
    <link rel="stylesheet" href="/assets/css/vaccany1.css" />
  </head>
  <body>
    <div class="container">
      <h2>UPDATE VACCANCY</h2>
      <form action="/admin/addVacancy" method="post">
        <div class="vacancy-section" id="vacancy1">
          <div class="form-group">
            <label for="faculty1">Faculty:</label>
            <select
              id="faculty1"
              class="faculty-dropdown"
              name="faculty"
              onchange="populateDepartments(this, 1)"
            >
              <option value="">Select Faculty</option>
              <option value="Agriculture">Agriculture</option>
              <option value="Arts And Humanities">Arts And Humanities</option>
              <option value="Commerce">Commerce</option>
              <option value="Engineering">Engineering</option>
              <option value="Law">Law</option>
              <option value="Management Studies">Management Studies</option>
              <option value="Pharmacy">Pharmacy</option>
              <option value="Science">Science</option>
            </select>
          </div>
          <div class="form-group">
            <label for="department1">Department:</label>
            <select id="department1" name="department" class="department-dropdown">
              <option value="">Select Department</option>
            </select>
          </div>
          <div class="form-group">
            <label for="post1">Post:</label>
            <select id="post1" class="post-dropdown" name="postAppliedFor">
              <option value="">Select Post</option>
              <option value="Lecturer">Lecturer</option>
              <option value="Assistant Professor">Assistant Professor</option>
              <option value="Associate Professor">Associate Professor</option>
              <option value="Professor">Professor</option>
            </select>
          </div>
          <div class="form-group">
            <label for="date1" >Date:</label>
            <input type="date" id="date" name="vstart" required />
          </div>
          <div class="form-group">
            <label for="lastDate1">Last Date for Submission:</label>
            <input type="date" id="date" name="vlast" required />
          </div>
           <button type="submit"  id="addVacancy">Add Vacancy</button>
        </div>
      </form>
     
    </div>

    <script src="/assets/JS/vaccany1.js"></script>
  </body>
</html>
