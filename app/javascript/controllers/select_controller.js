import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="select"
export default class extends Controller {
  static targets = ["input", "password", "date"];
  static values = { showIf: String };
  connect() {
    this.toggle();
  }

  toggle() {
    // if (this.inputTarget.value != this.showIfValue) {
    //   this.passwordTarget.hidden = true;
    // } else if ((this.inputTarget.value = this.showIfValue)) {
    //   this.passwordTarget.hidden = false;
    // }
    this.passwordTarget.hidden = true;
    this.dateTarget.hidden = true;
    if (this.inputTarget.value == "PrivateLink") {
      this.passwordTarget.hidden = false;
    } else if (this.inputTarget.value == "TemporaryLink") {
      this.dateTarget.hidden = false;
    }
  }
}
