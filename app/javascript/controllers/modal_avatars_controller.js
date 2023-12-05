import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal-avatars"
export default class extends Controller {
  static targets = [ "modal" ];

  connect() {
    console.log(this.modalTarget);
  }

  display() {
    console.log("click");
    this.modalTarget.classList.remove('d-none');
  }

  hide() {
    this.modalTarget.classList.add('d-none');
  }
}
