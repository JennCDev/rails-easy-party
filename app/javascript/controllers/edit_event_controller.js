import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="edit-event"
export default class extends Controller {
  static targets = ["editForm", "editField"];

  connect() {
    // console.log("Hello");
  }

  editField(event) {
    event.preventDefault();
    console.log("Hello");
      this.editFormTarget.classList.toggle('d-none');
    this.editFieldTarget.classList.toggle('d-none');
  }
}
