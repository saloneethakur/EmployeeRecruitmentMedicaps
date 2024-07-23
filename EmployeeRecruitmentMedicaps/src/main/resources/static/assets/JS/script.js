// Example JavaScript for handling button clicks (optional)
document.addEventListener('DOMContentLoaded', function() {
    const viewDetailsButtons = document.querySelectorAll('.view-details-btn');
    const viewResumeButtons = document.querySelectorAll('.view-resume-btn');

    viewDetailsButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Handle view details action
            console.log('View details clicked');
            // You can implement further actions here like opening a modal or navigating to a details page
        });
    });

    viewResumeButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Handle view resume action
            console.log('View resume clicked');
            // You can implement further actions here like opening a modal or downloading the resume
        });
    });
});
