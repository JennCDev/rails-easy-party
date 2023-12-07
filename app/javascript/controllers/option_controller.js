import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="option"
export default class extends Controller {
  static targets = ["optionsList", "options"]
  connect() {
    console.log("youre connected")
  }
  insertOptions(event) {
    console.log("youre in")
    event.preventDefault();
    if (this.optionsTarget.value !== "") {
      const html = `<div style="margin-bottom: 20px;">
      <div class="position-relative">
        <input class="form-control input string optional pr-4" type="text" name="option[]" value="${this.optionsTarget.value}" readonly>
        <i class="fa-solid fa-xmark fa-xmark position-absolute top-0 end-0 mt-1 me-2" style="cursor: pointer;" data-action="click->option#deleteInput"></i>
      </div>
      </div>`;
      this.optionsListTarget.insertAdjacentHTML('beforeend', html);
      this.optionsTarget.value = "";
    }
  }
}
