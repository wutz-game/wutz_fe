document.addEventListener("DOMContentLoaded", function () {
    const gameCells = document.querySelectorAll(".game-cell");

    gameCells.forEach(function (cell) {
      cell.addEventListener("click", function () {
        const url = cell.getAttribute("data-url");
        window.location.href = url;
      });
    });
  });
