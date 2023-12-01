import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="item"
export default class extends Controller {
  static targets = ["option"]
  connect() {

  }

  markAsDone(event){
    console.log(this.optionTarget)

    // this.optionTarget.classList.toggle("done");
    // avatar = user_item.user.avatar
    // this.optionTarget.insertAdjacentHTML('beforeend', `<img src="${avatar}" alt="">`);

  }
}
