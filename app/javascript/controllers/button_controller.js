import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["buttonTarget"];

  connect() {
    console.log("youre in")
  }
  toggleStyle(event) {
    event.preventDefault();
    this.buttonTarget.classList.toggle("active-events-btn");
    this.buttonTarget.classList.toggle("inactive-events-btn");
  }
}
