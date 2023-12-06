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
      const html = `<input class="form-control string optional" type="text" name="option[]" value="${this.optionsTarget.value}"></input>
      <div class="position-relative">
        <i class="fa-solid fa-xmark position-absolute top-0 end-0 mt-1 me-2" style="cursor: pointer;" data-action="click->option#deleteInput"></i>
      </div>
      `;
      this.optionsListTarget.insertAdjacentHTML('beforeend', html);
      this.optionsTarget.value = "";
    }
  }
}
