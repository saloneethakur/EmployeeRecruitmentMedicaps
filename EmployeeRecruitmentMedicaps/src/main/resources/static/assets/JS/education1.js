document.addEventListener('DOMContentLoaded', function () {
  const toggleButtons = document.querySelectorAll('.toggle-button')

  // Event listeners for each toggle button to show/hide the respective section
  toggleButtons.forEach((button) => {
    button.addEventListener('click', function () {
      const targetId = this.parentNode.getAttribute('data-target')
      const sectionDetails = document.getElementById(targetId)

      // Toggle visibility of the section details
      if (sectionDetails.style.display === 'block') {
        sectionDetails.style.display = 'none'
        this.textContent = '+'
      } else {
        sectionDetails.style.display = 'block'
        this.textContent = '-'
      }
    })
  })

  // Field options based on degree selections
  const degreeFieldMapping = {
    UGDegree: {
      Engineering: ['Computer Science', 'Mechanical', 'Civil', 'Electronics'],
      Management: ['Finance', 'Marketing', 'Human Resources'],
      BA: ['History', 'Political Science', 'Sociology'],
      BSc: ['Biology', 'Physics', 'Chemistry'],
    },
    PGDegree: {
      MBA: ['Finance', 'Marketing', 'Human Resources'],
      MSc: ['Biology', 'Physics', 'Chemistry'],
      MTech: ['Computer Science', 'Mechanical', 'Civil'],
    },
  }

  // Function to populate fields based on degree selection
  function populateFields(degreeElementId, fieldElementId) {
    const degreeElement = document.getElementById(degreeElementId)
    const fieldContainer = document.getElementById(`${fieldElementId}Container`)

    degreeElement.addEventListener('change', function () {
      const selectedDegree = degreeElement.value
      fieldContainer.innerHTML = ''

      if (selectedDegree === 'Others') {
        const otherInput = document.createElement('input')
        otherInput.type = 'text'
        otherInput.name = `${fieldElementId}Others`
        otherInput.id = `${fieldElementId}Others`
        otherInput.placeholder = 'Enter your field of study'
        fieldContainer.appendChild(otherInput)
      } else {
        const label = document.createElement('label')
        label.htmlFor = fieldElementId
        label.textContent = 'Field of Study'
        fieldContainer.appendChild(label)

        const select = document.createElement('select')
        select.id = fieldElementId
        select.name = fieldElementId
        select.required = true

        const defaultOption = document.createElement('option')
        defaultOption.value = ''
        defaultOption.textContent = 'Select Field'
        select.appendChild(defaultOption)

        if (degreeFieldMapping[degreeElementId][selectedDegree]) {
          degreeFieldMapping[degreeElementId][selectedDegree].forEach(
            (field) => {
              const option = document.createElement('option')
              option.value = field
              option.textContent = field
              select.appendChild(option)
            }
          )
        }

        // Append the select element to the container
        fieldContainer.appendChild(select)

        // Add change event listener to handle "Others" option within dynamic select
        select.addEventListener('change', function () {
          if (select.value === 'Others') {
            const otherInput = document.createElement('input')
            otherInput.type = 'text'
            otherInput.name = `${fieldElementId}Others`
            otherInput.id = `${fieldElementId}Others`
            otherInput.placeholder = 'Field'
            fieldContainer.appendChild(otherInput)
          } else {
            const existingOtherInput = document.getElementById(
              `${fieldElementId}Others`
            )
            if (existingOtherInput) {
              existingOtherInput.remove()
            }
          }
        })
      }
    })
  }

  // Apply the function to the UG and PG degree dropdowns
  populateFields('UGDegree', 'UGField')
  populateFields('PGDegree', 'PGField')

  // Additional logic for the "Others" option in 12th grade field
  const twelfthFieldContainer = document.getElementById('12thField').parentNode

  document.getElementById('12thField').addEventListener('change', function () {
    const selectedOption = this.value
    const existingOtherInput = document.getElementById('12thFieldOthers')

    if (selectedOption === 'Others') {
      if (!existingOtherInput) {
        const otherInput = document.createElement('input')
        otherInput.type = 'text'
        otherInput.name = '12thFieldOthers'
        otherInput.id = '12thFieldOthers'
        otherInput.placeholder = 'Field'
        twelfthFieldContainer.appendChild(otherInput)
      }
    } else if (existingOtherInput) {
      existingOtherInput.remove()
    }
  })

  // Function to create and append a new PG section
  function addPGSection() {
    const pgSection = document.createElement('div')
    pgSection.classList.add('education-section')

    const sectionCount = document.querySelectorAll('.education-section').length
    const newSectionId = `section-PG-${sectionCount}`

    pgSection.innerHTML = `
      <label for="PGDegree-${sectionCount}">Degree</label>
      <select id="PGDegree-${sectionCount}" name="PGDegree-${sectionCount}" required>
        <option value="">Select Degree</option>
        <option value="MBA">MBA</option>
        <option value="MSc">MSc</option>
        <option value="MTech">MTech</option>
        <option value="Others">Others</option>
      </select>

      <div id="PGFieldContainer-${sectionCount}">
        <label for="PGField-${sectionCount}">Field of Study</label>
        <select id="PGField-${sectionCount}" name="PGField-${sectionCount}">
          <option value="">Select Field</option>
        </select>
      </div>

      <label for="PGInstitution-${sectionCount}">Institution Attended</label>
      <input type="text" id="PGInstitution-${sectionCount}" name="PGInstitution-${sectionCount}" required />

      <label for="PGYear-${sectionCount}">Year of Completion</label>
      <input type="date" id="PG-date-${sectionCount}" name="PG-date-${sectionCount}" required />

      <label for="PGGrade-${sectionCount}">Percentage/Grade</label>
      <input type="text" id="PGGrade-${sectionCount}" name="PGGrade-${sectionCount}" required />
    `

    // Add the new PG section just below the "Add Postgraduate" button
    const addPGButton = document.getElementById('add-PG')
    addPGButton.parentNode.insertBefore(pgSection, addPGButton.nextSibling)

    // Hide the "Add Postgraduate" button
    addPGButton.style.display = 'none'

    // Apply field population to the new PG section
    populateFields(`PGDegree-${sectionCount}`, `PGField-${sectionCount}`)
  }

  // Event listener for the "Add Postgraduate" button
  document.getElementById('add-PG').addEventListener('click', addPGSection)

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
