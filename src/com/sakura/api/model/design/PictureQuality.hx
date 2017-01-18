package com.sakura.api.model.design;

/**
* Picture's quality
* @author d.mouton
* @class PictureQuality
* @static
*/
@:enum abstract PictureQuality(Int) from Int to Int  {

    /**
	 * Good quality
	 * @property GOOD
	 * @type Int
	 * @static
	 * @default 0
	 */
    var GOOD = 0;

    /**
	 * Poor quality
	 * @property POOR
	 * @type Int
	 * @static
	 * @default 1
	 */
    var POOR = 1;

    /**
	 * Bad quality
	 * @property BAD
	 * @type Int
	 * @static
	 * @default 2
	 */
    var BAD = 2;
}
