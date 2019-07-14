// Adding classes: https://developer.mozilla.org/en-US/docs/Web/API/Element/classList
// Get closest: https://developer.mozilla.org/en-US/docs/Web/API/Element/closest

const learnMoreButtons = document.querySelectorAll('.learn-more-phone-button');

learnMoreButtons.forEach(learnMoreButton => {
  learnMoreButton.addEventListener("click", () => _handleLearnMoreClick(learnMoreButton));
});

function _handleLearnMoreClick(btn) {
  const columnContentParent = btn.closest('.column-content');
  const learnMoreList = document.querySelector('.learn-more-list');

  if (columnContentParent.classList.contains('in-learn-more')) {
    columnContentParent.classList.remove('in-learn-more');
    learnMoreList.classList.remove('clicked');
  } else {
    columnContentParent.classList.add('in-learn-more');
    learnMoreList.classList.add('clicked');
  }
};

