document.addEventListener('DOMContentLoaded', function() {
  let answeredQuestions = {};
  let totalScore = 0;
  const overrideBtn = document.getElementById('overrideBtn');
  const scoreElement = document.getElementById('scoreValue');

  function loadGameState() {
    const savedState = JSON.parse(localStorage.getItem('gameState')) || {};
    totalScore = parseInt(localStorage.getItem('gameScore')) || 0;
    answeredQuestions = JSON.parse(localStorage.getItem('answeredQuestions')) || {};

// Load saved state
for (const [cellId, color] of Object.entries(savedState)) {
  document.getElementById(cellId).style.backgroundColor = color;
}

    scoreElement.textContent = totalScore;
  }

  loadGameState();


  function saveGameState() {
    let gameState = {};
    gameCells.forEach((cell) => {
      gameState[cell.id] = cell.style.backgroundColor;
    });
    localStorage.setItem('gameState', JSON.stringify(gameState));
    localStorage.setItem('gameScore', totalScore);
    localStorage.setItem('answeredQuestions', JSON.stringify(answeredQuestions));
  }

  function updateDisplayedScore() {
    scoreElement.textContent = totalScore;
  }

  // Get all game cells
  const gameCells = document.querySelectorAll('.game-cell');

  // Get the 'Return to Game Board' button by its ID
const returnToGameBtn = document.getElementById('returnToGameBtn');

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
    answeredQuestions[lastClickedCell.id] = {
      userAnswer: null,
      correctAnswer: lastClickedCell.getAttribute('data-answer'),
      points: lastClickedCell.textContent,
      override: false,
      skipped: true
    };
  }
    textInput.value = '';
    popup.style.display = 'none';
    saveGameState();
  });

  // Attach the event listener to the 'Return to Game Board' button
returnToGameBtn.addEventListener('click', function() {
  // Hide the answerPopup
  answerPopup.style.display = 'none';
});

// Add click event to each game cell
gameCells.forEach(function(cell) {
  cell.addEventListener('click', function() {
    const cellId = cell.id;

    if (answeredQuestions[cellId]) {
      if (answeredQuestions[cellId].skipped) {  // If the question was skipped
        const question = cell.getAttribute('data-question');
        questionElement.textContent = question;
        popup.style.display = 'block';
        lastClickedCell = cell;
      } else {  // If the question was answered (correctly or incorrectly)
        const previousAnswer = answeredQuestions[cellId].userAnswer;
        const correctAnswer = answeredQuestions[cellId].correctAnswer;
        const pointsText = answeredQuestions[cellId].points;

        // Populate and show the second popup
        answerPopupPoints.textContent = pointsText;
        answerPopupQuestion.textContent = cell.getAttribute('data-question');
        userResponse.textContent = previousAnswer;
        correctResponse.textContent = correctAnswer;
        answerPopup.style.display = 'block';
      }
    } else {  // If the question has never been answered or skipped
      const question = cell.getAttribute('data-question');
      questionElement.textContent = question;
      popup.style.display = 'block';
      lastClickedCell = cell;
    }
  });
});


// Save Local Storage as Cookie
document.getElementById('setCookieBtn').addEventListener('click', function() {
  const storedScore = localStorage.getItem('gameScore');
  const questionsAnswered = localStorage.getItem('answeredQuestions');

  document.cookie = `gameScore=${storedScore}; path=/`;
  document.cookie = `answeredQuestions=${questionsAnswered}; path=/`;

  //Redirect to /game_results
  window.location.href = '/game_results';
});

   // Listen for form submission inside popup
   myForm.addEventListener('submit', function(e) {
    e.preventDefault();

    const input = textInput.value.trim();
    const pointsText = lastClickedCell.textContent;
    const points = parseInt(pointsText, 10);
    const correct_answer = lastClickedCell.getAttribute('data-answer');

    // Mark the question as answered
    answeredQuestions[lastClickedCell.id] = {
      userAnswer: input,
      correctAnswer: correct_answer,
      points: pointsText,
      override: false,
      skipped: false  // Not skipped
    };

    if (input.toLowerCase() === correct_answer.toLowerCase()) {
      lastClickedCell.style.backgroundColor = 'green';
      totalScore += points;
    } else {
      lastClickedCell.style.backgroundColor = 'red';
      totalScore -= points;
    }



        // Update the score
        updateDisplayedScore();


// Populate and show the second popup
answerPopupPoints.textContent = pointsText;
answerPopupQuestion.textContent = questionElement.textContent;
userResponse.textContent = input;
correctResponse.textContent = correct_answer;
answerPopup.style.display = 'block';

    // Conditionally display the "I Was Close Enough" button
    const overrideBtn = document.getElementById('overrideBtn');
    console.log('Setting overrideBtn to none. answeredQuestions:', answeredQuestions);

    overrideBtn.style.display = 'none'; // Default to hidden

    if (input.toLowerCase() !== correct_answer.toLowerCase()) {
      // Show the button only if this question has never been overridden
      if (!answeredQuestions[lastClickedCell.id].override) {
        overrideBtn.style.display = 'block';
        overrideBtn.setAttribute('data-cell-id', lastClickedCell.id); // Set current cell ID
      }
    }

    textInput.value = '';
    popup.style.display = 'none';
    saveGameState();
  });

// Event listener for the new 'I was close enough!' button
overrideBtn.addEventListener('click', function() {
  if (lastClickedCell) {
    const cellId = lastClickedCell.id;
    answeredQuestions[cellId].override = true; // Set 'override' field to true
    console.log('Override set to true. answeredQuestions:', answeredQuestions);

    lastClickedCell.style.backgroundColor = 'green';

     // Correct the score by adding back twice the point value of the question
     totalScore += (2 * parseInt(answeredQuestions[cellId].points, 10));
    updateDisplayedScore();
    answerPopup.style.display = 'none';

    // Hide the override button after it has been clicked once for this cell
    overrideBtn.style.display = 'none';

    saveGameState();
  }
});

window.onbeforeunload = function() {
  saveGameState();
};

// Debug Clear Game State
const debugButton = document.getElementById("debug-clear-state");
debugButton.addEventListener("click", function() {
  console.log("Clicked Clear Game State");

  // Clear local storage
  localStorage.clear();

  // Clear game variables
  answeredQuestions = {};
  totalScore = 0;

  // Revert all squares to their original color
  gameCells.forEach((cell) => {
    cell.style.backgroundColor = '';
  });

  // Update displayed score
  updateDisplayedScore();

  // Save cleared state
  saveGameState();

  // Make a GET request to clear server-side state
  fetch("/games/clear_state", {
    method: "GET",
    headers: {
      'Content-Type': 'application/json',
    },
  })
  .then(response => response.json())
  .then(data => {
    console.log("Server-side state cleared:", data);
  })
  .catch(error => {
    console.error('Error:', error);
  });
});
});
