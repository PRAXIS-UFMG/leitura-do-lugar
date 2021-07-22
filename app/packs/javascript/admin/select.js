import Choices from "choices.js";
import "choices.js/public/assets/styles/choices.min.css"

export default function () {
    /** @type {NodeListOf<HTMLSelectElement>} */
    const fields = document.querySelectorAll('.field-unit--belongs-to, .field-unit--has-many')
    for (const field of fields) {
        const select = field.getElementsByTagName('select')[0]
        new Choices(select, {
            loadingText: 'Carregando...',
            noResultsText: 'Sem resultados',
            noChoicesText: 'Sem opções disponíveis',
            itemSelectText: 'Aperte ⏎ para selecionar',
            addItemText: (value) => {
                return `Aperte ⏎ para selecionar <b>"${value}"</b>`;
            },
            maxItemText: (maxItemCount) => {
                return `Somente ${maxItemCount} valores podem ser selecionados`;
            },
        })
    }
}