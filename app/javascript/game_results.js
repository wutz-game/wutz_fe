document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('setCookieBtn').addEventListener('click', function() {
        const storedScore = localStorage.getItem('gameScore');
        const questionsAnswered = localStorage.getItem('answeredQuestions');

        document.cookie = `gameScore=${storedScore}; path=/`;
        document.cookie = `answeredQuestions=${questionsAnswered}; path=/`;
    });

    // Access data from local storage
    const storedScore = localStorage.getItem('gameScore');
    const questionsAnswered = localStorage.getItem('answeredQuestions');


    // Update HTML element with stored data
    document.getElementById('displayedScore').textContent = `Your total score is ${storedScore}`;
    document.getElementById('questionsAnswered').textContent = `You answered ${questionsAnswered} questions`;
});
