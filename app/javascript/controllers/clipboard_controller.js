import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  static targets = ["notification"]

  static values = {
    url: String
  }

  connect() {
  }

  copy() {
    const textToCopy = `http://127.0.0.1:3000${this.urlValue}`; //A modifier en prod

    navigator.clipboard.writeText(textToCopy)
      .then(() => {
        console.log("Text successfully copied to clipboard:", textToCopy);
        this.notificationTarget.classList.remove("d-none");
      })
  }

  hideAlert() {
    this.notificationTarget.classList.add("d-none");
  }

}
