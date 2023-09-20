document.addEventListener('DOMContentLoaded', function() {
  const loginForm = document.getElementById('loginForm');
​
  loginForm.addEventListener('submit', function(e) {
    e.preventDefault();
    
    const userName = document.getElementById('user_name').value;
    const password = document.getElementById('password').value;
​
    // Simulate a login request to the server. Replace this with an actual API call.
    if (userName === 'test' && password === 'password') {
      // For demonstration, setting id as 1. Replace with actual user ID from the server.
      const userId = 1;
​
      localStorage.setItem('user_id', userId);
      localStorage.setItem('user_name', userName);
​
      window.location.href = '/path/to/game_board.html';
    }
  });
});