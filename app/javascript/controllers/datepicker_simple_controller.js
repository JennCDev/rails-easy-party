import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker-simple"
export default class extends Controller {
  connect() {
    // console.log("Hello");
    flatpickr(this.element);
  }
}
