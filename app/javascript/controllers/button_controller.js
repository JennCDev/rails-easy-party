import { Controller } from "stimulus";

export default class extends Controller {
  static targets = ["button"];

  connect() {
    console.log("youre in")
  }
  toggle(event) {
    event.preventDefault();
    this.buttonTarget.classList.toggle("active-events-btn");
    this.buttonTarget.classList.toggle("inactive-events-btn");
  }
}
