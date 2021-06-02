import {Controller} from "stimulus"
import shareThis from "share-this";
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

    render = (text, rawText, shareUrl) => {
        this.selected = text
        this.report = this.reportValue
        return this.template.innerHTML
    }

    action = (event, item) => {
        event.preventDefault()
        window.location.href = `${window.location.origin}/admin/excerpts/new/${this.report}?text=${encodeURIComponent(this.selected)}`
    }
}