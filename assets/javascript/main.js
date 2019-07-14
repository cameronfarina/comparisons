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
}());
