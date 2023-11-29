import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-answers"
export default class extends Controller {

  static targets = [ "answers", "input" ]

  connect() {
  }

  insertAnswers(event) {
    event.preventDefault();
    if (this.inputTarget.value !== "") {
      const html = `<input class="form-control string optional" type="text" name="survey[answer][]" value="${this.inputTarget.value}"></input>`;
      this.answersTarget.insertAdjacentHTML('beforeend', html);
      this.inputTarget.value = "";
    }
  }
}
