import {Controller} from "stimulus"

export default class extends Controller {
    static values = {
        open: Boolean
    }

    toggle() {
        this.openValue = !this.openValue
    }
}