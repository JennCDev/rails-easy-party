import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="slider"
export default class extends Controller {
  static targets = ["expandedPhoto"];

  connect() {
    console.log(this.expandedPhotoTargets)
  }

  previous(){
    this.expandedPhotoTargets.forEach((photo) => {

      if (!photo.classList.contains("d-none")) {

        photo.classList.add("d-none")
        const index = this.expandedPhotoTargets.indexOf(photo)
        this.expandedPhotoTargets[index - 1].classList.remove("d-none")
      }
    })

  }


  next(){
    let index = "";
    this.expandedPhotoTargets.forEach((photo) => {

      if (!photo.classList.contains("d-none")) {
        console.log(photo)
        photo.classList.add("d-none")

        index = this.expandedPhotoTargets.indexOf(photo)
      }

    })
    this.expandedPhotoTargets[index + 1].classList.remove("d-none")
  }
}
