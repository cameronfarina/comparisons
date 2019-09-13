(function() {
  const modal = document.getElementById("simpleModal");
  const algoModal = document.getElementById("algoModal");
  const body = document.querySelector("body");
  const modalBtn = document.getElementById("modalBtn");
  const algoBtn = document.getElementById("algoBtn");
  const closeBtn = document.getElementsByClassName("closeBtn")[0];
  const close2Btn = document.getElementsByClassName("close2Btn")[0];
  const headerTitle = document.getElementById("title");

  modalBtn.addEventListener("click", openModal);
  algoBtn.addEventListener("click", openAlgos);
  closeBtn.addEventListener("click", closeModal);
  close2Btn.addEventListener("click", closeModal);
  body.addEventListener("click", handleModalClick);

  function openModal() {
    modal.style.display = "block";
    headerTitle.style.visibility = "hidden";
    document.body.backgroundColor = "black";
  }

  function openAlgos() {
    algoModal.style.display = "block";
    headerTitle.style.visibility = "hidden";
    document.body.backgroundColor = "black";
  }

  function closeModal() {
    modal.style.display = "none";
    algoModal.style.display = "none";
    headerTitle.style.visibility = "visible";
  }

  // function closeModal() {
  //   algoModal.style.display = "none";
  //   headerTitle.style.visibility = "visible";
  // }

  function handleModalClick(e) {
    if (e.target === body) {
      modal.style.display = "none";
      algoModal.style.display = "none";
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

const content = document.querySelector(".sorting-content");
const algorithmButton = document.getElementById("algoBtn");
function generateColumns(num = 16) {
  for (let i = 0; i <= num; i++) {
    const value = Math.floor(Math.random() * 100 + 1);

    const column = document.createElement("div");
    column.classList.add("column");
    column.style.height = `${value * 2}px`;
    column.style.transform = `translateX(${i * 30}px)`;

    const columnLabel = document.createElement("label");
    columnLabel.classList.add("column__id");
    columnLabel.innerHTML = value;

    column.appendChild(columnLabel);
    content.appendChild(column);
  }
}

function swap(el1, el2) {
  return new Promise(resolve => {
    const style1 = window.getComputedStyle(el1);
    const style2 = window.getComputedStyle(el2);

    const transform1 = style1.getPropertyValue("transform");
    const transform2 = style2.getPropertyValue("transform");

    el1.style.transform = transform2;
    el2.style.transform = transform1;

    window.requestAnimationFrame(function() {
      setTimeout(() => {
        content.insertBefore(el2, el1);
        resolve();
      }, 300);
    });
  });
}

async function bubbleSort(delay = 300) {
  let columns = document.querySelectorAll(".column");
  for (let i = 0; i < columns.length - 1; i += 1) {
    for (let j = 0; j < columns.length - i - 1; j += 1) {
      columns[j].style.backgroundColor = "#e82727";
      columns[j + 1].style.backgroundColor = "#e82727";

      await new Promise(resolve =>
        setTimeout(() => {
          resolve();
        }, delay)
      );

      const value1 = Number(columns[j].childNodes[0].innerHTML);
      const value2 = Number(columns[j + 1].childNodes[0].innerHTML);

      if (value1 > value2) {
        await swap(columns[j], columns[j + 1]);
        columns = document.querySelectorAll(".column");
      }

      columns[j].style.backgroundColor = "#2ba4ff";
      columns[j + 1].style.backgroundColor = "#2ba4ff";
    }

    columns[columns.length - i - 1].style.backgroundColor = "#13ce3c";
  }
}

algorithmButton.addEventListener("click", () => {
  generateColumns();
  bubbleSort();
});


window.addEventListener("load", () => {
  const arr = [5, 95, 23, 42, 15, 56, 27, 34, 19, 91, 9, 82, 67, 61, 38];

  shuffleArray(arr);

  const newContent = document.querySelector(".quick-content");

  const dataArray = [];

  arr.forEach((value, i) => {
    let column = document.createElement("div");
    let columnLabel = document.createElement("label");

    column.style.height = `${value * 2}px`;
    column.style.left = `${(i / arr.length) * 100}%`;
    column.classList.add("quick-column");

    columnLabel.classList.add("quick-column__id");
    columnLabel.innerHTML = value;
    newContent.appendChild(column).appendChild(columnLabel);

    dataArray.push({
      value: value,
      container: column
    });
  });

  quickSort(dataArray, 0, dataArray.length - 1);
});

async function quickSort(arr, left, right) {
  var pivot, partitionIndex;

  if (left < right) {
    pivot = right;

    var pivotValue = arr[pivot],
      partitionIndex = left;

    for (var i = left; i < right; i++) {
      await sleep(300);
      if (arr[i].value < pivotValue.value) {
        var temp = arr[i];
        arr[i] = arr[partitionIndex];
        arr[partitionIndex] = temp;
        arr[partitionIndex].container.style.left = `${(partitionIndex /
          arr.length) *
          100}%`;
        arr[partitionIndex].container.style.backgroundColor = "#13ce3c";
        arr[i].container.style.left = `${(i / arr.length) * 100}%`;
        arr[i].container.style.backgroundColor = "#e82727";

        partitionIndex++;
      }
    }

    await sleep(300);
    var temp = arr[right];
    arr[right] = arr[partitionIndex];
    arr[partitionIndex] = temp;
    arr[partitionIndex].container.style.left = `${(partitionIndex /
      arr.length) *
      100}%`;
    arr[right].container.style.left = `${(right / arr.length) * 100}%`;
    arr[right].container.style.backgroundColor = `#2ba4ff`;
    partitionIndex = partitionIndex;

    await quickSort(arr, left, partitionIndex - 1);
    await quickSort(arr, partitionIndex + 1, right);
  }
  return arr;
}

function sleep(ms) {
  return new Promise(resolve => {
    setTimeout(resolve, ms);
  });
}

function shuffleArray(array) {
  for (var i = array.length - 1; i > 0; i--) {
    var j = Math.floor(Math.random() * (i + 1));
    var temp = array[i];
    array[i] = array[j];
    array[j] = temp;
  }
}
