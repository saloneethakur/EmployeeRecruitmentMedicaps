<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Research</title>
    <link rel="stylesheet" href="/assets/css/research1.css" />
  </head>
  <body>
    <div class="form-container">
      <h1>Research</h1>
      <button type="button" id="editBtn">edit</button>
      <form>
        <div id="research-sections">
          <h2>Journal Publications</h2>
          <div class="section" id="research-1">
            <div class="field">
              <label for="research-title-1">Publication Title</label>
              <input type="text" id="research-title-1" />
            </div>
            <div class="field">
              <label for="research-name-1">Journal Name</label>
              <input type="text" id="research-name-1" />
            </div>
            <div class="inline-fields">
              <div class="field" style="flex: 1">
                <label for="research-volume-1">ISSN , Issue no., Volume</label>
                <input type="text" id="research-volume-1" />
              </div>
              <div class="field" style="flex: 1">
                <label for="research-year-1">Year</label>
                <select id="research-year-1">
                  <option value="" disabled selected>Select year</option>
                  <!-- Add more years as needed -->
                  <option value="2024">2024</option>
                  <option value="2023">2023</option>
                  <option value="2022">2022</option>
                </select>
              </div>
            </div>
            <div class="field">
              <label for="research-indexing-1">Indexing</label>
              <select id="research-indexing-1">
                <option value="">Select</option>
                <option value="Web Of Science">Web Of Science</option>
                <option value="Scopus">Scopus</option>
                <option value="UGC CARE">UGC Care</option>
              </select>
            </div>
          </div>
          <button type="submit" id="submit-10" class="submit-btn">
            Submit
          </button>
          <div>
            <button class="add-section" id="add-research">Add Research</button>
          </div>
        </div>
      </form>
    </div>
      <button onclick="location.href='checkExperience'">next</button>
    <script defer src="/assets/JS/research1.js"></script>
  </body>
</html>
