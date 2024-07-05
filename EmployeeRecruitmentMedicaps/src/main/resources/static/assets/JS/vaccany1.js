let vacancyCount = 1

function populateDepartments(facultyDropdown, index) {
  const faculty = facultyDropdown.value
  const departmentDropdown = document.getElementById(`department${index}`)

  departmentDropdown.innerHTML = '<option value="">Select Department</option>'

  switch (faculty) {
    case 'Agriculture':
      departmentDropdown.innerHTML += `
                <option value="Agriculture">Agriculture</option>
                
            `
      break

    case 'Arts And Humanities':
      departmentDropdown.innerHTML += `
                  <option value="Languages">Languages</option>
                  
              `
      break

    case 'Commerce':
      departmentDropdown.innerHTML += `
                      <option value="Commerce">Commerce</option>
                      
                  `
      break

    case 'Engineering':
      departmentDropdown.innerHTML += `
            <option value="Computer Science And Engineering">Computer Science And Engineering</option>
            <option value="Civil Engineering">Civil Engineering</option>
            <option value="Electronics Engineering">Electronics Engineering</option>
            <option value="Electrical Engineering">Electrical Engineering</option>
            <option value="Information Technology">Information Technology</option>
            <option value="Computer Application">Computer Application</option>
            <option value="Mechanical Engineering">Mechanical Engineering</option>
                      `
      break
    case 'Law':
      departmentDropdown.innerHTML += `
            <option value="Law">Law</option>
            
                          `
      break
    case 'Management Studies':
      departmentDropdown.innerHTML += `
            <option value="Management Studies">Management Studies</option>
            
                              `
      break

    case 'Pharmacy':
      departmentDropdown.innerHTML += `
                <option value="Pharmacy">Pharmacy</option>
                
            `
      break
    case 'Science':
      departmentDropdown.innerHTML += `
                <option value="Chemistry">Chemistry</option>
                <option value="Mathematics">Mathematics</option>
                <option value="Forensic Science">Forensic Science</option>
                 <option value="Computer Science">Computer Science</option>
                 <option value="Physics">Physics</option>

            `
      break
    default:
      break
  }
}

document.getElementById('addVacancy').addEventListener('click', function () {
  vacancyCount++
  const vacancySection = document.createElement('div')
  vacancySection.classList.add('vacancy-section')
  vacancySection.id = `vacancy${vacancyCount}`
  vacancySection.innerHTML = `
        <button type="button" class="remove-vacancy" onclick="removeVacancy('vacancy${vacancyCount}')">-</button>
        <div class="form-group">
            <label for="faculty${vacancyCount}">Faculty:</label>
            <select id="faculty${vacancyCount}" class="faculty-dropdown" onchange="populateDepartments(this, ${vacancyCount})">
                <option value="">Select Faculty</option>
                <option value="science">Science</option>
                <option value="arts">Arts</option>
                <option value="commerce">Commerce</option>
            </select>
        </div>
        <div class="form-group">
            <label for="department${vacancyCount}">Department:</label>
            <select id="department${vacancyCount}" class="department-dropdown">
                <option value="">Select Department</option>
            </select>
        </div>
        <div class="form-group">
            <label for="post${vacancyCount}">Post:</label>
            <select id="faculty${vacancyCount}" id="post${vacancyCount})">
                <option value="">Select Post</option>
                <option value="Lecturer">Lecturer</option>
                <option value="Assistant Professor">Assistant Professor</option>
                <option value="Associate Professor">Associate Professor</option>
                <option value=" Professor">Professor</option>
            </select>
        </div>
        <div class="form-group">
            <label for="date${vacancyCount}">Date:</label>
            <input type="date" id="date${vacancyCount}" name="date[]" required>
        </div>
        <div class="form-group">
            <label for="lastDate${vacancyCount}">Last Date for Submission:</label>
            <input type="date" id="lastDate${vacancyCount}" name="lastDate[]" required>
        </div>
    `
  document.getElementById('vacancyForm').appendChild(vacancySection)
})

function removeVacancy(sectionId) {
  const section = document.getElementById(sectionId)
  if (section) {
    section.remove()
  }
}

function confirmRemoval(sectionId) {
  if (confirm('Are you sure you want to remove this vacancy section?')) {
    removeVacancy(sectionId)
  }
}
