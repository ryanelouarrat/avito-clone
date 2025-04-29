import { Controller } from "@hotwired/stimulus"

export default class DropdownController extends Controller {
  static targets = ["menu"]

  toggle() {
    this.menuTarget.classList.toggle("show")
  }

  hideOnClickOutside(event) {
    if (!this.element.contains(event.target)) {
      this.menuTarget.classList.remove("show")
    }
  }

  connect() {
    this.hideHandler = this.hideOnClickOutside.bind(this)
    document.addEventListener("click", this.hideHandler)
  }

  disconnect() {
    document.removeEventListener("click", this.hideHandler)
  }
}
