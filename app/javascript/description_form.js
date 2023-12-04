document.addEventListener('DOMContentLoaded', function() {
  const editButton = document.querySelector('.edit-description');
  const editForm = document.querySelector('.edit-description-form');
  const description = document.querySelector('.description')


  editButton.addEventListener('click', function(event) {
    event.preventDefault();

    editForm.classList.toggle('d-none');
    description.classList.toggle('d-none');

  });
});
