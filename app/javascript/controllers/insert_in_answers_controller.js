import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = ["answers", "input", "answer"]

  connect() {
  }

  insertAnswers(event) {
    event.preventDefault();
    if (this.inputTarget.value !== "") {
      const html = `<div data-insert-in-answers-target="answer" style="margin-bottom: 20px; ">
      <div class="position-relative">
        <input class="form-control string optional pr-4" type="text" name="survey[answer][]" value="${this.inputTarget.value}" readonly>
        <i class="fa-solid fa-xmark fa-xmark-survey position-absolute top-0 end-0 mt-1 me-2" style="cursor: pointer;" data-action="click->insert-in-answers#deleteInput"></i>
      </div>
    </div>`;


      this.answersTarget.insertAdjacentHTML('beforeend', html);
      this.inputTarget.value = "";
    }
  }

  deleteInput(event) {
    event.target.closest('[data-insert-in-answers-target="answer"]').remove();
  }
}
