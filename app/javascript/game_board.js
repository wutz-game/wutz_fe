// When returning to the index page, the links must work again without manually refreshing the page.


// Function to attach event listeners to game cells
function attachEventListenersToGameCells() {
  const gameCells = document.querySelectorAll(".game-cell");

  gameCells.forEach(function (cell) {
    cell.addEventListener("click", function () {
      const url = cell.getAttribute("data-url");
      localStorage.setItem("clickedUrl", url);
      window.location.href = url;
    });
  });
}

document.addEventListener("DOMContentLoaded", function () {
  // Attach event listeners when the page initially loads
  attachEventListenersToGameCells();

  // Check if a URL was previously clicked and restore the clicked state
  const clickedUrl = localStorage.getItem("clickedUrl");
  if (clickedUrl) {
    const clickedCell = document.querySelector(`[data-url="${clickedUrl}"]`);
    if (clickedCell) {
      clickedCell.classList.add("clicked");
    }
  }
});

document.addEventListener("submit", function (e) {
  if (e.target.id === "myForm") {
    // Remove the clicked class from the cell that was clicked
    const clickedUrl = localStorage.getItem("clickedUrl");
    if (clickedUrl) {
      const clickedCell = document.querySelector(`[data-url="${clickedUrl}"]`);
      if (clickedCell) {
        clickedCell.classList.remove("clicked");
      }
    }

    // Remove the clicked URL from local storage
    localStorage.removeItem("clickedUrl");

    // Re-attach event listeners to game cells
    attachEventListenersToGameCells();
  }
});
