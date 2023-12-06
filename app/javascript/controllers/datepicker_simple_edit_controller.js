import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker-simple"
export default class extends Controller {
  connect() {
    console.log("Hello flatpickr");
    flatpickr(this.element, {
      dateFormat: "d/m/Y"
  })

  console.log(this.element);
}

}
