document.addEventListener('DOMContentLoaded', () => {
    const cardContainer = document.getElementById('card-container');

    // Function to create a card element
    function createCard(vacancy) {
        const card = document.createElement('div');
        card.className = 'card';
        
        card.innerHTML = `
            <div class="card-content">
                <h3>${vacancy.title}</h3>
                <p>${vacancy.shortDescription}</p>
            </div>
            <div class="card-popup">
                <p>${vacancy.longDescription}</p>
                <button class="eligibility-button">Check Eligibility</button>
            </div>
        `;
        
        return card;
    }

    // Function to update vacancies
    async function updateVacancies() {
        try {
            // Fetch vacancies from the server (using a simulated URL)
            const response = await fetch('https://example.com/api/vacancies');
            const vacancies = await response.json();

            // Clear the existing cards
            cardContainer.innerHTML = '';

            // Add the new cards
            vacancies.forEach(vacancy => {
                const card = createCard(vacancy);
                cardContainer.appendChild(card);
            });
        } catch (error) {
            console.error('Error fetching vacancies:', error);
        }
    }

    // Simulate real-time updates with an interval
    setInterval(updateVacancies, 5000); // Update every 5 seconds

    // Initial fetch
    updateVacancies();
});
