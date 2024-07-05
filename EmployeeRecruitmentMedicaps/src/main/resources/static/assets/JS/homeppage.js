// Add an event listener to the hamburger menu icon
document.querySelector('.hamburger').addEventListener('click', function() {
    this.classList.toggle('active'); /* Toggle the active class on the hamburger menu icon */
    document.querySelector('.navigation').classList.toggle('active'); /* Toggle the active class on the navigation menu */
  });
 