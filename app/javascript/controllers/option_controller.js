import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="option"
export default class extends Controller {
  static targets = ["optionsList", "options"]
  connect() {
    console.log("youre in")
  }
  insertOptions(event) {
    // console.log("youre in")
    event.preventDefault();
    if (this.optionsTarget.value !== "") {
      const html = `<input class="form-control string optional" type="text" name="option[]" value="${this.optionsTarget.value}"></input>`;
      this.optionsListTarget.insertAdjacentHTML('beforeend', html);
      this.optionsTarget.value = "";
    }
  }
}
