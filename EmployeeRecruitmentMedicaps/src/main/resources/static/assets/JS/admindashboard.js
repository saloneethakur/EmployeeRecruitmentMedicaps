// Function to toggle navigation menu
function toggleNav() {
    const navContainer = document.querySelector('.navcontainer');
    const mainContainer = document.querySelector('.main-container');

    navContainer.classList.toggle('active');
    mainContainer.classList.toggle('fullwidth');

    if (navContainer.classList.contains('active')) {
        // Add event listener to close nav on click outside
        document.addEventListener('click', closeNavOutside);
    } else {
        // Remove event listener when nav is closed
        document.removeEventListener('click', closeNavOutside);
    }
}

// Function to close navigation when clicking outside
function closeNavOutside(event) {
    const navContainer = document.querySelector('.navcontainer');
    const navToggle = document.querySelector('.hamburger');

    if (!navContainer.contains(event.target) && !navToggle.contains(event.target)) {
        navContainer.classList.remove('active');
        const mainContainer = document.querySelector('.main-container');
        mainContainer.classList.remove('fullwidth');
        document.removeEventListener('click', closeNavOutside);
    }
}

// Function to toggle teaching details
function toggleTeachingDetails() {
    const teachingDetails = document.getElementById('teachingDetails');
    const nonTeachingDetails = document.getElementById('nonTeachingDetails');

    if (teachingDetails.style.display === "none" || teachingDetails.style.display === "") {
        teachingDetails.style.display = "block";
        nonTeachingDetails.style.display = "none"; // Hide non-teaching details if visible
    } else {
        teachingDetails.style.display = "none";
    }
}

// Function to toggle non-teaching details
function toggleNonTeachingDetails() {
    event.stopPropagation()
    const teachingDetails = document.getElementById('teachingDetails');
    const nonTeachingDetails = document.getElementById('nonTeachingDetails');

    if (nonTeachingDetails.style.display === "none" || nonTeachingDetails.style.display === "") {
        nonTeachingDetails.style.display = "block";
        teachingDetails.style.display = "none"; // Hide teaching details if visible
    } else {
        nonTeachingDetails.style.display = "none";
    }
}

// Function to toggle filter popup
function toggleFilter(filterId) {
    const filterPopup = document.getElementById(filterId);
    filterPopup.classList.toggle('show');
}

// Function to apply filter logic
function applyFilter(filterId) {
    // Implement filter logic here
    const faculty = document.getElementById('faculty').value;
    const department = document.getElementById('department').value;
    const post = document.getElementById('post').value;
    const applicationDate = document.getElementById('applicationDate').value;

    console.log(`Applying filter for ${filterId}`);
    console.log(`Selected filters - Faculty: ${faculty}, Department: ${department}, Post: ${post}, Application Date: ${applicationDate}`);

    closeFilter(filterId);
}

// Function to reset filter inputs
function resetFilter(filterId) {
    // Reset filter inputs to default values
    document.getElementById('post').selectedIndex = 0; // Reset Post dropdown
    document.getElementById('applicationDate').value = ''; // Reset Application Date input

    console.log(`Resetting filter for ${filterId}`);
    closeFilter(filterId);
}

// Function to close filter popup
function closeFilter(filterId) {
    const filterPopup = document.getElementById(filterId);
    filterPopup.classList.remove('show');
}

// Function to delete a row from a table
function deleteRow(button) {
    const row = button.parentElement.parentElement;
    row.parentNode.removeChild(row);
}

// Event listener for hamburger menu click
document.querySelector('.hamburger').addEventListener('click', toggleNav);

// Event listeners for teaching and non-teaching details toggle (replace with your specific classes)
document.querySelector('.option1').addEventListener('click', toggleTeachingDetails);
document.querySelector('.option2').addEventListener('click', toggleNonTeachingDetails);

// Additional event listeners for filter popup toggle, apply, reset, and close (replace with your specific classes)
document.querySelector('.filter-toggle').addEventListener('click', () => toggleFilter('filter-popup'));
document.querySelector('.filter-apply').addEventListener('click', () => applyFilter('filter-popup'));
document.querySelector('.filter-reset').addEventListener('click', () => resetFilter('filter-popup'));
document.querySelector('.filter-close').addEventListener('click', () => closeFilter('filter-popup'));
