import { Controller } from "stimulus"
import EasyMDE from "easymde";
import 'easymde/dist/easymde.min.css'
import { Converter } from "showdown";

export default class extends Controller {
    static targets = ['mdField', 'editorField']

    connect() {
        const textarea = this.editorFieldTarget
        this.form = textarea.form
        this.mde = new EasyMDE({
            autoDownloadFontAwesome: true,
            element: textarea,
            spellChecker: false,
            status: ['cursor'],
            maxHeight: "20rem",
            blockStyles: {
                italic: '*'
            },
            previewRender: this.render
        })
        this.form.addEventListener('submit', this.beforeSubmit)
    }

    disconnect() {
        this.form.removeEventListener('submit', this.beforeSubmit)
    }

    beforeSubmit = (ev) => {
        this.mdFieldTarget.value = this.render(this.mde.value())
        return true
    }

    render = (markdown) => {
        const converter = new Converter()
        return converter.makeHtml(markdown);
    }
}
