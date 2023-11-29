import { Controller } from "@hotwired/stimulus"
import { Autocomplete } from "stimulus-autocomplete";
// Connects to data-controller="button"
export default class extends Controller {
  static targets = ["passedButton", "attendedButton"];

  connect() {
    console.log("youre in")
  }
  toggle(event) {
    event.preventDefault();
    console.log("youre in")
    const buttonTarget = event.target.closest("[data-target='button.passedButton'], [data-target='button.attendedButton']");
    if (buttonTarget) {
      buttonTarget.classList.toggle("active-events-btn");
      buttonTarget.classList.toggle("inactive-events-btn");
    }
  }
}

