import Choices from "choices.js";
import "choices.js/public/assets/styles/choices.min.css"

export default function () {
    /** @type {NodeListOf<HTMLSelectElement>} */
    const fields = document.querySelectorAll('.field-unit--belongs-to')
    for (const field of fields) {
        const select = field.getElementsByTagName('select')[0]
        new Choices(select)
    }
}