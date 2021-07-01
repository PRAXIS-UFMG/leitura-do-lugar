import {Controller} from "stimulus"
import {post} from '@rails/request.js'

export default class extends Controller {
    static targets = ["owner", "name", "file", "label"]

    connect() {
        this.owner = this.ownerTarget
        this.name = this.nameTarget
        this.file = this.fileTarget
        this.label = this.labelTarget
        this.file.addEventListener("change", this.setLabel)
        this.setLabel()
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

    submit = (event) => {
        console.debug("porra pqp")
        event.preventDefault();
        const form = new FormData();
        form.append("media[owner_type]", this.owner.value)
        form.append("media[name]", this.name.value)
        form.append("media[file]", this.file.files.item(0))
        post('/admin/medias', {headers: {Accept: "text/vnd.turbo-stream.html"}, body: form})
    }
}