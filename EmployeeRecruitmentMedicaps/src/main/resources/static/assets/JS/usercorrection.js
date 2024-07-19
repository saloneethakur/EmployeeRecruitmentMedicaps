document.addEventListener('DOMContentLoaded', function () {
  const sidebarLinks = document.querySelectorAll('.sidebar-link')
  const formSections = document.querySelectorAll('.form-section')
  const editButton = document.querySelector('.edit-button')
  const saveButtons = document.querySelectorAll('.save-button')
  const formInputs = document.querySelectorAll(
    'input[type="text"], input[type="email"], input[type="tel"], input[type="number"], input[type="file"], input[type="date"], input[type="radio"],select'
  )

  // Function to disable form inputs and save buttons
  function disableFormElements() {
    formInputs.forEach((input) => {
      input.disabled = true
    })
    saveButtons.forEach((button) => {
      button.style.display = 'none'
    })
  }

  // Initially disable form inputs and save buttons
  disableFormElements()

  // Event listener for sidebar links
  sidebarLinks.forEach((link) => {
    link.addEventListener('click', function (event) {
      event.preventDefault()

      // Hide all form sections
      formSections.forEach((section) => {
        section.style.display = 'none'
      })

      // Show the target form section
      const targetId = this.getAttribute('data-target')
      const targetSection = document.getElementById(targetId)
      targetSection.style.display = 'block'
    })
  })

  // Event listener for edit button
  editButton.addEventListener('click', function () {
    // Enable all form inputs and save buttons
    formInputs.forEach((input) => {
      input.disabled = false
    })
    saveButtons.forEach((button) => {
      button.style.display = 'block'
    })
  })

  // Event listener for save buttons
  saveButtons.forEach((button) => {
    button.addEventListener('click', function (event) {
      // Prevent form from closing immediately
      event.preventDefault()
      event.stopPropagation()
      alert('Form saved!')

      // Optionally, you can add code here to handle form submission or saving data
    })
  })

  /*education*/
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
        otherInput.placeholder = ' Field '
        twelfthFieldContainer.appendChild(otherInput)
      }
    } else if (existingOtherInput) {
      existingOtherInput.remove()
    }
  })

  /*work*/
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
            
            <div class="work-flex-container">
                <div class="work-flex-item">
                    <label for="jobTitle${count}">Job Title:</label>
                    <input type="text" id="jobTitle${count}" name="jobTitle${count}" required>
                </div>
                <div class="work-flex-item">
                    <label for="instituteName${count}">Institute Name:</label>
                    <input type="text" id="instituteName${count}" name="instituteName${count}" required>
                </div>
                
            </div>
            <div class="work-flex-container">
                <div class="work-flex-item">
                    <label for="startDate${count}">Start Date:</label>
                    <input type="date" id="startDate${count}" name="startDate${count}" required>
                </div>
                <div class="work-flex-item">
                    <label for="endDate${count}">End Date:</label>
                    <input type="date" id="endDate${count}" name="endDate${count}" required>
                </div>
            </div>
            
        `
    return section
  }

  /*research*/
  const researchContainer = document.getElementById('research-sections')

  let researchCount = 1
  const maxCount = 7

  document.getElementById('add-research').addEventListener('click', () => {
    if (validateSection('research', researchCount)) {
      if (researchCount < maxCount) {
        researchCount++
        addSection(researchContainer, 'Research', researchCount)
      } else {
        alert('You can add a maximum of 6 sections only.')
      }
    } else {
      alert(
        'Please fill out all fields in the current research section before adding another.'
      )
    }
  })

  function addSection(container, type, count) {
    const section = document.createElement('div')
    section.className = 'section'
    section.id = `${type.toLowerCase()}-${count}`
    section.innerHTML = `
        <div class="research-field">
          <label for="${type.toLowerCase()}-title-${count}">Publication Title</label>
          <input type="text" id="${type.toLowerCase()}-title-${count}">
        </div>
        <div class="research-field">
          <label for="${type.toLowerCase()}-name-${count}">Journal Name</label>
          <input type="text" id="${type.toLowerCase()}-name-${count}">
        </div>
        <div class="research-inline-fields">
          <div class="research-field" style="flex: 1">
            <label for="${type.toLowerCase()}-volume-${count}">Issue no., Volume</label>
            <input type="text" id="${type.toLowerCase()}-volume-${count}">
          </div>
          <div class="research-field" style="flex: 1">
            <label for="${type.toLowerCase()}-year-${count}">Year</label>
            <select id="${type.toLowerCase()}-year-${count}">
              <option value="" disabled selected>Select year</option>
              <option value="2024">2024</option>
              <option value="2023">2023</option>
              <option value="2022">2022</option>
            </select>
          </div>
        </div>
        <div class="research-field">
          <label for="${type.toLowerCase()}-indexing-${count}">Indexing</label>
          <select id="${type.toLowerCase()}-indexing-${count}">
            <option value="">Select</option>
            <option value="Engineering">Engineering</option>
            <option value="Management">Management</option>
            <option value="BA">BA</option>
            <option value="BSc">BSc</option>
          </select>
        </div>
      `
    container.insertBefore(section, container.lastElementChild)
  }

  function validateSection(type, count) {
    const title = document.getElementById(`${type}-title-${count}`).value
    const name = document.getElementById(`${type}-name-${count}`).value
    const volume = document.getElementById(`${type}-volume-${count}`).value
    const year = document.getElementById(`${type}-year-${count}`).value
    const indexing = document.getElementById(`${type}-indexing-${count}`).value
    return title && name && volume && year && indexing
  }

  sidebarLinks.forEach((link) => {
    link.addEventListener('click', function () {
      sidebarLinks.forEach((link) => link.classList.remove('active'))
      this.classList.add('active')
    })
  })
})
