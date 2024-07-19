document.addEventListener('DOMContentLoaded', function () {
  const addSectionBtn = document.getElementById('addSectionBtn')
  let sectionCount = 1 // Initial count (assuming 1 section is present already)
  const maxSections = 7 // Maximum number of sections

  addSectionBtn.addEventListener('click', function () {
    if (sectionCount < maxSections) {
      sectionCount++
      const section = createSection(sectionCount)
      document.getElementById('workExperienceSections').appendChild(section)
    } else {
      alert('You can add a maximum of 6 sections only.')
    }
  })
  function createSection(count) {
    const section = document.createElement('div')
    section.classList.add('section')
    section.innerHTML = `
            
            <div class="flex-container">
                <div class="flex-item">
                    <label for="jobTitle${count}">Job Title:</label>
                    <input type="text" id="jobTitle${count}" name="jobTitle${count}" required>
                </div>
                <div class="flex-item">
                    <label for="instituteName${count}">Institute Name:</label>
                    <input type="text" id="instituteName${count}" name="instituteName${count}" required>
                </div>
                
            </div>
            <div class="flex-container">
                <div class="flex-item">
                    <label for="startDate${count}">Start Date:</label>
                    <input type="date" id="startDate${count}" name="startDate${count}" required>
                </div>
                <div class="flex-item">
                    <label for="endDate${count}">End Date:</label>
                    <input type="date" id="endDate${count}" name="endDate${count}" required>
                </div>
            </div>
            
        `
    return section
  }

  addEndDateFunctionality(sectionCount)

  function addEndDateFunctionality(sectionNumber) {
    const endDateInput = document.getElementById(`endDate${sectionNumber}`)
    const currentlyWorkingCheckbox = document.getElementById(
      `currentlyWorking${sectionNumber}`
    )

    currentlyWorkingCheckbox.addEventListener('change', () => {
      if (currentlyWorkingCheckbox.checked) {
        endDateInput.value = 'Currently Working'
        endDateInput.disabled = true
      } else {
        endDateInput.value = ''
        endDateInput.disabled = false
      }
    })
  }
  const inputs = document.querySelectorAll('input, select')
  const editButton = document.getElementById('editBtn')
  const form = document.querySelector('form')

  // Disable all inputs and select elements initially
  if (editButton) {
    inputs.forEach((input) => {
      input.disabled = true
    })

    // Enable all inputs and select elements when the edit button is clicked
    editButton.addEventListener('click', function () {
      inputs.forEach((input) => {
        input.disabled = false
      })
    })
  } else {
    // No edit button, enable fields initially
    inputs.forEach((input) => {
      input.disabled = false
    })
  }
})
