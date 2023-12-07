import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="expanded-photos"
export default class extends Controller {
  static targets = ["photo", "gallery", "expandedPhoto"];
  connect() {
    console.log("youre connected")
  }

  expanded(event){
    console.log("youre in")
    this.expandedPhotoTarget.classList.toggle('d-none');
  }
}
