import {Controller} from "stimulus"
import EasyMDE from "easymde";
import 'easymde/dist/easymde.min.css'
import marked from "marked";

export default class extends Controller {
    static targets = ['mdField', 'editorField']

    connect() {
        const textarea = this.editorFieldTarget
        this.mde = new EasyMDE({
            element: textarea,
            spellChecker: false,
            status: ['cursor'],
            hideIcons: ['code', 'image', 'table', 'side-by-side', 'fullscreen'],
            maxHeight: "40vh",
            blockStyles: {
                italic: '_'
            }
        });
        this.form = textarea.form
        this.form.addEventListener('submit', this.beforeSubmit)
    }

    disconnect() {
        this.form.removeEventListener('submit', this.beforeSubmit)
    }

    beforeSubmit = (ev) => {
        this.mdFieldTarget.value = marked(this.mde.value())
    }
}