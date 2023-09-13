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

  let lastClickedCell = null; // To keep track of the last clicked cell

  // Close button functionality
  closeBtn.addEventListener('click', function() {
    popup.style.display = 'none';
  });

  // Add click event to each game cell
  gameCells.forEach(function(cell) {
    cell.addEventListener('click', function() {
      const question = cell.getAttribute('data-question');

      // Set question text
      questionElement.textContent = question;

      // Show popup
      popup.style.display = 'block';

      // Store the last clicked cell
      lastClickedCell = cell;
    });
  });

  // Listen for form submission inside popup
  myForm.addEventListener('submit', function(e) {
    e.preventDefault();

    // Just an example, your real answer validation will vary
    const input = myInput.value;

    if (lastClickedCell) { // Check to make sure a cell was clicked
      if (input.toLowerCase() === 'yes') {
        lastClickedCell.style.backgroundColor = 'green';
      } else if (input.toLowerCase() === 'maybe') {
        lastClickedCell.style.backgroundColor = 'yellow';
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
