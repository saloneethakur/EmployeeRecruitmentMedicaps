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
  <body>
  
 <!-- Initialize a flag to check for existing journals -->
<c:set var="hasJournals" value="${false}" scope="page"/>

<!-- Check if there are any journals -->
<c:forEach var="journal" items="${personalInformation.journals}">
    <c:set var="hasJournals" value="${true}" scope="page"/>
</c:forEach>


<c:if test="${not empty personalInformation.journals}">

     <c:if test="${hasJournals}">
    <c:forEach var="journal" items="${personalInformation.journals}">
    <div class="form-container">
      <h1>Research</h1>
      <button type="button" id="editBtn">edit</button>
      <form action="/user/updateJournal">
        <div id="research-sections">
          <h2>Journal Publications</h2>
          <div class="section" id="research-1">
            <div class="field">
              <label for="research-title-1">Publication Title</label>
              <input type="text" id="research-title-1" name="publicationTitle" value="${journal.publicationTitle}" />
            </div>
            <div class="field">
              <label for="research-name-1">Journal Name</label>
              <input type="text" id="research-name-1" name="journalName" value="${journal.journalName}" />
            </div>
            <div class="inline-fields">
              <div class="field" style="flex: 1">
                <label for="research-volume-1">ISSN , Issue no., Volume</label>
                <input type="text" id="research-volume-1" name="volume" value="${journal.volume}" />
              </div>
              <div class="field" style="flex: 1">
                <label for="research-year-1">Year</label>
                <input type="date" id="research-year-1" name="year" value="<fmt:formatDate value='${journal.year}' pattern='yyyy-MM-dd'/>" >
                  
              </div>
            </div>
            <div class="field">
              <label for="research-indexing-1">Indexing</label>
              <select id="research-indexing-1" name="indexing">
                <option value="">Select</option>
                <option value="Web Of Science">Web Of Science</option>
                <option value="Scopus">Scopus</option>
                <option value="UGC CARE">UGC Care</option>
              </select>
            </div>
          </div>
          <input type="hidden" id="10thGrade" name="id" value="${journal.journalId}" required />
          <button type="submit" id="submit-10" class="submit-btn">
            Submit
          </button>
          <div>
            <button class="add-section" id="add-research">Add Research</button>
          </div>
        </div>
      </form>
    </div>
    </c:forEach>
    </c:if>
    </c:if>
    
    
    <!-- Entering first time -->
    <c:if test="${!hasJournals}">
    
    <div class="form-container">
      <h1>Research</h1>
      <button type="button" id="editBtn">edit</button>
      <form action="/user/saveJournal">
        <div id="research-sections">
          <h2>Journal Publications</h2>
          <div class="section" id="research-1">
            <div class="field">
              <label for="research-title-1">Publication Title</label>
              <input type="text" id="research-title-1" name="publicationTitle" value="${journal.publicationTitle}" />
            </div>
            <div class="field">
              <label for="research-name-1">Journal Name</label>
              <input type="text" id="research-name-1" name="journalName" value="${journal.journalName}" />
            </div>
            <div class="inline-fields">
              <div class="field" style="flex: 1">
                <label for="research-volume-1">ISSN , Issue no., Volume</label>
                <input type="text" id="research-volume-1" name="volume" value="${journal.volume}" />
              </div>
              <div class="field" style="flex: 1">
                <label for="research-year-1">Year</label>
                <input type="date" id="research-year-1" name="year" value="<fmt:formatDate value='${journal.year}' pattern='yyyy-MM-dd'/>" >
                  
              </div>
            </div>
            <div class="field">
              <label for="research-indexing-1">Indexing</label>
              <select id="research-indexing-1" name="indexing">
                <option value="">Select</option>
                <option value="Web Of Science">Web Of Science</option>
                <option value="Scopus">Scopus</option>
                <option value="UGC CARE">UGC Care</option>
              </select>
            </div>
          </div>
          <input type="hidden" id="10thGrade" name="id" value="${journal.journalId}" required />
          <button type="submit" id="submit-10" class="submit-btn">
            Submit
          </button>
          <div>
            <button class="add-section" id="add-research">Add Research</button>
          </div>
        </div>
      </form>
    </div>
   
    </c:if>
    
    
      <button onclick="location.href='checkExperience'">next</button>
    <script defer src="/assets/JS/research1.js"></script>
  </body>
</html>
