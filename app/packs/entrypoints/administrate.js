import "cocoon-js-vanilla"
require("@nathanvda/cocoon")

import bindTableLinks from '../javascript/admin/tables'
import bindSelectInputs from '../javascript/admin/select'

document.addEventListener('turbo:load', bindTableLinks)
document.addEventListener('turbo:load', bindSelectInputs)
