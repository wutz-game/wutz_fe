document.addEventListener('DOMContentLoaded', function() {
  function loadGameState() {
    const savedState = JSON.parse(localStorage.getItem('gameState')) || {};
    const savedScore = parseInt(localStorage.getItem('gameScore')) || 0;

    // Load saved state
    for (const [cellId, color] of Object.entries(savedState)) {
      document.getElementById(cellId).style.backgroundColor = color;
    }

    return savedScore;
  }

  function saveGameState() {
    let gameState = {};
    gameCells.forEach((cell) => {
      gameState[cell.id] = cell.style.backgroundColor;
    });
    localStorage.setItem('gameState', JSON.stringify(gameState));
    localStorage.setItem('gameScore', totalScore);
  }

  // Get all game cells
  const gameCells = document.querySelectorAll('.game-cell');

  // Load previous game state and score
  let totalScore = loadGameState();
  const scoreElement = document.getElementById('scoreValue');
  scoreElement.textContent = totalScore;

  // Initial overlay
  const initialPopup = document.getElementById('initialPopup');
  const playBtn = document.getElementById('playBtn');
  const loginBtn = document.getElementById('loginBtn');
  const howToPlayBtn = document.getElementById('howToPlayBtn');

  const howToPlayPopup = document.getElementById('howToPlayPopup');
  const howToPlayCloseBtn = document.getElementById('howToPlayCloseBtn');
  const returnBtn = document.getElementById('returnBtn');

    // When Play button is clicked, hide initial popup
    playBtn.addEventListener('click', function() {
      initialPopup.style.display = 'none';
    });

    // When Login button is clicked (does nothing for now)
    loginBtn.addEventListener('click', function() {
      // Do nothing for now
    });

    // When How to Play button is clicked, show the How to Play popup
    howToPlayBtn.addEventListener('click', function() {
      howToPlayPopup.style.display = 'block';
    });

    // Close How to Play popup
    howToPlayCloseBtn.addEventListener('click', function() {
      howToPlayPopup.style.display = 'none';
    });

    // Return to the initial popup from How to Play popup
    returnBtn.addEventListener('click', function() {
      howToPlayPopup.style.display = 'none';
      initialPopup.style.display = 'block';
    });

      // Get the current date
  var currentDate = new Date();

  // Get the day, month, and year
  var day = currentDate.getDate();
  var month = currentDate.getMonth() + 1; // Note: Months are zero-based
  var year = currentDate.getFullYear();

  // Format the date as desired (e.g., "MM/DD/YYYY")
  var formattedDate = month + '/' + day + '/' + year;

  // Find the HTML element by its ID and set its content to the formatted date
  document.getElementById('date').textContent = formattedDate;

  // Get the Game Board popup and its elements
  const popup = document.getElementById('popup');
  const closeBtn = document.getElementById('closeBtn');
  const skipBtn = document.getElementById('skipBtn');
  const questionElement = document.getElementById('question');
  const myForm = document.getElementById('myForm');
  const textInput = document.getElementById('textInput');

  // Get the Response popup and its elements
  const answerPopup = document.getElementById('answerPopup');
  const answerCloseBtn = document.getElementById('answerCloseBtn');
  const answerPopupPoints = document.getElementById('answerPopupPoints');
  const answerPopupQuestion = document.getElementById('answerPopupQuestion');
  const userResponse = document.getElementById('userResponse');
  const correctResponse = document.getElementById('correctResponse');

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

  // Close button functionality for the second popup
  answerCloseBtn.addEventListener('click', function() {
    answerPopup.style.display = 'none';
  });

  // Skip button functionality
  skipBtn.addEventListener('click', function() {
    if (lastClickedCell) {
      lastClickedCell.style.backgroundColor = '#C2BA71';
    }
    textInput.value = '';
    popup.style.display = 'none';
    saveGameState();
  });

  // Add click event to each game cell
  gameCells.forEach(function(cell) {
    cell.addEventListener('click', function() {
      const question = cell.getAttribute('data-question');
      const points = cell.textContent;

      // Set question text and points
      questionElement.textContent = question;

      popup.style.display = 'block';
      lastClickedCell = cell;
    });
  });

  // Listen for form submission inside popup
  myForm.addEventListener('submit', function(e) {
    e.preventDefault();
    const input = textInput.value.trim();
    const pointsText = lastClickedCell.textContent;
    const points = parseInt(pointsText, 10);
    const correct_answer = lastClickedCell.getAttribute('data-answer');

    if (lastClickedCell) {
      if (input.toLowerCase() === correct_answer.toLowerCase()) {
        lastClickedCell.style.backgroundColor = 'green';
        totalScore += points;
      } else {
        lastClickedCell.style.backgroundColor = 'red';
        totalScore -= points;
      }
      updateDisplayedScore();

      // Populate and show the second popup
      answerPopupPoints.textContent = pointsText;
      answerPopupQuestion.textContent = questionElement.textContent;
      userResponse.textContent = input;
      correctResponse.textContent = correct_answer;
      answerPopup.style.display = 'block';
    }

    textInput.value = '';
    popup.style.display = 'none';
    saveGameState();

  });

  window.onbeforeunload = function() {
    saveGameState();
  };
});
