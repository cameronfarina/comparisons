// Adding classes: https://developer.mozilla.org/en-US/docs/Web/API/Element/classList
// Get closest: https://developer.mozilla.org/en-US/docs/Web/API/Element/closest

// const learnMoreButtons = document.querySelectorAll('.learn-more-phone-button');

// learnMoreButtons.forEach(learnMoreButton => {
//   learnMoreButton.addEventListener("click", () => _handleLearnMoreClick(learnMoreButton));
// });

// function _handleLearnMoreClick(btn) {
//   const columnContentParent = btn.closest('.column-content');
//   const learnMoreList = document.querySelector('.learn-more-list');

//   if (columnContentParent.classList.contains('in-learn-more')) {
//     columnContentParent.classList.remove('in-learn-more');
//     learnMoreList.classList.remove('clicked');
//   } else {
//     columnContentParent.classList.add('in-learn-more');
//     learnMoreList.classList.add('clicked');
//   }
// };

// const learnMoreButtons = document.querySelectorAll('.learn-more-phone-button');

// learnMoreButtons.forEach(learnMoreButton => {
//   learnMoreButton.addEventListener("click", () => _handleLearnMoreClick(learnMoreButton));
// });

// Get modal element
const modal = document.getElementById('simpleModal');
// Get open modal button
const modalBtn = document.getElementById('modalBtn');
// Get close button 
const closeBtn = document.getElementsByClassName('closeBtn')[0];

// Listen for open click
modalBtn.addEventListener('click', openModal);
// Listen for close click
closeBtn.addEventListener('click', closeModal);
// Listen for outside click
window.addEventListener('click', clickOutside);

// Function to open modal
function openModal() {
  modal.style.display = 'block';
}

//Function to close modal
function closeModal() {
  modal.style.display = 'none';
}

//Function to close modal if outside click
function clickOutside(e) {
  if(e.target === modal){
    modal.style.display = 'none';
  }
}


