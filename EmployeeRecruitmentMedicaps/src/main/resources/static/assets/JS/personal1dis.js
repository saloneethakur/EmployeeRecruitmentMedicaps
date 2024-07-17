
/*document.addEventListener('DOMContentLoaded', function () {
  const inputs = document.querySelectorAll('input, select')
  const editButton = document.getElementById('editBtn')
  const form = document.querySelector('form')

  // Disable all inputs and select elements initially
  inputs.forEach((input) => {
    input.disabled = true
  })

  // Enable all inputs and select elements when the edit button is clicked
  editButton.addEventListener('click', function () {
    inputs.forEach((input) => {
      if (input.id !== 'email') {
        // Keep the email field disabled
        input.disabled = false
      }
    })
  })

  // Validate the form before submission
  form.addEventListener('submit', function (event) {
    let formIsValid = true

    inputs.forEach((input) => {
      if (input.hasAttribute('required') && input.value.trim() === '') {
        formIsValid = false
      }
    })

    if (!formIsValid) {
      event.preventDefault() // Prevent form submission
      alert('Please fill out all required fields.')
    }
  })
})
document.getElementById('userForm').addEventListener('submit', function(event) {
            const nullableFields = ['researcherId', 'scopusId', 'orcid', 'examQualified'];

            nullableFields.forEach(function(fieldId) {
                const field = document.getElementById(fieldId);
                if (!field.value.trim()) {
                    field.value = 'null';
                }
            });
        });*/
		/*document.getElementById('userForm').addEventListener('submit', function(event) {
		            const nullableFields = ['researcherId', 'scopusId', 'orcid', 'examQualified'];

		            nullableFields.forEach(function(fieldId) {
		                const field = document.getElementById(fieldId);
		                if (!field.value.trim()) {
		                    field.value = 'null';
		                }
		            });
		        });
		
	/*	document.addEventListener("DOMContentLoaded", function() {
		    const editBtn = document.getElementById('editBtn');
		    const saveBtn = document.getElementById('saveBtn');
		    const editForm = document.getElementById('userForm');
		    const viewForm = document.getElementById('viewForm');

		    if (editBtn) {
		      editBtn.addEventListener('click', function() {
		        enableFields();
		      });
		    }
			document.getElementById('userForm').addEventListener('submit', function(event) {
					            const nullableFields = ['researcherId', 'scopusId', 'orcid', 'examQualified'];

					            nullableFields.forEach(function(fieldId) {
					                const field = document.getElementById(fieldId);
					                if (!field.value.trim()) {
					                    field.value = 'null';
					                }
					            });
					        });

		    function enableFields() {
		      // Enable all form elements in the editForm
		      const inputs = editForm.getElementsByTagName('input');
		      for (let input of inputs) {
		        input.removeAttribute('disabled');
		      }
		      // Enable all select elements in the editForm
		      const selects = editForm.getElementsByTagName('select');
		      for (let select of selects) {
		        select.removeAttribute('disabled');
		      }
		      // Show the save button
		      saveBtn.style.display = 'block';
		      // Hide the edit button
		      editBtn.style.display = 'none';
		    }

		    // Initially disable all fields in the viewForm
		    const viewInputs = viewForm.getElementsByTagName('input');
		    for (let input of viewInputs) {
		      input.setAttribute('disabled', 'true');
		    }
		    const viewSelects = viewForm.getElementsByTagName('select');
		    for (let select of viewSelects) {
		      select.setAttribute('disabled', 'true');
		    }
		  });*/
		  
		  document.addEventListener('DOMContentLoaded', function () {
		      const inputs = document.querySelectorAll('input, select');
		      const editButton = document.getElementById('editBtn');
		      const form = document.querySelector('form');

		      // Disable all inputs and select elements initially
		      if (editButton) {
		          inputs.forEach((input) => {
		              input.disabled = true;
		          });

		          // Enable all inputs and select elements when the edit button is clicked
		          editButton.addEventListener('click', function () {
		              inputs.forEach((input) => {
		                  if (input.id !== 'email'&& input.id !=='post1' && input.id !== 'department1' && input.id !== 'faculty1') {
		                      // Keep the email field disabled
		                      input.disabled = false;
		                  }
		              });
		          });
		      } else {
		          // No edit button, enable fields initially
				  inputs.forEach((input) => {
				  		                  if (input.id !== 'email'&& input.id !=='post1' && input.id !== 'department1' && input.id !== 'faculty1') {
				  		                      // Keep the email field disabled
				  		                      input.disabled = false;
				  		                  }
				  		              });
		      }

		      // Validate the form before submission
		      form.addEventListener('submit', function (event) {
		          let formIsValid = true;

		          inputs.forEach((input) => {
		              if (input.hasAttribute('required') && input.value.trim() === '') {
		                  formIsValid = false;
		              }
		          });

		          if (!formIsValid) {
		              event.preventDefault(); // Prevent form submission
		              alert('Please fill out all required fields.');
		          }
		      });
		  });

