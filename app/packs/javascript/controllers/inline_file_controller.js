import {Controller} from "stimulus"

export default class extends Controller {
    static targets = ["input", "label"]

    connect() {
        this.input = this.inputTarget
        this.label = this.labelTarget
        this.form = this.element
        this.input.addEventListener("change", this.setLabel)
        this.setLabel()
    }

    disconnect() {
        this.input.removeEventListener("change", this.setLabel)
    }

    setLabel = () => {
        if (this.input.files.length === 0)
            this.label.innerHTML = "Selecionar Arquivo"
        else
            this.label.innerHTML = this.input.files.item(0).name
    }

    submit = (event) => {
        event.preventDefault();
        this.form.requestSubmit();
        this.form.reset()
        this.setLabel()
    }
}