(function() {
  const modal = document.getElementById("simpleModal");
  const body = document.querySelector("body");
  const modalBtn = document.getElementById("modalBtn");
  const closeBtn = document.getElementsByClassName("closeBtn")[0];
  const headerTitle = document.getElementById("title");

  modalBtn.addEventListener("click", openModal);
  closeBtn.addEventListener("click", closeModal);
  body.addEventListener("click", handleModalClick);

  function openModal() {
    modal.style.display = "block";
    headerTitle.style.visibility = "hidden";
    document.body.backgroundColor = 'black'
  }

  function closeModal() {
    modal.style.display = "none";
    headerTitle.style.visibility = "visible";
  }

  function handleModalClick(e) {
    if (e.target === body) {
      modal.style.display = "none";
      headerTitle.style.visibility = "visible";
    }
  }
})();

filterInput.addEventListener("keyup", filterSearch);

function filterSearch(evt) {
  let filterInput = evt.target.value.toUpperCase();
  let phoneColumnCollection = document.getElementsByClassName(
    "learn-more-list"
  );

  for (let i = 0; i < phoneColumnCollection.length; i++) {
    let phoneColumnUL = phoneColumnCollection[i];
    for (let j = 0; j < phoneColumnUL.children.length; j++) {
      let individualDescription = phoneColumnUL.children[j];
      if (individualDescription.innerText.toUpperCase().includes(filterInput)) {
        individualDescription.style.display = "";
      } else {
        individualDescription.style.display = "none";
      }
    }
  }
}
