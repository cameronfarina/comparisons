// const buttonHighlight = document.getElementById("learn-more-button");
// const parentHighlight = document.getElementById("highlight-parent");

// buttonHighlight.addEventListener("click", function() { parentHighlight.style.background = "black" });


  const buttonHighlight = document.getElementById("learn-more");
  const parentHighlight = document.getElementById("highlight-parent");
  const answer = buttonHighlight.addEventListener("click", event => {
    parentHighlight.style.border = '3px solid yellow';
  });


// buttonHighlight.removeEventListener("click", answer, false);
