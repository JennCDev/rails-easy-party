document.addEventListener('DOMContentLoaded', function() {

  const editDate = document.querySelector('.edit-date');
  const editDateForm = document.querySelector('.edit-date-form');
  const dateContainer = document.querySelector('.date-container')

  console.log(editDate);

  editDate.addEventListener('click', function(event) {
    event.preventDefault();
    console.log('hrllo');
    console.log(editDate);

    editDateForm.classList.toggle('d-none');
    dateContainer.classList.toggle('d-none');

  });
});
