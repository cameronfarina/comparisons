// const buttonHighlight = document.getElementById("learn-more-button");
// const parentHighlight = document.getElementById("highlight-parent");

// buttonHighlight.addEventListener("click", function() { parentHighlight.style.background = "black" });

window.onload = function () {
  const buttonHighlight = document.getElementById("learn-more");
  const parentHighlight = document.getElementById("highlight-parent");
  const answer = buttonHighlight.addEventListener("click", event => {
    parentHighlight.style.border = '3px solid yellow';
  });

}
buttonHighlight.removeEventListener("click", answer, false);


// $(document).ready(function () {
//   $(".learn-more-button").on("click", function () {
//     // Only change code below this line.
//     $(".learn-more-button").html("Here is the message");
//     // Only change code above this line.
//   });
// });