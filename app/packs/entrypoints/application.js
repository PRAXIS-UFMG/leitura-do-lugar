import Rails from "@rails/ujs"
Rails.start()

import { Turbo } from "@hotwired/turbo-rails"
window.Turbo = Turbo

import StimulusApplication from "../javascript/stimulus"
StimulusApplication()

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
const images = require.context('../images', true)
export const imagePath = (name) => images(name, true)