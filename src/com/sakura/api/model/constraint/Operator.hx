package com.sakura.api.model.constraint;


/**
* Operateur de contrainte
* @author d.mouton
* @class Operator
* @static
*/
@:enum abstract Operator(String) from String to String   {

/**
	 * Parmis
	 * @property INCLUDE
	 * @type String
	 * @static
	 * @default 'in'
	 */
    var INCLUDE = 'in';

/**
	 * Bonne qualité
	 * @property GOOD
	 * @type Int
	 * @static
	 * @default 0
	 */
    var EQUAL = '=';

/**
	 * Moins de
	 * @property LESS
	 * @type String
	 * @static
	 * @default '<'
	 */
    var LESS = '<';

/**
	 * Plus de
	 * @property MORE
	 * @type String
	 * @static
	 * @default '>'
	 */
    var MORE = '>';

/**
	 * Different de
	 * @property DIFFERENT
	 * @type String
	 * @static
	 * @default '<>'
	 */
    var DIFFERENT = '<>';


    var DEFAULT = '';

}