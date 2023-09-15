document.addEventListener('DOMContentLoaded', function() {
  // Get all game cells
  const gameCells = document.querySelectorAll('.game-cell');

  // Get the popup and its elements
  const popup = document.getElementById('popup');
  const closeBtn = document.getElementById('closeBtn');
  const questionElement = document.getElementById('question');
  const result = document.getElementById('result');
  const myForm = document.getElementById('myForm');
  const textInput = document.getElementById('textInput');

  // Get the Skip button element
  const skipBtn = document.getElementById('skipBtn');

  // Get and initialize the Total Score
  let totalScore = 0;
  const scoreElement = document.getElementById('scoreValue');

  // Function to update displayed score
  function updateDisplayedScore() {
    scoreElement.textContent = totalScore;
  }

  // To keep track of the last clicked cell
  let lastClickedCell = null;

  // Close button functionality
  closeBtn.addEventListener('click', function() {
    popup.style.display = 'none';
  });

  // Add click event to each game cell
  gameCells.forEach(function(cell) {
    cell.addEventListener('click', function() {
      const question = cell.getAttribute('data-question');
      const points = cell.textContent;

      // Set question text and points
      questionElement.textContent = question;

      // Update the popup header to show the points
      document.querySelector('#popup h2').textContent = points;

      // Show popup
      popup.style.display = 'block';

      // Store the last clicked cell
      lastClickedCell = cell;
    });
  });

  // Add skip button functionality
  skipBtn.addEventListener('click', function() {
    if (lastClickedCell) {
      lastClickedCell.style.backgroundColor = '#C2BA71';
    }

    // Reset the form and hide the popup
    textInput.value = '';
    result.textContent = '';
    popup.style.display = 'none';
  });

  // Listen for form submission inside popup
  myForm.addEventListener('submit', function(e) {
    e.preventDefault();

    const input = textInput.value;
    const points = parseInt(lastClickedCell.textContent, 10); // Parse points to an integer

    if (lastClickedCell) { // Check to make sure a cell was clicked
      if (input.toLowerCase() === 'yes') {
        lastClickedCell.style.backgroundColor = 'green';
        totalScore += points; // Add points for correct answer
      } else if (input.toLowerCase() === 'maybe') {
        lastClickedCell.style.backgroundColor = '#C2BA71';
        // No change in score for 'maybe'
      } else {
        lastClickedCell.style.backgroundColor = 'red';
        totalScore -= points; // Subtract points for incorrect answer
      }

      // Update the displayed score
      updateDisplayedScore();
    }

    // Reset input and hide popup
    textInput.value = '';
    result.textContent = '';
    popup.style.display = 'none';
  });
});
