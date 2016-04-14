package com.sakura.api.model.design;

/**
* ID des fournisseur d'image supporté par Sakura
* @author d.mouton
* @class ExternalImageProvider
* @static
*/
@:enum abstract ExternalImageProvider(Int) from Int to Int {
/**
	 * @property FOTOLIA
	 * @type Int
	 * @static
	 * @readOnly
	 * @default "1"
	 */
    var FOTOLIA = 1;

/**
	 * @property GETTY
	 * @type Int
	 * @static
	 * @readOnly
	 * @default "2"
	 */
    var GETTY = 2;

/**
	 * @property IMAGESCORP
	 * @type Int
	 * @static
	 * @readOnly
	 * @default "3"
	 */
    var IMAGESCORP = 3;

}
