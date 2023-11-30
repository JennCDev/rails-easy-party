import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-answers"
export default class extends Controller {

  static targets = ["answers", "input", "answer"]

  connect() {
  }

  insertAnswers(event) {
    event.preventDefault();
    if (this.inputTarget.value !== "") {
      const html = `<div data-insert-in-answers-target="answer">
      <input class="form-control string optional" type="text" name="survey[answer][]" value="${this.inputTarget.value}" >
      <i class="fa-solid fa-xmark" data-action="click->insert-in-answers#deleteInput"></i>
      </input>
      </div>`;
      this.answersTarget.insertAdjacentHTML('beforeend', html);
      this.inputTarget.value = "";
    }
  }

  deleteInput() {
    this.answerTarget.remove();
  }
}
