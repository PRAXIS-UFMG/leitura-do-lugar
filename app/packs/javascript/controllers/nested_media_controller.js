import { Controller } from "stimulus"
import { post } from '@rails/request.js'

export default class extends Controller {
    static targets = ["name", "file", "label", "add", "remove", "id", "error", "notice"]

    connect() {
        this.name = this.nameTarget
        this.file = this.fileTarget
        this.label = this.labelTarget
        this.addButton = this.addTarget
        this.removeButton = this.removeTarget
        this.recordId = this.idTarget
        this.errorFlash = this.errorTarget
        this.noticeFlash = this.noticeTarget
        this.parent = this.element.parentElement
        this.setButtons()
        this.setLabel()
        this.file.addEventListener("change", this.setLabel)
    }

    disconnect() {
        this.file.removeEventListener("change", this.setLabel)
    }

    setLabel = () => {
        if (this.file.files.length === 0)
            this.resetLabel()
        else
            this.label.innerHTML = this.file.files.item(0).name
    }

    resetLabel = () => this.label.innerHTML = "Selecionar Arquivo"

    reset = (event) => {
        this.name.value = ""
        this.file.value = null
        this.resetLabel()
    }

    submit = async (event) => {
        console.debug("porra pqp")
        event.preventDefault();
        const form = new FormData();
        form.append("media[name]", this.name.value)
        form.append("media[file]", this.file.files.item(0))
        const response = await post('/admin/medias/validate_inline', { body: form })
        if (response.ok) {
            this.addNewForm(new Event("create"))
            this.noticeFlash.innerHTML = response.text
        } else
            this.errorFlash.innerHTML = response.text
    }


    addNewForm = (event) => {
        event.preventDefault()
        this.parent.prepend(this.element.cloneNode(true))
        this.reset()
    }

    addNewButton = () => {
        const button = document.createElement("button")
        button.innerHTML = "Adicionar mídia +"
        button.onclick = this.addNewForm

        this.parent.append(button)
    }

    setButtons = () => {
        if (this.recordId > 0) {
            this.removeButton.classList.remove("hidden")
        }
        if (this.parent.querySelector(":last-child") === this.element) {
            this.addButton.classList.remove("hidden")
        }
    }
}