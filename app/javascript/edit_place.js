document.addEventListener('DOMContentLoaded', function() {
  const editPlaceButton = document.querySelector('.edit-place-button');
  const editPlaceForm = document.querySelector('.edit-place-form');
  const place = document.querySelector('.place')


  editPlaceButton.addEventListener('click', function(event) {
    event.preventDefault();

    editPlaceForm.classList.toggle('d-none');
    place.classList.toggle('d-none');

  });
});
