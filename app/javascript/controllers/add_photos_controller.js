import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-photos"
export default class extends Controller {
  static targets = ["submit", "add"]
  connect() {
    // console.log("are you in?")
  }

  photos(event) {
    console.log("youre in")
    this.submitTarget.classList.toggle('d-none');
  }


  // hola(event) {
  //   console.log("youre in!")
  // }
}
