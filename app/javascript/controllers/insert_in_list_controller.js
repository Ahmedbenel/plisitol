import { Controller } from "stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ['items', 'form'];

  connect() {
    console.log(this.element);
    console.log(this.itemsTarget);
    console.log(this.formTarget);
  }
  send(event) {
    event.preventDefault();

    console.log('TODO: send request in AJAX');
  }
}
