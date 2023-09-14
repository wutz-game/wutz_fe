document.addEventListener('DOMContentLoaded', function() {
  // Get all game cells
  const gameCells = document.querySelectorAll('.game-cell');

  // Get the popup and its elements
  const popup = document.getElementById('popup');
  const closeBtn = document.getElementById('closeBtn');
  const questionElement = document.getElementById('question');
  const result = document.getElementById('result');
  const myForm = document.getElementById('myForm');
  const myInput = document.getElementById('myInput');

  // Get the Skip button element
const skipBtn = document.getElementById('skipBtn');

  let lastClickedCell = null; // To keep track of the last clicked cell

  // Close button functionality
  closeBtn.addEventListener('click', function() {
    popup.style.display = 'none';
  });

// Add click event to each game cell
gameCells.forEach(function(cell) {
  cell.addEventListener('click', function() {
    const question = cell.getAttribute('data-question');
    const points = cell.textContent;  // Get the points text from the cell

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
  // Check to make sure a cell was clicked
  if (lastClickedCell) {
    lastClickedCell.style.backgroundColor = '#C2BA71';
  }

    // Reset the form and hide the popup
    myInput.value = '';
    result.textContent = '';
    popup.style.display = 'none';
  });

  // Listen for form submission inside popup
  myForm.addEventListener('submit', function(e) {
    e.preventDefault();

    // Just an example, the real answer validation will vary
    const input = myInput.value;

    if (lastClickedCell) { // Check to make sure a cell was clicked
      if (input.toLowerCase() === 'yes') {
        lastClickedCell.style.backgroundColor = 'green';
      } else if (input.toLowerCase() === 'maybe') {
        lastClickedCell.style.backgroundColor = '#C2BA71';
      } else {
        lastClickedCell.style.backgroundColor = 'red';
      }
    }

    // Reset input and hide popup
    myInput.value = '';
    result.textContent = '';
    popup.style.display = 'none';
  });
});
