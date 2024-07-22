<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Education Details Form</title>
    <link rel="stylesheet" href="/assets/css/education1.css" />
  </head>
  <body>
  <!-- Initialize flags for each courseType -->
<c:set var="hasTenth" value="${false}" scope="page"/>
<c:set var="hasTwelve" value="${false}" scope="page"/>
<c:set var="hasDiploma" value="${false}" scope="page"/>
<c:set var="hasUg" value="${false}" scope="page"/>
<c:set var="hasPg" value="${false}" scope="page"/>
<c:set var="hasPhd" value="${false}" scope="page"/>

<!-- Iterate over education list to set flags -->
<c:forEach var="education" items="${personalInformation.educations}">
    <c:if test="${education.courseType == 'Tenth'}">
        <c:set var="hasTenth" value="${true}" scope="page"/>
    </c:if>
    <c:if test="${education.courseType == 'Twelve'}">
        <c:set var="hasTwelve" value="${true}" scope="page"/>
    </c:if>
    <c:if test="${education.courseType == 'Diploma'}">
        <c:set var="hasDiploma" value="${true}" scope="page"/>
    </c:if>
    <c:if test="${education.courseType == 'UG'}">
        <c:set var="hasUg" value="${true}" scope="page"/>
    </c:if>
    <c:if test="${education.courseType == 'PG'}">
        <c:set var="hasPg" value="${true}" scope="page"/>
    </c:if>
    <c:if test="${education.courseType == 'PhD'}">
        <c:set var="hasPhd" value="${true}" scope="page"/>
    </c:if>
</c:forEach>


   <c:if test="${not empty personalInformation.educations}">
     
    <div class="form-container">
      <h2>Education Details Form</h2>
      
      
    
      
     
     <button type="button" id="editBtn">Edit</button>
     
      <c:if test="${hasTenth}">
      <c:forEach var="education" items="${personalInformation.educations}">
       <c:if test="${education.courseType == 'Tenth'}">
       
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
            
            <label for="10thBoard">Board</label>
            <input type="text" id="10thBoard" name="Board_name" value="${education.educationClass}" required />

            <label for="10thYear">Passing Year</label>
            <input type="date" id="10th-date" name="Passing_year" value="${education.completionYear}" required />

            <label for="10thGrade">Percentage/Grade</label>
            <input type="text" id="10thGrade" name="Percentage" value="${education.percentage}" required />

             <input type="hidden" id="10thGrade" name="courseType" value="${education.courseType}"  />
              <input type="hidden" id="10thGrade" name="id" value="${education.educationId}" required />
            

            
            
            <button type="submit" id="submit-10" class="submit-btn">
              Submit
            </button>
          </div>
        </div>
        </form>
        </c:if>
        </c:forEach>
        </c:if>
        



        <!-- 12th Grade Section -->
        <c:if test="${hasTwelve}">
      <c:forEach var="education" items="${personalInformation.educations}">
       <c:if test="${education.courseType == 'Twelve'}">
       
     <form id="educationForm" action="/user/updateEducation" >
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
              value="${education.institutionName}"
              required
            />

            <label for="12thBoard">Board</label>
            <input type="text" id="12thBoard" name="Board_name" value="${education.educationClass}" required />

            <label for="12thYear">Passing Year</label>
            <input type="date" id="12th-date" name="Passing_year" value="<fmt:formatDate value='${education.completionYear}' pattern='yyyy-MM-dd'/>" required />

            <label for="12thGrade">Percentage/Grade</label>
            <input type="text" id="12thGrade" name="Percentage" value="${education.percentage}" required />

            <label for="12thField">Subject</label>
            <select id="12thField" name="fieldOfStudy" required>
              <option value="">Select Subject</option>
              <option value="PCM" ${education.fieldOfStudy == 'PCM' ? 'selected' : ''} >PCM</option>
              <option value="PCB" ${education.fieldOfStudy == 'PCB' ? 'selected' : ''}>PCB</option>
              <option value="PCMB" ${education.fieldOfStudy == 'PCMB' ? 'selected' : ''}>PCMB</option>
              <option value="Commerce" ${education.fieldOfStudy == 'Commerce' ? 'selected' : ''}>Commerce</option>
              <option value="CommerceMaths" ${education.fieldOfStudy == 'CommerceMaths' ? 'selected' : ''} >Commerce + Maths</option>
              <option value="Others" ${education.fieldOfStudy == 'Others' ? 'selected' : ''} >Others</option>
            </select>
            <input type="hidden" id="10thGrade" name="id" value="${education.educationId}" required />
            <button type="submit" id="submit-12" class="submit-btn">
              Submit
            </button>
          </div>
        </div> 
        
         </form>
        </c:if>
        </c:forEach>
        </c:if>
        
        
       <!--   Diploma Section-->
       
         <c:if test="${hasDiploma}">
      <c:forEach var="education" items="${personalInformation.educations}">
       <c:if test="${education.courseType == 'Diploma'}">
       
       
       <form id="educationForm" action="/user/updateEducation" >
        <div class="education-section" id="section-UG">
          <div class="section-header" data-target="diploma-details">
            <h3>Diploma</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="diploma-details">
            <label for="diplomaDegree">Course</label>
            <select id="diplomaDegree" name="educationClass" required>
              <option value="">Select Degree</option>
              <option value="Engineering" ${education.educationClass == 'Engineering' ? 'selected' : ''} >Engineering</option>
              <option value="Management" ${education.educationClass == 'Management' ? 'selected' : ''} >Management</option>
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
             name="School_name"
             value="${education.institutionName}"
              required
            />

            <label for="diplomaYear">Year of Completion</label>
            <input type="date" id="diploma-date" name="Passing_year" value="<fmt:formatDate value='${education.completionYear}' pattern='yyyy-MM-dd'/>" required />

            <label for="diplomaGrade">Percentage/Grade</label>
            <input type="text" id="diplomaGrade" name="Percentage" value="${education.percentage}" required />
            
            <input type="hidden" id="10thGrade" name="id" value="${education.educationId}" required />
            <button type="submit" id="submit-diploma" class="submit-btn">
              Submit
            </button>
          </div>
        </div>
        </form>
        </c:if>
        </c:forEach>
        </c:if>



         <!--  UG Section--> 
         <c:if test="${hasUg}">
      <c:forEach var="education" items="${personalInformation.educations}">
       <c:if test="${education.courseType == 'UG'}">
       
        <form id="educationForm" action="/user/updateEducation" >
        <div class="education-section" id="section-UG">
          <div class="section-header" data-target="UG-details">
            <h3>Undergraduate (UG)</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="UG-details">
            <label for="UGDegree">Degree</label>
            <select id="UGDegree" name="educationClass" required>
              <option value="">Select Degree</option>
              <option value="Engineering" ${education.educationClass == 'Engineering' ? 'selected' : ''}>Engineering</option>
              <option value="Management" ${education.educationClass == 'Management' ? 'selected' : ''}>Management</option>
              <option value="BA" ${education.educationClass == 'BA' ? 'selected' : ''}>BA</option>
              <option value="BSc" ${education.educationClass == 'BSc' ? 'selected' : ''}>BSc</option>
              <option value="Others" ${education.educationClass == 'Others' ? 'selected' : ''}>Others</option>
            </select>

            <div id="UGFieldContainer">
              <label for="UGField">Specialization</label>
              <select id="UGField" name="fieldOfStudy" value="${education.fieldOfStudy}" >
                <option value="">Select Field</option>
              </select>
            </div>

            <label for="UGInstitution">Institution Attended</label>
            <input
              type="text"
              id="UGInstitution"
              name="School_name"
              value="${education.institutionName}"
              required
            />

            <label for="UGYear">Year of Completion</label>
            <input type="date" id="UG-date" name="Passing_year" value="<fmt:formatDate value='${education.completionYear}' pattern='yyyy-MM-dd'/>" required />

            <label for="UGGrade">Percentage/Grade</label>
            <input type="text" id="UGGrade" name="Percentage" value="${education.percentage}" required />
            
            <input type="hidden" id="10thGrade" name="id" value="${education.educationId}" required />
            <button type="submit" id="submit-ug" class="submit-btn">
              Submit
            </button>
          </div>
        </div> 
        </form>
        </c:if>
        </c:forEach>
        </c:if>


        <!-- PG Section--> 
        <c:if test="${hasUg}">
      <c:forEach var="education" items="${personalInformation.educations}">
       <c:if test="${education.courseType == 'UG'}">
       
        <form id="educationForm" action="/user/updateEducation" >
        
        <div class="education-section" id="section-PG">
          <div class="section-header" data-target="PG-details">
            <h3>PostGraduation (PG)</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="PG-details">
            <label for="PGDegree">Degree</label>
            <select id="PGDegree" name="educationClass" required>
              <option value="">Select Degree</option>
              <option value="MBA" ${education.educationClass == 'MBA' ? 'selected' : ''} >MBA</option>
              <option value="MSc" ${education.educationClass == 'MSc' ? 'selected' : ''}>MSc</option>
              <option value="MTech" ${education.educationClass == 'MTech' ? 'selected' : ''}>MTech</option>
              <option value="Others" ${education.educationClass == 'Others' ? 'selected' : ''}>Others</option>
            </select>

            <div id="PGFieldContainer">
              <label for="PGField">Field of Study</label>
              <select id="PGField" name="fieldOfStudy">
                <option value="">Select Field</option>
              </select>
            </div>

            <label for="PGInstitution">Institution Attended</label>
            <input
              type="text"
              id="PGInstitution"
              name="School_name"
              value="${education.institutionName}"
              required
            />

            <label for="PGYear">Year of Completion</label>
            <input type="date" id="PG-date" name="Passing_year" value="<fmt:formatDate value='${education.completionYear}' pattern='yyyy-MM-dd'/>" required />

            <label for="PGGrade">Percentage/Grade</label>
            <input type="text" id="PGGrade" name="Percentage" value="${education.percentage}" required />
            <button type="button" id="add-PG">Add PostGraduation</button>
            
            <input type="hidden" id="10thGrade" name="id" value="${education.educationId}" required />
            <button type="submit" id="submit-pg" class="submit-btn">
              Submit
            </button>
          </div>
        </div>
        </form>
        </c:if>
        </c:forEach>
        </c:if>

        <!--   PhD Section -->
        <c:if test="${hasPhd}">
      <c:forEach var="education" items="${personalInformation.phd}">
       
       
        <form id="educationForm" action="/user/updatePHD" >
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
              name="PhDInstitution_name"
              value="${phd.institutionName}"
              required
            />

            <label for="PhDJoiningYear">Joining Year</label>
            <input
              type="date"
              id="PhD-joining-date"
              name="joiningYear" 
              value="<fmt:formatDate value='${phd.joiningYear}' pattern='yyyy-MM-dd'/>"
              required
            />

            <label for="PhDPassingYear">Passing Year</label>
            <input
              type="date"
              id="PhD-passing-date"
              name="PhD_year_of_passing" 
              value="<fmt:formatDate value='${phd.completionYear}' pattern='yyyy-MM-dd'/>"
              required
            />

            <label for="PhDGrade">Percentage</label>
            <input type="text" id="PhDGrade" name="percentage" value="${phd.percentage}" required />

            <label for="PhDSupervisor">Supervisor's Name (optional)</label>
            <input type="text" id="PhDSupervisor" name="PhD_Supervisor_name" value="${phd.supervisorOrAdvisor}" />

            <label for="PhDThesis">Thesis Title (optional)</label>
            <input type="text" id="PhDThesis" name="PhD_Thesis_topic" value="${phd.thesis}" />

            <label for="PhDSummary">Research Summary (optional)</label>
            <textarea id="PhDSummary" name="PhDSummary" value="${phd.researchSummary}" rows="4"></textarea>
            
            <input type="hidden" id="10thGrade" name="id" value="${phd.id}" required />
            <button type="submit" id="submit-phd" class="submit-btn">
              Submit
            </button>
          </div>
        </div>
        </form>
       
        </c:forEach>
        </c:if>

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
       
       
      
      
  
      <!-- otherwise form if user is applying for the first time -->
       
      
        <!-- 10th Grade Section -->
         <c:if test="${!hasTenth}">
        <form id="educationForm" action="/user/saveEducation" >
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
        </c:if>
 
        
        <!-- 12th Grade Section-->
        <c:if test="${!hasTwelve}">
         <form id="educationForm" action="/user/saveEducation" >
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
            <input type="hidden" name="courseType" value="Twelve" > 
            <button type="submit" id="submit-12" class="submit-btn">
              Submit
            </button>
          </div>
        </div>
        </form>
        </c:if>
         
        <!--Diploma Section-->
        <c:if test="${!hasDiploma}">
        <form id="educationForm" action="/user/saveEducation" >
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
        </c:if>
        
        
         
        <!-- UG Section -->
        <c:if test="${!hasUg}">
        <form id="educationForm" action="/user/saveEducation" >
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
            <input type="hidden" name="courseType" value="UG" >
            <button type="submit" id="submit-ug" class="submit-btn">
              Submit
            </button>
          </div>
        </div>
        </form>
       </c:if>
         
        <!--   PG Section -->
        <c:if test="${!hasPg}">
        <form id="educationForm" action="/user/saveEducation" >
        <div class="education-section" id="section-PG">
          <div class="section-header" data-target="PG-details">
            <h3>PostGraduation (PG)</h3>
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
            <button type="button" id="add-PG">Add PostGraduation</button>
            <input type="hidden" name="courseType" value="PG" >
            <button type="submit" id="submit-pg" class="submit-btn">
              Submit
            </button>
          </div>
        </div>
        </form>
        </c:if>
        
        <!-- PhD Section-->
        <c:if test="${!hasPhd}">
        <form id="educationForm" action="/user/savePHDeducation" >
        <div class="education-section" id="section-PhD">
          <div class="section-header" data-target="PhD-details">
            <h3>PhD</h3>
            <button type="button" class="toggle-button">+</button>
          </div>
          <div class="section-details" id="PhD-details">
            <label for="PhDField">Field of Study</label>
            <input type="text" id="PhDField" name="PhD_Field_name" required />

            <label for="PhDInstitution">Institution Attended</label>
            <input
              type="text"
              id="PhDInstitution"
              name="PhDInstitution_name"
              required
            />

            <label for="PhDJoiningYear">Joining Year</label>
            <input
              type="date"
              id="PhD-joining-date"
              name="joiningYear"
              required
            />

            <label for="PhDPassingYear">Passing Year</label>
            <input
              type="date"
              id="PhD-passing-date"
              name="PhD_year_of_passing"
              required
            />

            <label for="PhDGrade">Percentage</label>
            <input type="text" id="PhDGrade" name="percentage" required />

            <label for="PhDSupervisor">Supervisor's Name (optional)</label>
            <input type="text" id="PhDSupervisor" name="PhD_Supervisor_name" />

            <label for="PhDThesis">Thesis Title (optional)</label>
            <input type="text" id="PhDThesis" name="PhD_Thesis_topic" />

            <label for="PhDSummary">Research Summary (optional)</label>
            <textarea id="PhDSummary" name="PhDSummary" rows="4"></textarea>
            <input type="hidden" id="10thGrade" name="id" value="${phd.id}" required />
            <button type="submit" id="submit-phd" class="submit-btn">
              Submit
            </button>
          </div>
        </div>
        </form>
        </c:if>
        
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
      </form>
     -->
    </div>
</c:if>
   <form action="/user/checkJournal">
<button type="submit" >next</button>
</form>
    <!-- JavaScript File -->
    <script src="/assets/JS/education1.js"></script>
  </body>
</html>
