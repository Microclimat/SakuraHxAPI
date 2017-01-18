package com.sakura.api.model.design;

/**
* Image filter type
* @author d.mouton
* @class PictureFilter
* @static
*/
@:enum abstract PictureFilter(String) from String to String   {

    /**
	 * @property BLACK_AND_WHITE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "blackAndWhite"
	 */
    var BLACK_AND_WHITE = 'blackAndWhite';

    /**
	 * @property NONE
	 * @type String
	 * @static
	 * @readOnly
	 * @default ""
	 */
    var NONE = '';

    /**
	 * @property BLUR
	 * @type String
	 * @static
	 * @readOnly
	 * @default "blur"
	 */
    var BLUR = 'blur';

    /**
	 * @property NEGATIVE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "negative"
	 */
    var NEGATIVE = 'negative';

    /**
	 * @property SEPIA
	 * @type String
	 * @static
	 * @readOnly
	 * @default "sepia"
	 */
    var SEPIA = 'sepia';

    /**
	 * @property PIXELATE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "pixelate"
	 */
    var PIXELATE = 'pixelate';

    /**
	 * @property RED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "red"
	 */
    var RED = 'red';

    /**
	 * @property FOTOLIA
	 * @type String
	 * @static
	 * @readOnly
	 * @default "1"
	 */
    var GREEN = 'green';

    /**
	 * @property BLUE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "blue"
	 */
    var BLUE = 'blue';

    /**
	 * @property BRIGHTNESS
	 * @type String
	 * @static
	 * @readOnly
	 * @default "brightness"
	 */
    var BRIGHTNESS = 'brightness';

    /**
	 * @property CONTRAST
	 * @type String
	 * @static
	 * @readOnly
	 * @default "contrast"
	 */
    var CONTRAST = 'contrast';

}
