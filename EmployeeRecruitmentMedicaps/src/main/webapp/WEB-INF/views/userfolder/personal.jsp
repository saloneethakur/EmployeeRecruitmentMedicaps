<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
  <form action="/user/checkEducation">
<button>education</button>
</form>
    <div class="container">
      <h2>Application Form</h2>
      
      <form action="/submit_application" method="post">
       
        <div class="form-section">
         
          <h3>Application Details</h3>
          <div class="row-span">
            <label for="faculty1" style="padding:10px">Faculty:</label>
            <input
              id="faculty1"
              class="faculty-dropdown"
              onchange="populateDepartments(this, 1)"
              value="${vacancy.faculty}"
              disabled
            />
              

            <label for="department1" style="padding:10px" >Department:</label>
            <input id="department1" class="department-dropdown" value="${vacancy.department}" disabled />
             

            <label for="post1" style="padding:19px">Post:</label>
            <input id="post1" class="post-dropdown" value="${vacancy.postAppliedFor}" disabled=true />
              
            
          </div>
        </div>
       
        </form>
        <section>
          <h3>Personal Information</h3>
          <c:choose>
          <c:when test="${res.status == true}">
          <form action="/user/updatepersonalDetails" method="post" >
           <button type="button" id="editBtn" style="position:sticky">Edit</button>
          <div class="row">
            <div class="input-group">
              <label for="full-name">Full Name<span>*</span></label>
              <input
                type="text"
                id="full-name"
                name="name"
                value="${user.name}"
                required
                disabled
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
              <input type="tel" id="phone" name="phone" value="${user.number}" required disabled />
            </div>
            <div class="input-group">
              <label for="alt-phone">Alternate Phone Number</label>
              <input type="tel" id="alt-phone" name="alternatePhoneNumber" value="${res.data.alternatePhoneNumber}" disabled/>
            </div>
          </div>
          <div class="row">
            <div class="input-group">
              <label for="dob">DOB<span>*</span></label>
              <input type="date" id="dob" name="dob" value="<fmt:formatDate value='${res.data.dob}' pattern='yyyy-MM-dd'/>" disabled />
            </div>

            <div class="input-group">
              <div class="category-field">
                <label for="category">Category:<span>*</span></label>
                <select id="category" name="caste" disabled >
                  <option value=""></option>
                  <option value="general" ${res.data.caste == 'general' ? 'selected' : ''}>General</option>
                  <option value="OBC" ${res.data.caste == 'OBC' ? 'selected' : ''} >OBC</option>
                  <option value="ST" ${res.data.caste == 'ST' ? 'selected' : ''} >ST</option>
                  <option value="SC" ${res.data.caste == 'SC' ? 'selected' : ''} >SC</option>
                  <option value="other" ${res.data.caste == 'other' ? 'selected' : ''} >Other</option>
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
                  ${res.data.gender == 'male' ? 'checked' : ''}
                  disabled
                 
                />Male
              </label>
              <label class="radio-option">
                <input
                  type="radio"
                  id="female"
                  name="gender"
                  value="female"
                  ${res.data.gender == 'female' ? 'checked' : ''}
                  disabled
                />Female
              </label>
              <label class="radio-option">
                <input
                  type="radio"
                  id="other"
                  name="gender"
                  value="other"
                  ${res.data.gender == 'other' ? 'checked' : ''}
                  disabled
                />Other
              </label>
            </div>
          </div>

          <div class="row">
            <div class="input-group">
              <label for="area">Address<span>*</span></label>
              <input type="text" id="area" name="address" value="${res.data.address}" required disabled />
            </div>
          </div>
          <div class="row">
            <div class="input-group">
              <label for="district">District<span>*</span></label>
              <input
                type="text"
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
                id="pincode"
                name="pincode"
                value="${res.data.pincode}"
                required
                disabled
              />
            </div>
          </div>
          <div class="row">
            
            <div class="input-group">
              <label for="state">State<span>*</span></label>
              <input id="state" name="state" value="${res.data.state}" required disabled/>
            </div>
            <div class="input-group">
              <label for="country">Country<span>*</span></label>
              <input id="country" name="country" value="${res.data.country}" required disabled/>
            </div>
          </div>

          <!-- <button type="submit" id="country-save" class="save-btn" disabled>
            Save
          </button> -->
          <div id="additionalFields">
            <div class="input-group">
              <label for="research-id">Researcher Id</label>
              <input type="text" id="research-id" name="researcherId" value="${res.data.researcherId}" disabled />
            </div>
            <!-- <button type="submit" id="research_save" class="save-btn" disabled>
              Save
            </button> -->
            <div class="input-group">
              <label for="scopus-id">Scopus Id</label>
              <input type="text" id="scopus-id" name="scopusId" value="${res.data.scopusId}" disabled />
            </div>
            <!-- <button type="submit" id="scopus_save" class="save-btn" disabled>
              Save
            </button> -->
            <div class="input-group">
              <label for="orcid">ORCID</label>
              <input type="text" id="orcid" name="orcid" value="${res.data.orcid}" disabled/>
            </div>
            <button type="submit" id="orc_save" class="save-btn">Save</button>
          </div>
        </form> 
        </c:when>
        
        <c:otherwise>
        
        
        
          <!-- Empty form with fields enabled -->
          <form id="userForm" action="/user/personalDetails" method="post" >
          <div class="row">
            <div class="input-group">
              <label for="full-name">Full Name<span>*</span></label>
              <input
                type="text"
                id="full-name"
                name="name"
                value="${user.name}"
                required
                disabled
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
              <input type="tel" id="phone" name="phone" required />
            </div>
            <div class="input-group">
              <label for="alt-phone">Alternate Phone Number</label>
              <input type="tel" id="alt-phone" name="alternatePhoneNumber" />
            </div>
          </div>
          <div class="row">
            <div class="input-group">
              <label for="dob">DOB<span>*</span></label>
              <input type="date" id="dob" name="dob" />
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
          <div class="row">
            
            <div class="input-group">
              <label for="state">State<span>*</span></label>
              <input id="state" name="state" required />
            </div>
            <div class="input-group">
              <label for="country">Country<span>*</span></label>
              <input id="country" name="country" required />
            </div>
          </div>

          <!-- <button type="submit" id="country-save" class="save-btn" disabled>
            Save
          </button> -->
          <div id="additionalFields">
            <div class="input-group">
              <label for="research-id">Researcher Id</label>
              <input type="text" id="research-id" name="researcherId" />
            </div>
            <!-- <button type="submit" id="research_save" class="save-btn" disabled>
              Save
            </button> -->
            <div class="input-group">
              <label for="scopus-id">Scopus Id</label>
              <input type="text" id="scopus-id" name="scopusId" />
            </div>
            <!-- <button type="submit" id="scopus_save" class="save-btn" disabled>
              Save
            </button> -->
            <div class="input-group">
              <label for="orcid">ORCID</label>
              <input type="text" id="orcid" name="orcid" />
            </div>
            <button type="submit" id="orc_save" class="save-btn">Save</button>
          </div>
        </form>
        </c:otherwise>
        </c:choose>
        </section>
        <!-- 
         <button onclick="location.href='/user/checkEducation'">next</button>
         -->
         <form action="/user/checkEducation">
<button type="submit" >next</button>
</form>
           
      
    </div>
    <script defer src="/assets/JS/personal1dis.js"></script>
  </body>
</html>
