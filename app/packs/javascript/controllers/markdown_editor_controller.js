import {Controller} from "stimulus"
import EasyMDE from "easymde";
import 'easymde/dist/easymde.min.css'
import marked from "marked";

export default class extends Controller {
    static targets = ['mdField', 'editorField']
    static values = {model: String}

    connect() {
        const textarea = this.editorFieldTarget
        this.mde = new EasyMDE({
            element: textarea,
            spellChecker: false,
            status: ['cursor'],
            showIcons: ['upload-image'],
            hideIcons: ['code', 'table', 'side-by-side', 'fullscreen', 'image'],
            maxHeight: "40vh",
            blockStyles: {
                italic: '_'
            },
            uploadImage: true,
            imageUploadFunction: this.uploadImage,
            imagePathAbsolute: false
        })
        this.form = textarea.form
        this.form.addEventListener('submit', this.beforeSubmit)
    }

    disconnect() {
        this.form.removeEventListener('submit', this.beforeSubmit)
    }

    beforeSubmit = (ev) => {
        this.mdFieldTarget.value = marked(this.mde.value())
    }

    uploadImage = async (file, success, failure) => {
        const form = new FormData()
        let formName = (this.form.elements[`${this.modelValue}[name]`]?.value || this.modelValue).split(' ').join('_')
        const fileName = file.name.split('.').slice(0, -1).join()
        form.append('media[name]', `inline-${formName}-${fileName}-${file.lastModified}`)
        form.append('media[file]', file)
        form.append('media[inline]', '1')

        const csrfToken = document.querySelector('meta[name="csrf-token"]').content
        const response = await fetch('/admin/medias', {
            method: 'POST',
            headers: {
                'X-CSRF-Token': csrfToken
            },
            body: form
        })

        if (!response.ok) {
            return failure(response.headers.get('reason'))
        }
        const imageElement = document.createElement('input')
        success(response.headers.get('location'))
    }
}