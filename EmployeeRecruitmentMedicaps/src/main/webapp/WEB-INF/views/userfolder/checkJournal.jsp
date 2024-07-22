<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Information Form</title>
</head>
<body>
<!-- Initialize a flag to check for existing journals -->
<c:set var="hasJournals" value="${false}" scope="page"/>

<!-- Check if there are any journals -->
<c:forEach var="journal" items="${personalInformation.journals}">
    <c:set var="hasJournals" value="${true}" scope="page"/>
</c:forEach>

<!-- Display existing journals if present -->
<c:if test="${hasJournals}">
    <h2>Existing Journals</h2>
    <c:forEach var="journal" items="${personalInformation.journals}">
        <div class="journal-entry">
            <h3>${journal.publicationTitle}</h3>
            <p><strong>Journal Name:</strong> ${journal.journalName}</p>
            <p><strong>Volume:</strong> ${journal.volume}</p>
            <p><strong>Indexing:</strong> ${journal.indexing}</p>
            
        </div>
    </c:forEach>
    <button id="addJournalBtn">Add More Journal</button>
</c:if>

<!-- Display form to add new journal if no journals are present or if "Add More Journal" is clicked -->
<c:if test="${!hasJournals}">
    <form id="addJournalForm" action="/user/addJournal" method="post">
        <h2>Add New Journal</h2>
        <label for="publicationTitle">Publication Title</label>
        <input type="text" id="publicationTitle" name="publicationTitle" required/>
        
        <label for="journalName">Journal Name</label>
        <input type="text" id="journalName" name="journalName" required/>
        
        <label for="volume">Volume</label>
        <input type="text" id="volume" name="volume" required/>
        
        <label for="indexing">Indexing</label>
        <input type="text" id="indexing" name="indexing" required/>
        
 

        <input type="hidden" name="personalInformationId" value="${personalInformation.id}"/>
        
        <button type="submit">Submit</button>
    </form>
</c:if>

<!-- JavaScript to handle the "Add More Journal" button click -->
<<script>
        document.getElementById('addJournalBtn').addEventListener('click', function() {
            var form = document.getElementById('addJournalForm');
            if (form) {
                form.style.display = 'block';
            } else {
                console.error('Form element not found.');
            }
        });
    </script>
    
    </body>
</html>