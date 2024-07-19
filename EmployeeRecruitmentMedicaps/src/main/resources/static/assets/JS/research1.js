document.addEventListener('DOMContentLoaded', () => {
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
      <div class="field">
        <label for="${type.toLowerCase()}-title-${count}">Publication Title</label>
        <input type="text" id="${type.toLowerCase()}-title-${count}">
      </div>
      <div class="field">
        <label for="${type.toLowerCase()}-name-${count}">Journal Name</label>
        <input type="text" id="${type.toLowerCase()}-name-${count}">
      </div>
      <div class="inline-fields">
        <div class="field" style="flex: 1">
          <label for="${type.toLowerCase()}-volume-${count}">Issue no., Volume</label>
          <input type="text" id="${type.toLowerCase()}-volume-${count}">
        </div>
        <div class="field" style="flex: 1">
          <label for="${type.toLowerCase()}-year-${count}">Year</label>
          <select id="${type.toLowerCase()}-year-${count}">
            <option value="" disabled selected>Select year</option>
            <option value="2024">2024</option>
            <option value="2023">2023</option>
            <option value="2022">2022</option>
          </select>
        </div>
      </div>
      <div class="field">
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
