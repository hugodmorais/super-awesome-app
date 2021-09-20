import { Controller } from "stimulus"

export default class extends Controller {  
  connect() {
    console.log("tetete")
  }

  hide() {
    console.log("remove")
    this.element.remove();
  }
}