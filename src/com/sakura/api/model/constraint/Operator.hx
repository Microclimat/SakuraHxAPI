package com.sakura.api.model.constraint;


/**
* Constraint operator
* @author d.mouton
* @class Operator
* @static
*/
@:enum abstract Operator(String) from String to String   {

    /**
	 * @property INCLUDE
	 * @type String
	 * @static
	 * @default 'in'
	 */
    var INCLUDE = 'in';

    /**
	 * @property EQUAL
	 * @type String
	 * @static
	 * @default '='
	 */
    var EQUAL = '=';

    /**
	 * @property LESS
	 * @type String
	 * @static
	 * @default '<'
	 */
    var LESS = '<';

    /**
	 * @property MORE
	 * @type String
	 * @static
	 * @default '>'
	 */
    var MORE = '>';

    /**
	 * @property DIFFERENT
	 * @type String
	 * @static
	 * @default '<>'
	 */
    var DIFFERENT = '<>';

    /**
     * @property DEFAULT
     * @type
     * @default ''
     **/
    var DEFAULT = '';

}