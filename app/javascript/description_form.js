document.addEventListener('DOMContentLoaded', function() {
  const editButton = document.querySelector('.edit-description');
  const editForm = document.querySelector('.edit-description-form');
  const description = document.querySelector('.description')

  console.log(editButton);

  editButton.addEventListener('click', function(event) {
    event.preventDefault();
    console.log(editForm);
    console.log(description);

     editForm.classList.toggle('d-none');
    description.classList.toggle('d-none');

  });
});