<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee Recruitment Application Form</title>
    <link rel="stylesheet" href="/assets/css/personal1dis.css" />
  </head>
  <body>
    <div class="container">
      <h2>Application Form</h2>
      <c:choose>
      <c:when test="${res.status == true}">
      <form action="/submit_application" method="post">
        <div class="form-section">
        
          
          
          <h3>Application Details</h3>
          <div class="row-span">
            <label for="faculty1">Faculty:</label>
            <input type="text"
              id="faculty1"
              class="faculty-dropdown"
              onchange="populateDepartments(this, 1)"
              name="faculty"
              value="${vacancy.faculty}"
             />
              

            <label for="department1">Department:</label>
            <input type="text" id="department1" class="department-dropdown" />
             

            <label for="post1">Post:</label>
            <input type="text" class="post-dropdown">
             
          </div>
        </div>
        </form>
        </c:when>
        </c:choose>
        <section>
          <h3>Personal Information</h3>
          
          <c:choose>
          <c:when test="${res.status == true}">
  <!-- Form with personal information displayed and fields disabled -->
          
          <form action="/user/updatepersonalDetails" method="post" >
          <div class="row">
            <div class="input-group">
              <label for="full-name">Full Name<span>*</span></label>
              <input
                type="text"
                class="form-control"
                id="full-name"
                name="name"
                value="${user.name}"
                required
                disabled
              />
            </div>
            <div class="input-group">
              <label for="email">Email<span>*</span></label>
              <input type="email" class="form-control" id="email" name="email" value="${user.email}" required disabled />
            </div>
          </div>
          <div class="row">
            <div class="input-group">
              <label for="phone">Phone Number<span>*</span></label>
              <input type="tel" class="form-control" id="phone" name="phone" value="${user.number}" required disabled />
            </div>
            <div class="input-group">
              <label for="alt-phone">Alternate Phone Number</label>
              <input type="tel" class="form-control" id="alt-phone" name="alternatePhoneNumber" value="${res.data.alternatePhoneNumber}" disabled />
            </div>
          </div>
          <div class="row">
            <div class="input-group">
              <label for="dob">DOB<span>*</span></label>
              <input type="date" class="form-control" id="dob" name="dob" value="${res.data.dob}" disabled />
            </div>
            <div class="input-group">
              <div class="gender-field">
                <label for="gender" class="gender-label"
                  >Gender:<span>*</span></label
                >
                <label class="radio-option">
                  <input
                    type="radio"
                    class="form-control"
                    id="male"
                    name="gender"
                    value="male"
                    disabled
                    ${res.data.gender == 'male' ? 'checked' : ''}
                   />Male
                </label>
                <label class="radio-option">
                  <input
                    type="radio"
                    class="form-control"
                    id="female"
                    name="gender"
                    value="female"
                    disabled
                    ${res.data.gender == 'female' ? 'checked' : ''}
                  />Female
                </label>
                <label class="radio-option">
                  <input
                    type="radio"
                    class="form-control"
                    id="other"
                    name="gender"
                    value="other"
                    disabled
                    ${res.data.gender == 'other' ? 'checked' : ''}
                  />Other
                </label>
              </div>
            </div>
          </div>

          <div class="category-field">
            <label for="category">Category:<span>*</span></label>
            <select class="form-control" id="category" name="caste" disabled >
              <option value=""></option>
              <option value="general" ${res.data.caste == 'general' ? 'selected' : ''} >General</option>
              <option value="OBC" ${res.data.caste == 'OBC' ? 'selected' : ''} >OBC</option>
              <option value="ST" ${res.data.caste == 'ST' ? 'selected' : ''} >ST</option>
              <option value="SC" ${res.data.caste == 'SC' ? 'selected' : ''} >SC</option>
              <option value="other" ${res.data.caste == 'other' ? 'selected' : ''} >Other</option>
            </select>
          </div>

          <div class="row">
            <div class="input-group">
              <label for="area">Address<span>*</span></label>
              <input type="text" class="form-control" id="area" name="address" value="${res.data.address}" required disabled />
            </div>
          </div>
          <div class="row">
            <div class="input-group">
              <label for="country">Country<span>*</span></label>
              <input id="country" class="form-control" name="country" value="${res.data.country}" required disabled />
            </div>
            <div class="input-group">
              <label for="state">State<span>*</span></label>
              <input id="state" class="form-control" name="state" value="${res.data.state}" required disabled />
            </div>
          </div>
          <div class="row">
            <div class="input-group">
              <label for="district">District<span>*</span></label>
              <input
                type="text"
                class="form-control"
                id="district"
                name="district"
                value="${res.data.district}"
                required
                disabled
              />
            </div>

            <div class="input-group">
              <label for="pincode">Pincode<span>*</span></label>
              <input
                type="text"
                class="form-control"
                id="pincode"
                name="pincode"
                value="${res.data.pincode}" 
                required
                disabled
              />
            </div>
          </div>
          <button type="submit" id="country-save" class="save-btn"  disabled>
            Save
          </button>
          <button type="button" onclick="enableForm()" >Edit</button>
          </form>
          
                      <!-- Separate forms for adding Researcher ID, Scopus ID, and ORCID ID -->
          
          <div class="row">
            <div class="input-group">
            <form action="/user/addResearcherId" method="post">
              <label for="research-id">Researcher Id</label>
              <input type="text" id="research-id" name="researcherId" value="${res.data.researcherId}" disabled />
            </div>
          </div>
          <button type="submit" id="research_save" class="save-btn" disabled>
            Save
          </button>
          </form>
          <div class="input-group">
           <form action="/user/addScopusId" method="post">
            <label for="scopus-id">Scopus Id</label>
            <input type="text" id="scopus-id" name="scopusId" value="${res.data.scopusId}"  disabled />
          </div>
          <button type="button" id="scopus_save" class="save-btn" disabled>
            Save
          </button>
          </form>
          
          <div class="input-group">
          <form action="/user/addOrcidId" method="post">
            <label for="orcid">ORCID</label>
            <input type="text" id="orcid" name="orcid" value="${res.data.orcid}" disabled />
          </div>
          <button type="button" id="orc_save" class="save-btn" disabled>
            Save
          </button>
          </form>
          </c:when>
          
          <c:otherwise>
          <!-- Empty form with fields enabled -->
          <form action="/user/personalDetails" method="post" >
          <div class="row">
            <div class="input-group">
              <label for="full-name">Full Name<span>*</span></label>
              <input
                type="text"
                id="full-name"
                name="name"
                required
                
              />
            </div>
            <div class="input-group">
              <label for="email">Email<span>*</span></label>
              <input type="email" id="email" name="email" value="${user.email}" required disabled />
            </div>
          </div>
          <div class="row">
            <div class="input-group">
              <label for="phone">Phone Number<span>*</span></label>
              <input type="tel" id="phone" name="phone" required  />
            </div>
            <div class="input-group">
              <label for="alt-phone">Alternate Phone Number</label>
              <input type="tel" id="alt-phone" name="alternatePhoneNumber" />
            </div>
          </div>
          <div class="row">
            <div class="input-group">
              <label for="dob">DOB<span>*</span></label>
              <input type="date" id="dob" name="dob"  />
            </div>

            <div class="input-group">
              <div class="category-field">
                <label for="category">Category:<span>*</span></label>
                <select id="category" name="caste">
                  <option value=""></option>
                  <option value="general" selected>General</option>
                  <option value="OBC">OBC</option>
                  <option value="ST">ST</option>
                  <option value="SC">SC</option>
                  <option value="other">Other</option>
                </select>
              </div>
            </div>
          </div>
          <div class="input-group">
            <div class="gender-field">
              <label for="gender" class="gender-label"
                >Gender:<span>*</span></label
              >
              <label class="radio-option">
                <input
                  type="radio"
                  id="male"
                  name="gender"
                  value="male"
                  
                  checked
                />Male
              </label>
              <label class="radio-option">
                <input
                  type="radio"
                  id="female"
                  name="gender"
                  value="female"
                 
                />Female
              </label>
              <label class="radio-option">
                <input
                  type="radio"
                  id="other"
                  name="gender"
                  value="other"
                  
                />Other
              </label>
            </div>
          </div>

          <div class="row">
            <div class="input-group">
              <label for="area">Address<span>*</span></label>
              <input type="text" id="area" name="address" required />
            </div>
          </div>
          <div class="row">
            <div class="input-group">
              <label for="country">Country<span>*</span></label>
              <input id="country" name="country" required  />
            </div>
            <div class="input-group">
              <label for="state">State<span>*</span></label>
              <input id="state" name="state" required />
            </div>
          </div>
          <div class="row">
            <div class="input-group">
              <label for="district">District<span>*</span></label>
              <input
                type="text"
                id="district"
                name="district"
                required
                
              />
            </div>

            <div class="input-group">
              <label for="pincode">Pincode<span>*</span></label>
              <input
                type="text"
                id="pincode"
                name="pincode"
                required
                
              />
            </div>
          </div>
          <button type="submit" id="country-save" class="save-btn" >
            Save
          </button>
          </form>
          
          <!-- Separate forms for adding Researcher ID, Scopus ID, and ORCID ID -->
          <div id="additionalFields">
          
          <form action="/user/addResearcherId" method="post">
            
              <div class="input-group">
              
                <label for="research-id">Researcher Id</label>
                <input
                  type="text"
                  id="research-id"
                  name="researcherId"
                  
                />
                 <button type="submit" id="research_save" class="save-btn" >
              Save
            </button>
            </div>
            </form>
              
            
           
            <form action="/user/addScopusId" method="post">
            <div class="input-group">
            
              <label for="scopus-id">Scopus Id</label>
              <input type="text" id="scopus-id" name="scopus-id"  />
            </div>
            <button type="submit" id="scopus_save" class="save-btn" >
              Save
            </button>
            </form>
            
            <form action="/user/addOrcidId" method="post">
            <div class="input-group">
              <label for="orcid">ORCID</label>
              <input type="text" id="orcid" name="orcid" />
            </div>
            <button type="submit" id="orc_save" class="save-btn" >
              Save
            </button>
            </form>
          </div>
          
          </c:otherwise>
          </c:choose>
        </section>
       </div>
    
    <script defer src="/assets/JS/personal1dis.js"></script>
     
  </body>
</html>


