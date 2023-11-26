import { Controller } from "@hotwired/stimulus"
import TomSelect from 'tom-select'

// Connects to data-controller="ts--select-single"
export default class extends Controller {
    connect() {
        new TomSelect(this.element,{
            allowEmptyOption: true,
        });
    }
}
