import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="button"
export default class extends Controller {
  static targets = ["buttonNext", "buttonPrevious", "next", "previous"];

  connect() {
  }

  next() {
    this.buttonNextTarget.classList.remove("inactive-events-btn");
    this.buttonNextTarget.classList.add("active-events-btn");
    this.buttonPreviousTarget.classList.remove("active-events-btn");
    this.buttonPreviousTarget.classList.add("inactive-events-btn");
    this.nextTarget.classList.remove("d-none");
    this.previousTarget.classList.add("d-none");
  }

  previous() {
    this.buttonNextTarget.classList.remove("active-events-btn");
    this.buttonNextTarget.classList.add("inactive-events-btn");
    this.buttonPreviousTarget.classList.remove("inactive-events-btn");
    this.buttonPreviousTarget.classList.add("active-events-btn");
    this.previousTarget.classList.remove("d-none");
    this.nextTarget.classList.add("d-none");
  }
}
