package com.sakura.api.model.design;

/**
* Les qualités d'une Picture
* @author d.mouton
* @class PictureQuality
* @static
*/
@:enum abstract PictureQuality(Int) from Int to Int  {

/**
	 * Bonne qualité
	 * @property GOOD
	 * @type Int
	 * @static
	 * @default 0
	 */
    var GOOD = 0;

/**
	 * Qualité médiocre
	 * @property POOR
	 * @type Int
	 * @static
	 * @default 1
	 */
    var POOR = 1;

/**
	 * Mauvaise qualité
	 * @property BAD
	 * @type Int
	 * @static
	 * @default 2
	 */
    var BAD = 2;
}
