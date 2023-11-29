import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  static targets = ["input", "list"]

  connect() {
    this.inputTarget.addEventListener("input", this.debounce(this.search.bind(this), 300));
  }

  search() {
    fetch(`/users/search.json?query=${this.inputTarget.value}`)
      .then(response => response.json())
      .then(data => this.listTarget.innerHTML = data.map(user => `<li>${user.first_name}</li>`).join(''))
      .catch(error => console.log(error))
  }

  debounce(func, delay) {
    let debounceTimer;
    return function() {
      const context = this;
      const args = arguments;
      clearTimeout(debounceTimer);
      debounceTimer = setTimeout(() => func.apply(context, args), delay);
    }
  }
}
