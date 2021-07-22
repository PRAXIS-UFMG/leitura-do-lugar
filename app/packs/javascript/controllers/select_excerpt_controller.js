import {Controller} from "stimulus"
import shareThis from "share-this"
import {Converter} from "showdown"

import "share-this/dist/share-this.css"

export default class extends Controller {
    static values = {report: Number}

    connect() {
        this.shareThis = shareThis({
            element: this.element,
            selector: 'article[data-controller="select-excerpt"]',
            sharers: [{
                name: "excerpt",
                render: this.render,
                action: this.action
            }]
        });
        this.template = document.getElementById("excerpt-template")
        this.shareThis.init();
    }

    getSelectionHtml() {
        if (typeof window.getSelection != "undefined") {
            const sel = window.getSelection()
            if (sel.rangeCount) {
                const container = document.createElement("div"), len = sel.rangeCount
                for (let i = 0; i < len; ++i)
                    container.appendChild(sel.getRangeAt(i).cloneContents())
                return container.innerHTML
            }
        } else if (typeof document.selection != "undefined") {
            if (document.selection.type === "Text")
                return document.selection.createRange().htmlText
        }
    }

    render = (text, rawText, shareUrl) => {
        this.report = this.reportValue
        return this.template.innerHTML
    }

    htmlToMarkdown(html) {
        const converter = new Converter()
        return converter.makeMarkdown(this.getSelectionHtml())
    }

    action = (event, item) => {
        event.preventDefault()
        const markdown = this.htmlToMarkdown(this.getSelectionHtml())
        window.location.href = `${window.location.origin}/admin/excerpts/new/${this.report}?text=${encodeURIComponent(markdown)}`
    }
}