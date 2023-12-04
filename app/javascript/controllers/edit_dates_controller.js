import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";


// Connects to data-controller="dates-pickr"
export default class extends Controller {
  static targets = ["startDate", "endDate", "dateInput"]
  connect() {
    flatpickr(this.dateInputTarget, {
      mode: "range",
    })
  }

  editDates(event) {
    const dates = this.dateInputTarget.value.split(" to ")
    if (dates.length > 1) {
      this.startDateTarget.value = dates[0]
      this.endDateTarget.value = dates[1]
    }
    else if (dates.length === 1) {
      this.startDateTarget.value = dates[0]
      this.endDateTarget.value = dates[0]
    }
  }

}
