// Adding classes: https://developer.mozilla.org/en-US/docs/Web/API/Element/classList
// Get closest: https://developer.mozilla.org/en-US/docs/Web/API/Element/closest

const learnMoreButtons = document.querySelectorAll('.learn-more-phone-button');

learnMoreButtons.forEach(function(learnMoreButton) {
  learnMoreButton.addEventListener("click", event => {
    const columnContentParent = learnMoreButton.closest('.column-content');

    if (columnContentParent.classList.contains('in-learn-more')){
      columnContentParent.classList.remove('in-learn-more');
    } else {
      columnContentParent.classList.add('in-learn-more');
    }
  });
});