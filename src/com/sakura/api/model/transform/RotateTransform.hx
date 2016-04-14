package com.sakura.api.model.transform;

/**
* Transformation de rotation : pivote l'objet jusqu'a l'angle indiqué en radian
* @author d.mouton
* @class RotateTransform
* @constructor
* @param	angle {Float} l'angle de destination de la rotation
*/
class RotateTransform extends Transform{
/**
	 * @property angle
	 * @type Float
	 */
    public var angle:Float;

    public function new(angle:Float):Void {
        super(TransformType.ROTATE);
        this.angle = angle;
    }
}
