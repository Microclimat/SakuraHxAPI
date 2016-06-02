package com.sakura.api.model.transform;

/**
* Types de transformations
* @author d.mouton
* @class TransformType
*/
@:enum abstract TransformType(String) from String to String {
/**
	 * @property DELETE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "delete"
	 */
    var DELETE = 'delete';

/**
	 * @property ROTATE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "rotate"
	 */
    var ROTATE = 'rotate';

/**
	 * @property ROTATE_BY
	 * @type String
	 * @static
	 * @readOnly
	 * @default "rotateBy"
	 */
    var ROTATE_BY = 'rotateBy';

/**
	 * @property SCALE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "scale"
	 */
    var SCALE = 'scale';

/**
	 * @property SCALE_X
	 * @type String
	 * @static
	 * @readOnly
	 * @default "scaleX"
	 */
    var SCALE_X = 'scaleX';

/**
	 * @property SCALE_Y
	 * @type String
	 * @static
	 * @readOnly
	 * @default "scaleY"
	 */
    var SCALE_Y = 'scaleY';

/**
	 * @property SCALE_BY
	 * @type String
	 * @static
	 * @readOnly
	 * @default "scaleBy"
	 */
    var SCALE_BY = 'scaleBy';

/**
	 * @property START
	 * @type String
	 * @static
	 * @readOnly
	 * @default "start"
	 */
    var START = 'start';

/**
	 * @property STOP
	 * @type String
	 * @static
	 * @readOnly
	 * @default "stop"
	 */
    var STOP = 'stop';

/**
	 * @property MOVE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "move"
	 */
    var MOVE = 'move';

/**
	 * @property MOVE_TO_AREA
	 * @type String
	 * @static
	 * @readOnly
	 * @default "moveToArea"
	 */
    var MOVE_TO_AREA = 'moveToArea';

/**
	 * @property HFLIP
	 * @type String
	 * @static
	 * @readOnly
	 * @default "hFlip"
	 */
    var HFLIP = 'hFlip';

/**
	 * @property VFLIP
	 * @type String
	 * @static
	 * @readOnly
	 * @default "vFlip"
	 */
    var VFLIP = 'vFlip';
}