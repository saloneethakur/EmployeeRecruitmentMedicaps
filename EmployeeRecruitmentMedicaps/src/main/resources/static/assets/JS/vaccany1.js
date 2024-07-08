// JavaScript for handling department population
function populateDepartments(facultyDropdown, index) {
  const faculty = facultyDropdown.value
  const departmentDropdown = document.getElementById(`department${index}`)

  departmentDropdown.innerHTML = '<option value="">Select Department</option>'

  switch (faculty) {
    case 'Agriculture':
      departmentDropdown.innerHTML +=
        '<option value="Agriculture">Agriculture</option>'
      break
    case 'Arts And Humanities':
      departmentDropdown.innerHTML +=
        '<option value="Languages">Languages</option>'
      break
    case 'Commerce':
      departmentDropdown.innerHTML +=
        '<option value="Commerce">Commerce</option>'
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
      departmentDropdown.innerHTML += '<option value="Law">Law</option>'
      break
    case 'Management Studies':
      departmentDropdown.innerHTML +=
        '<option value="Management Studies">Management Studies</option>'
      break
    case 'Pharmacy':
      departmentDropdown.innerHTML +=
        '<option value="Pharmacy">Pharmacy</option>'
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

// JavaScript for handling popup visibility
document.addEventListener('DOMContentLoaded', () => {
  const addVacancyButton = document.getElementById('addVacancy')
  const closePopupButton = document.getElementById('closePopup')
  const popup = document.getElementById('popup')

  addVacancyButton.addEventListener('click', () => {
    popup.style.display = 'flex'
  })

  closePopupButton.addEventListener('click', () => {
    window.location.href = 'home.jsp'
  })

  window.addEventListener('click', (event) => {
    if (event.target === popup) {
      popup.style.display = 'none'
    }
  })
})

