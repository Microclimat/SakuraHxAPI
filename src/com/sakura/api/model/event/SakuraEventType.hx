/*
* SakuraEditor
* Visit http://storage.sakuradesigner.microclimat.com/apps/api/ for documentation, updates and examples.
*
* Copyright (c) 2014 microclimat, inc.
* 
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without
* restriction, including without limitation the rights to use,
* copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following
* conditions:
* 
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
*/
package com.sakura.api.model.event;

/**
* Type d'évenement porté par les SakuraEvent
* @author d.mouton
* @class SakuraEventType
* @static
*/

import org.tamina.events.Event;
typedef SakuraEvent = Event<SakuraEventType>;

@:enum abstract SakuraEventType(String) from String to String {


	/**
	 * @property LOADING
	 * @type String
	 * @static
	 * @readOnly
	 * @default "loading"
	 */
    var LOADING = "loading";

	/**
	 * @property ERROR
	 * @type String
	 * @static
	 * @readOnly
	 * @default "error"
	 */
    var ERROR = "error";

	/**
	 * @property PROGRESS
	 * @type String
	 * @static
	 * @readOnly
	 * @default "progress"
	 */
    var PROGRESS = "progress";

	/**
	 * @property PRICE_UPDATE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "priceUpdate"
	 */
    var PRICE_UPDATE = "priceUpdate";

	/**
	 * @property READY
	 * @type String
	 * @static
	 * @readOnly
	 * @default "ready"
	 */
    var READY = "ready";

	/**
	 * @property CUSTOMER_DESIGN_ADDED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "customerDesignAdded"
	 */
    var CUSTOMER_DESIGN_ADDED = "customerDesignAdded";

	/**
	 * @property DESIGN_UPDATED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "designUpdatedHandler"
	 */
    var DESIGN_UPDATED = "designUpdatedHandler";

	/**
	 * @property DISPLAY_UPDATED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "displayUpdatedHandler"
	 */
    var DISPLAY_UPDATED = "displayUpdatedHandler";

	/**
	 * @property BUSY
	 * @type String
	 * @static
	 * @readOnly
	 * @default "busy"
	 */
    var BUSY = "busy";

	/**
	 * @property BUSY_COMPLETE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "busyComplete"
	 */
    var BUSY_COMPLETE = "busyComplete";

	/**
	 * @property AREA_SELECTED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "areaSelected"
	 */
    var AREA_SELECTED = "areaSelected";

	/**
	 * @property AREA_DESELECTED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "areaDeselected"
	 */
    var AREA_DESELECTED = "areaDeselected";

	/**
	 * @property AREA_RESIZED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "areaResized"
	 */
    var AREA_RESIZED = "areaResized";

    /**
	 * @property ELEMENT_SELECTED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "elementSelected"
	 */
    var ELEMENT_SELECTED = "elementSelected";

	/**
	 * @property ELEMENT_MOVE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "elementMoved"
	 */
    var ELEMENT_MOVED = "elementMoved";

	/**
	 * @property ELEMENT_REMOVED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "elementRemoved"
	 */
    var ELEMENT_REMOVED = "elementRemoved";

/**
	 * @property ELEMENT_ADDED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "elementAdded"
	 */
    var ELEMENT_ADDED = "elementAdded";

    /**
	 * @property PICTURE_LOADED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "pictureLoaded"
	 */
    var PICTURE_LOADED = "pictureLoaded";

    /**
	 * @property PICTURE_QUALITY_CHANGED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "pictureQualityChanged"
	 */
    var PICTURE_QUALITY_CHANGED = "pictureQualityChanged";

}
