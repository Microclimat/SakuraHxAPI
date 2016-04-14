package com.sakura.api.model.transform;

/**
* Transformation de rotation : pivote l'objet de l'angle indiqué en radian
* @author d.mouton
* @class RotateByTransform
* @constructor
* @param	angle {Float} l'angle de la rotation
*/
class RotateByTransform extends Transform{

    /**
	 * @property angle
	 * @type Float
	 */
    public var angle:Float;

    public function new(angle:Float):Void {
        super(TransformType.ROTATE_BY);
        this.angle = angle ;
    }
}
