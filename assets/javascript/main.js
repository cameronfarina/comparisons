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

  filterInput.addEventListener('keyup', filterNames);
  function filterNames(){
    let filterValue = document.getElementById('filterInput').value.toUpperCase();
    let ul = document.getElementsByClassName('learn-more-list');
    
    for(let i = 0; i < ul.length; i++) {
      let ourUl = ul[i];
      for (let j = 0; j < ourUl.children.length; j++) {
        let result = ourUl.children[j];
        if (result.innerHTML.toUpperCase().indexOf(filterValue) > -1) {
        result.style.display = '';
      } else {
        result.style.display = 'none';
      }
    }
  }
}