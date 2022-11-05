import { LightningElement, api } from 'lwc';
import saResources from '@salesforce/resourceUrl/TI';
export default class saTile extends LightningElement {
	@api sadetail;
	appResources = {
		SASilhouette: `${saResources}/TI.png`,
	};

    handleOpenRecordClick() {
        const selectEvent = new CustomEvent('saview', {
            detail: this.sadetail.Id
        });
        this.dispatchEvent(selectEvent);
    }
}