document.addEventListener('DOMContentLoaded', function () {
    const editButton = document.getElementById('editBtn');
    const form = document.querySelector('form');
    const inputs = document.querySelectorAll('input');
    const confirmCheckbox = document.getElementById('confirm');
  
    // Disable all inputs initially
    inputs.forEach((input) => {
      input.disabled = true;
    });
  
    // Function to toggle inputs based on edit button click
    function toggleInputs() {
      inputs.forEach((input) => {
        input.disabled = !input.disabled;
      });
    }
  
    // Enable/disable inputs when edit button is clicked
    if (editButton) {
      editButton.addEventListener('click', function () {
        toggleInputs();
      });
    }
  
    // Form submission validation
    function validateForm(event) {
      if (confirmCheckbox && !confirmCheckbox.checked) {
        alert('Please confirm that all the information provided is correct.');
        event.preventDefault(); // Prevent form from submitting
      }
    }
  
    // Add submit event listener to the form for validation
    if (form) {
      form.addEventListener('submit', function (event) {
        validateForm(event);
      });
    }
  });
  