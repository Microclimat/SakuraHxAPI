package com.sakura.api.model.transform;

/**
* Transformation d'etirement
* @author d.mouton
* @class ScaleByTransform
* @constructor
* @param	scaleX{Float} l'etirement horizontal
* @param	scaleY{Float} l'etirement vertical
*/
class ScaleByTransform extends Transform {

/**
	 * l'etirement horizontal
	 * @property scaleX
	 * @type Float
	 */
    public var scaleX:Float;
/**
	 * l'etirement vertical
	 * @property scaleY
	 * @type Float
	 */
    public var scaleY:Float;

    public function new(scaleX:Float,scaleY:Float):Void {
        super(TransformType.SCALE_BY);
        this.scaleX = scaleX;
        this.scaleY = scaleY;
    }

}
