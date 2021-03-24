import {Application} from "stimulus"
import {definitionsFromContext} from "stimulus/webpack-helpers"


export default function () {
    const application = Application.start()
    const context = require.context("./controllers", true, /\.js$/)
    application.load(definitionsFromContext(context))
}
