//document.addEventListener('DOMContentLoaded', () => {
  //const editBtn = document.getElementById('editBtn')
  //const countrySaveBtn = document.getElementById('country-save')
 /* const fieldsToEnable = [
    'full-name',
    'phone',
    'alt-phone',
    'dob',
    'male',
    'female',
    'other',
    'category',
    'area',
    'country',
    'state',
    'district',
    'pincode',
  ]*/
  const additionalFields = document.getElementById('additionalFields')
  const additionalSaveBtns = ['research_save', 'scopus_save', 'orc_save']

  /*// Initially disable all fields
  fieldsToEnable.forEach((id) => (document.getElementById(id).disabled = true))
  additionalSaveBtns.forEach(
    (id) => (document.getElementById(id).disabled = true)
  )*/

 /* editBtn.addEventListener('click', () => {
    fieldsToEnable.forEach((id) => {
      if (id !== 'email') {
        document.getElementById(id).disabled = false
      }
    })
    countrySaveBtn.disabled = false
    additionalFields.style.display = 'none' // Hide additional fields
  })*/

  countrySaveBtn.addEventListener('click', () => {
    /*fieldsToEnable.forEach(
      (id) => (document.getElementById(id).disabled = true)
    )*/
	
    countrySaveBtn.disabled = true
    additionalFields.style.display = 'block' // Show additional fields
    additionalSaveBtns.forEach(
      (id) => (document.getElementById(id).disabled = false)
    )
  })

 const researchIdSaveBtn = document.getElementById('research_save')
  researchIdSaveBtn.addEventListener('click', function () {
    document.getElementById('research-id').disabled = true
    researchIdSaveBtn.disabled = true // Disable save button after click
  })

  const orcidSaveBtn = document.getElementById('orc_save')
  orcidSaveBtn.addEventListener('click', function () {
    document.getElementById('orcid').disabled = true
    orcidSaveBtn.disabled = true // Disable save button after click
  })

  const scopusSaveBtn = document.getElementById('scopus_save')
  scopusSaveBtn.addEventListener('click', function () {
    document.getElementById('scopus-id').disabled = true
    scopusSaveBtn.disabled = true // Disable save button after click
  })
})

function enableForm() {
            var elements = document.getElementsByClassName("form-control");
            for (var i = 0; i < elements.length; i++) {
                elements[i].disabled = false;
            }
        }
		
		