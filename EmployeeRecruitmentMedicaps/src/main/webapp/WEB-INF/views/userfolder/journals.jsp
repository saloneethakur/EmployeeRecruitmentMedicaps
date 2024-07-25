<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
    
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Research</title>
    <link rel="stylesheet" href="/assets/css/research1.css" />
  </head>
  <style>
    /* Initially hide the form */
    #research-form {
      display: none;
    }
  </style>
  <body>
   <button id="add-research-btn">Add Research</button>
 <!-- Initialize a flag to check for existing journals -->
<c:set var="hasJournals" value="${false}" scope="page"/>

<!-- Check if there are any journals -->
<c:forEach var="journal" items="${personalInformation.journals}">
    <c:set var="hasJournals" value="${true}" scope="page"/>
    
</c:forEach>


<c:if test="${not empty personalInformation.journals}">
 <button type="button" id="editBtn" onclick="enableFormFields()">Edit</button>
  </c:if>

     <c:if test="${hasJournals}">
    <c:forEach var="journal" items="${personalInformation.journals}">
    <div class="form-container">
      <h1>Research</h1>
  
      <form id="educationForm" action="/user/updateJournal">
        <div id="research-sections">
          <h2>Journal Publications</h2>
          <div class="section" id="research-1">
            <div class="field">
              <label for="research-title-1">Publication Title</label>
              <input type="text" id="research-title-1" name="publicationTitle" value="${journal.publicationTitle}" disabled />
            </div>
            <div class="field">
              <label for="research-name-1">Journal Name</label>
              <input type="text" id="research-name-1" name="journalName" value="${journal.journalName}" disabled/>
            </div>
            <div class="inline-fields">
              <div class="field" style="flex: 1">
                <label for="research-volume-1">ISSN , Issue no., Volume</label>
                <input type="text" id="research-volume-1" name="volume" value="${journal.volume}" disabled/>
              </div>
              <div class="field" style="flex: 1">
                <label for="research-year-1">Year</label>
                <input type="date" id="research-year-1" name="year" value="<fmt:formatDate value='${journal.year}' pattern='yyyy-MM-dd'/>" disabled/>
                  
              </div>
            </div>
            <div class="field">
              <label for="research-indexing-1">Indexing</label>
              <select id="research-indexing-1" name="indexing">
                <option selected value="${journal.journalId}">Select</option>
                <option value="Web Of Science">Web Of Science</option>
                <option value="Scopus">Scopus</option>
                <option value="UGC CARE">UGC Care</option>
              </select>
            </div>
          </div>
          <input type="hidden" id="10thGrade" name="journal_id" value="${journal.journalId}" required disabled/>
          <button type="submit" id="submit-10" class="submit-btn">
            Submit
          </button>
          
        </div>
      </form>
     
    </div>
    </c:forEach>
    </c:if>
 
    
    
    <!-- Entering first time -->
    <c:if test="${!hasJournals}">
    
    <div class="form-container">
      <h1>Research</h1>
     
      <form action="/user/saveJournal" id="research-form">
        <div id="research-sections">
          <h2>Journal Publications</h2>
          <div class="section" id="research-1">
            <div class="field">
              <label for="research-title-1">Publication Title</label>
              <input type="text" id="research-title-1" name="publicationTitle"  />
            </div>
            <div class="field">
              <label for="research-name-1">Journal Name</label>
              <input type="text" id="research-name-1" name="journalName" />
            </div>
            <div class="inline-fields">
              <div class="field" style="flex: 1">
                <label for="research-volume-1">ISSN , Issue no., Volume</label>
                <input type="text" id="research-volume-1" name="volume"  />
              </div>
              <div class="field" style="flex: 1">
                <label for="research-year-1">Year</label>
                <input type="date" id="research-year-1" name="year" >
                  
              </div>
            </div>
            <div class="field">
              <label for="research-indexing-1">Indexing</label>
              <select id="research-indexing-1" name="indexing">
            
                <option value="Web Of Science">Web Of Science</option>
                <option value="Scopus">Scopus</option>
                <option value="UGC CARE">UGC Care</option>
              </select>
            </div>
          </div>
       
          <button type="submit" id="submit-10" class="submit-btn">
            Submit
          </button>
        </div>
      </form>
    </div>
   
    </c:if>
    
    
      <form action="/user/saveJournal" id="research-form">
        <div id="research-sections">
          <h2>Journal Publications</h2>
          <div class="section" id="research-1">
            <div class="field">
              <label for="research-title-1">Publication Title</label>
              <input type="text" id="research-title-1" name="publicationTitle"  />
            </div>
            <div class="field">
              <label for="research-name-1">Journal Name</label>
              <input type="text" id="research-name-1" name="journalName" />
            </div>
            <div class="inline-fields">
              <div class="field" style="flex: 1">
                <label for="research-volume-1">ISSN , Issue no., Volume</label>
                <input type="text" id="research-volume-1" name="volume"  />
              </div>
              <div class="field" style="flex: 1">
                <label for="research-year-1">Year</label>
                <input type="date" id="research-year-1" name="year" >
                  
              </div>
            </div>
            <div class="field">
              <label for="research-indexing-1">Indexing</label>
              <select id="research-indexing-1" name="indexing">
            
                <option value="Web Of Science">Web Of Science</option>
                <option value="Scopus">Scopus</option>
                <option value="UGC CARE">UGC Care</option>
              </select>
            </div>
          </div>
       
          <button type="submit" id="submit-10" class="submit-btn">
            Submit
          </button>
        </div>
      </form>
    
    
      <button onclick="location.href='checkExperience'">next</button>
    <script defer src="/assets/JS/research1.js"></script>
    <script>
function enableFormFields() {
    var form = document.getElementById('educationForm');
    var elements = form.elements;
    for (var i = 0; i < elements.length; i++) {
        elements[i].disabled = false;
    }
}
document.getElementById('add-research-btn').addEventListener('click', function () {
    document.getElementById('research-form').style.display = 'block';
  });
</script>
  </body>
</html>
