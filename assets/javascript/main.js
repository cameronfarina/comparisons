(function() {
  const modal = document.getElementById("simpleModal");
  const body = document.querySelector("body");
  const modalBtn = document.getElementById("modalBtn");
  const closeBtn = document.getElementsByClassName("closeBtn")[0];

  modalBtn.addEventListener("click", openModal);
  closeBtn.addEventListener("click", closeModal);
  body.addEventListener("click", handleModalClick);

  function openModal() {
    modal.style.display = "block";
  }

  function closeModal() {
    modal.style.display = "none";
  }

  function handleModalClick(e) {
    if (e.target === body) {
      modal.style.display = "none";
    }
  }
})();


  let filterInput = document.getElementById('filterInput');

  filterInput.addEventListener('keyup', filterSearch);
  function filterSearch(){
    let filteredUserSearch = document.getElementById('filterInput').value.toUpperCase();
    let phoneColumnCollection = document.getElementsByClassName('learn-more-list');
    
    for(let i = 0; i < phoneColumnCollection.length; i++) {
      let phoneColumnUL = phoneColumnCollection[i];
      for (let j = 0; j < phoneColumnUL.children.length; j++) {
        let individualDescription = phoneColumnUL.children[j];
        if (individualDescription.innerHTML.toUpperCase().indexOf(filteredUserSearch) > -1) {
        individualDescription.style.display = '';
      } else {
        individualDescription.style.display = 'none';
      }
    }
  }
}