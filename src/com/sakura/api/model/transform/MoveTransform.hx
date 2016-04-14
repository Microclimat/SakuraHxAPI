package com.sakura.api.model.transform;

import com.sakura.api.model.geom.Point;

/**
* Transformation de deplacement
* @author d.mouton
* @class MoveTransform
* @constructor
* @param	destination {Point} le point de destination
*/
class MoveTransform extends Transform {

    /**
	 * @property x
	 * @type Float
	 */
    public var x:Float;

    /**
	 * @property y
	 * @type Float
	 */
    public var y:Float;

    public function new(destination:Point):Void {
        super(TransformType.MOVE);
        this.x = destination.x;
        this.y = destination.y;
    }

}
