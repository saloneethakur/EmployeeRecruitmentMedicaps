<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Education Details Form</title>
    <link rel="stylesheet" href="/assets/css/education1.css" />
  </head>
  <body>
    <div class="form-container">
      <h2>Education Details Form</h2>
      
      
      <c:choose>
      <c:when test="${res.status == true}">
     
     <button type="button" id="editBtn">Edit</button>
      <c:forEach var="education" items="${educations}">
      <form id="educationForm" action="/user/updateEducation" >
       
        <!-- 10th Grade Section -->
        <div class="education-section" id="section-10th">
          <div class="section-header" data-target="10th-details">
            <h3>10th Grade</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="10th-details">
            <label for="10thSchoolName">School Name</label>
            <input
              type="text"
              id="10thSchoolName"
              name="School_name"
              value="${education.institutionName}"
              required
            />
            <!-- 
            <label for="10thBoard">Board</label>
            <input type="text" id="10thBoard" name="Board_name" value="${res.education.Board_name}" required />

            <label for="10thYear">Passing Year</label>
            <input type="date" id="10th-date" name="Passing_year" value="${res.education.Passing_year}" required />

            <label for="10thGrade">Percentage/Grade</label>
            <input type="text" id="10thGrade" name="Percentage" value="${education.Percentage}" required />

             -->

            
            <input type="hidden" name="courseType" value="Tenth" >
            <button type="submit" id="submit-10" class="submit-btn">
              Submit
            </button>
          </div>
        </div>
        </form>
        </c:forEach>



        <!-- 12th Grade Section
        <div class="education-section" id="section-12th">
          <div class="section-header" data-target="12th-details">
            <h3>12th Grade</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="12th-details">
            <label for="12thSchoolName">School Name</label>
            <input
              type="text"
              id="12thSchoolName"
              name="12thSchoolName"
              required
            />

            <label for="12thBoard">Board</label>
            <input type="text" id="12thBoard" name="12thBoard" required />

            <label for="12thYear">Passing Year</label>
            <input type="date" id="12th-date" name="12th-date" required />

            <label for="12thGrade">Percentage/Grade</label>
            <input type="text" id="12thGrade" name="12thGrade" required />

            <label for="12thField">Subject</label>
            <select id="12thField" name="12thField" required>
              <option value="">Select Subject</option>
              <option value="PCM">PCM</option>
              <option value="PCB">PCB</option>
              <option value="PCMB">PCMB</option>
              <option value="Commerce">Commerce</option>
              <option value="CommerceMaths">Commerce + Maths</option>
              <option value="Others">Others</option>
            </select>
            <button type="submit" id="submit-12" class="submit-btn">
              Submit
            </button>
          </div>
        </div> -->
        <!--Diploma Section
        <div class="education-section" id="section-UG">
          <div class="section-header" data-target="diploma-details">
            <h3>Diploma</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="diploma-details">
            <label for="diplomaDegree">Course</label>
            <select id="diplomaDegree" name="diplomaDegree" required>
              <option value="">Select Degree</option>
              <option value="Engineering">Engineering</option>
              <option value="Management">Management</option>
              <option value="BA">BA</option>
              <option value="BSc">BSc</option>
              <option value="Others">Others</option>
            </select>

            <div id="diplomaFieldContainer">
              <label for="diplomaField">Specialization</label>
              <select id="diplomaField" name="diplomaField">
                <option value="">Select Field</option>
              </select>
            </div>

            <label for="diplomaInstitution">Institution Attended</label>
            <input
              type="text"
              id="diplomaInstitution"
              name="diplomaInstitution"
              required
            />

            <label for="diplomaYear">Year of Completion</label>
            <input type="date" id="diploma-date" name="diploma-date" required />

            <label for="diplomaGrade">Percentage/Grade</label>
            <input type="text" id="diplomaGrade" name="diplomaGrade" required />
            <button type="submit" id="submit-diploma" class="submit-btn">
              Submit
            </button>
          </div>
        </div>-->

        <!-- UG Section
        <div class="education-section" id="section-UG">
          <div class="section-header" data-target="UG-details">
            <h3>Undergraduate (UG)</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="UG-details">
            <label for="UGDegree">Degree</label>
            <select id="UGDegree" name="UGDegree" required>
              <option value="">Select Degree</option>
              <option value="Engineering">Engineering</option>
              <option value="Management">Management</option>
              <option value="BA">BA</option>
              <option value="BSc">BSc</option>
              <option value="Others">Others</option>
            </select>

            <div id="UGFieldContainer">
              <label for="UGField">Specialization</label>
              <select id="UGField" name="UGField">
                <option value="">Select Field</option>
              </select>
            </div>

            <label for="UGInstitution">Institution Attended</label>
            <input
              type="text"
              id="UGInstitution"
              name="UGInstitution"
              required
            />

            <label for="UGYear">Year of Completion</label>
            <input type="date" id="UG-date" name="UG-date" required />

            <label for="UGGrade">Percentage/Grade</label>
            <input type="text" id="UGGrade" name="UGGrade" required />
            <button type="submit" id="submit-ug" class="submit-btn">
              Submit
            </button>
          </div>
        </div> -->

        <!-- PG Section 
        <div class="education-section" id="section-PG">
          <div class="section-header" data-target="PG-details">
            <h3>Postgraduate (PG)</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="PG-details">
            <label for="PGDegree">Degree</label>
            <select id="PGDegree" name="PGDegree" required>
              <option value="">Select Degree</option>
              <option value="MBA">MBA</option>
              <option value="MSc">MSc</option>
              <option value="MTech">MTech</option>
              <option value="Others">Others</option>
            </select>

            <div id="PGFieldContainer">
              <label for="PGField">Field of Study</label>
              <select id="PGField" name="PGField">
                <option value="">Select Field</option>
              </select>
            </div>

            <label for="PGInstitution">Institution Attended</label>
            <input
              type="text"
              id="PGInstitution"
              name="PGInstitution"
              required
            />

            <label for="PGYear">Year of Completion</label>
            <input type="date" id="PG-date" name="PG-date" required />

            <label for="PGGrade">Percentage/Grade</label>
            <input type="text" id="PGGrade" name="PGGrade" required />
            <button type="button" id="add-PG">Add Postgraduate</button>
            <button type="submit" id="submit-pg" class="submit-btn">
              Submit
            </button>
          </div>
        </div>-->

        <!-- PhD Section 
        <div class="education-section" id="section-PhD">
          <div class="section-header" data-target="PhD-details">
            <h3>PhD</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="PhD-details">
            <label for="PhDField">Field of Study</label>
            <input type="text" id="PhDField" name="PhDField" required />

            <label for="PhDInstitution">Institution Attended</label>
            <input
              type="text"
              id="PhDInstitution"
              name="PhDInstitution"
              required
            />

            <label for="PhDJoiningYear">Joining Year</label>
            <input
              type="date"
              id="PhD-joining-date"
              name="PhD-joining-date"
              required
            />

            <label for="PhDPassingYear">Passing Year</label>
            <input
              type="date"
              id="PhD-passing-date"
              name="PhD-passing-date"
              required
            />

            <label for="PhDGrade">Percentage</label>
            <input type="text" id="PhDGrade" name="PhDGrade" required />

            <label for="PhDSupervisor">Supervisor's Name (optional)</label>
            <input type="text" id="PhDSupervisor" name="PhDSupervisor" />

            <label for="PhDThesis">Thesis Title (optional)</label>
            <input type="text" id="PhDThesis" name="PhDThesis" />

            <label for="PhDSummary">Research Summary (optional)</label>
            <textarea id="PhDSummary" name="PhDSummary" rows="4"></textarea>
            <button type="submit" id="submit-phd" class="submit-btn">
              Submit
            </button>
          </div>
        </div>-->

        <!-- Exams Qualified Section 
        <div class="education-section" id="section-exam">
          <div class="section-header" data-target="exam-details">
            <h3>Exams Qualified</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="exam-details">
            <div class="row">
              <label for="examFieldGATE">GATE</label>
              <input
                type="text"
                id="examFieldGATE"
                name="examFieldGATE"
                required
              />
              <label for="examYearGATE">Year</label>
              <input
                type="text"
                id="examYearGATE"
                name="examYearGATE"
                required
              />
            </div>
            <div class="row">
              <label for="examFieldNET">NET</label>
              <input
                type="text"
                id="examFieldNET"
                name="examFieldNET"
                required
              />
              <label for="examYearNET">Year</label>
              <input type="text" id="examYearNET" name="examYearNET" required />
              <button type="submit" id="submit-exam" class="submit-btn">
                Submit
              </button>
            </div>
          </div>
        </div>
      </form>-->
       
      </c:when>
      
      
      <c:otherwise>
      <!-- otherwise form if user is applying for the first time -->
      
      <form id="educationForm" action="/user/saveEducation" >
        <!-- 10th Grade Section -->
        <div class="education-section" id="section-10th">
          <div class="section-header" data-target="10th-details">
            <h3>10th Grade</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="10th-details">
            <label for="10thSchoolName">School Name</label>
            <input
              type="text"
              id="10thSchoolName"
              name="School_name"
              
              required
            />

            <label for="10thBoard">Board</label>
            <input type="text" id="10thBoard" name="Board_name"  required />

            <label for="10thYear">Passing Year</label>
            <input type="date" id="10th-date" name="Passing_year" required />

            <label for="10thGrade">Percentage/Grade</label>
            <input type="text" id="10thGrade" name="Percentage" required />

            <label for="10thField">Field of Study</label>
            <input type="text" id="10thField" name="10thField" required />
            <input type="hidden" name="courseType" value="Tenth" >
            <button type="submit" id="submit-10" class="submit-btn" name="action" >
              Submit
            </button>
          </div>
        </div>
        </form>

         <form id="educationForm" action="/user/saveEducation" >
        <!-- 12th Grade Section -->
        <div class="education-section" id="section-12th">
          <div class="section-header" data-target="12th-details">
            <h3>12th Grade</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="12th-details">
            <label for="12thSchoolName">School Name</label>
            <input
              type="text"
              id="12thSchoolName"
              name="School_name"
              required
            />

            <label for="12thBoard">Board</label>
            <input type="text" id="12thBoard" name="Board_name" required />

            <label for="12thYear">Passing Year</label>
            <input type="date" id="12th-date" name="Passing_year" required />

            <label for="12thGrade">Percentage/Grade</label>
            <input type="text" id="12thGrade" name="Percentage" required />

            <label for="12thField">Subject</label>
            <select id="12thField" name="Field_of_study" required>
              <option value="">Select Subject</option>
              <option value="PCM">PCM</option>
              <option value="PCB">PCB</option>
              <option value="PCMB">PCMB</option>
              <option value="Commerce">Commerce</option>
              <option value="CommerceMaths">Commerce + Maths</option>
              <option value="Others">Others</option>
            </select>
            <input type="hidden" name="courseType" value="Twelfth" > 
            <button type="submit" id="submit-12" class="submit-btn">
              Submit
            </button>
          </div>
        </div>
        </form>
        
         <form id="educationForm" action="/user/saveEducation" >
        <!--Diploma Section-->
        <div class="education-section" id="section-UG">
          <div class="section-header" data-target="diploma-details">
            <h3>Diploma</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="diploma-details">
            <label for="diplomaDegree">Course</label>
            <input type="text" id="diplomaDegree" name="Board_name" required>
              
            <div id="diplomaFieldContainer">
              <label for="diplomaField">Specialization</label>
              <select id="diplomaField" name="Field_of_study">
                <option value="">Select Field</option>
              </select>
            </div>

            <label for="diplomaInstitution">Institution Attended</label>
            <input
              type="text"
              id="diplomaInstitution"
              name="School_name"
              required
            />

            <label for="diplomaYear">Year of Completion</label>
            <input type="date" id="diploma-date" name="Passing_year" required />

            <label for="diplomaGrade">Percentage/Grade</label>
            <input type="text" id="diplomaGrade" name="Percentage" required />
            <input type="hidden" name="courseType" value="Diploma" > 
            <button type="submit" id="submit-diploma" class="submit-btn">
              Submit
            </button>
          </div>
        </div>
        </form>
        
         <form id="educationForm" action="/user/saveEducation" >
        <!-- UG Section -->
        <div class="education-section" id="section-UG">
          <div class="section-header" data-target="UG-details">
            <h3>Undergraduate (UG)</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="UG-details">
            <label for="UGDegree">Degree</label>
            <select id="UGDegree" name="Board_name" required>
              <option value="">Select Degree</option>
              <option value="Engineering">Engineering</option>
              <option value="Management">Management</option>
              <option value="BA">BA</option>
              <option value="BSc">BSc</option>
              <option value="Others">Others</option>
            </select>

            <div id="UGFieldContainer">
              <label for="UGField">Specialization</label>
              <select id="UGField" name="Field_of_study">
                <option value="">Select Field</option>
              </select>
            </div>

            <label for="UGInstitution">Institution Attended</label>
            <input
              type="text"
              id="UGInstitution"
              name="School_name"
              required
            />

            <label for="UGYear">Year of Completion</label>
            <input type="date" id="UG-date" name="Passing_year" required />

            <label for="UGGrade">Percentage/Grade</label>
            <input type="text" id="UGGrade" name="Percentage" required />
            <input type="hidden" name="courseType" value="UGdegree" >
            <button type="submit" id="submit-ug" class="submit-btn">
              Submit
            </button>
          </div>
        </div>
        </form>
        
         <form id="educationForm" action="/user/saveEducation" >
        <!-- PG Section -->
        <div class="education-section" id="section-PG">
          <div class="section-header" data-target="PG-details">
            <h3>Postgraduate (PG)</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="PG-details">
            <label for="PGDegree">Degree</label>
            <select id="PGDegree" name="Board_name" required>
              <option value="">Select Degree</option>
              <option value="MBA">MBA</option>
              <option value="MSc">MSc</option>
              <option value="MTech">MTech</option>
              <option value="Others">Others</option>
            </select>

            <div id="PGFieldContainer">
              <label for="PGField">Field of Study</label>
              <select id="PGField" name="Field_of_study">
                <option value="">Select Field</option>
              </select>
            </div>

            <label for="PGInstitution">Institution Attended</label>
            <input
              type="text"
              id="PGInstitution"
              name="School_name"
              required
            />

            <label for="PGYear">Year of Completion</label>
            <input type="date" id="PG-date" name="Passing_year" required />

            <label for="PGGrade">Percentage/Grade</label>
            <input type="text" id="PGGrade" name="Percentage" required />
            <button type="button" id="add-PG">Add Postgraduate</button>
            <input type="hidden" name="courseType" value="PGdegree" >
            <button type="submit" id="submit-pg" class="submit-btn">
              Submit
            </button>
          </div>
        </div>
        </form>
        
        
        <!-- PhD Section -->
        <div class="education-section" id="section-PhD">
          <div class="section-header" data-target="PhD-details">
            <h3>PhD</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="PhD-details">
            <label for="PhDField">Field of Study</label>
            <input type="text" id="PhDField" name="PhDField" required />

            <label for="PhDInstitution">Institution Attended</label>
            <input
              type="text"
              id="PhDInstitution"
              name="PhDInstitution"
              required
            />

            <label for="PhDJoiningYear">Joining Year</label>
            <input
              type="date"
              id="PhD-joining-date"
              name="PhD-joining-date"
              required
            />

            <label for="PhDPassingYear">Passing Year</label>
            <input
              type="date"
              id="PhD-passing-date"
              name="PhD-passing-date"
              required
            />

            <label for="PhDGrade">Percentage</label>
            <input type="text" id="PhDGrade" name="PhDGrade" required />

            <label for="PhDSupervisor">Supervisor's Name (optional)</label>
            <input type="text" id="PhDSupervisor" name="PhDSupervisor" />

            <label for="PhDThesis">Thesis Title (optional)</label>
            <input type="text" id="PhDThesis" name="PhDThesis" />

            <label for="PhDSummary">Research Summary (optional)</label>
            <textarea id="PhDSummary" name="PhDSummary" rows="4"></textarea>
            <button type="submit" id="submit-phd" class="submit-btn">
              Submit
            </button>
          </div>
        </div>

        <!-- Exams Qualified Section -->
        <div class="education-section" id="section-exam">
          <div class="section-header" data-target="exam-details">
            <h3>Exams Qualified</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="exam-details">
            <div class="row">
              <label for="examFieldGATE">GATE</label>
              <input
                type="text"
                id="examFieldGATE"
                name="examFieldGATE"
                required
              />
              <label for="examYearGATE">Year</label>
              <input
                type="text"
                id="examYearGATE"
                name="examYearGATE"
                required
              />
            </div>
            <div class="row">
              <label for="examFieldNET">NET</label>
              <input
                type="text"
                id="examFieldNET"
                name="examFieldNET"
                required
              />
              <label for="examYearNET">Year</label>
              <input type="text" id="examYearNET" name="examYearNET" required />
              <button type="submit" id="submit-exam" class="submit-btn">
                Submit
              </button>
            </div>
          </div>
        </div>
      </form>
      </c:otherwise>
      </c:choose>
    </div>


    <button onclick="location.href='checkJournal'">next</button>
    <!-- JavaScript File -->
    <script src="/assets/JS/education1.js"></script>
  </body>
</html>
