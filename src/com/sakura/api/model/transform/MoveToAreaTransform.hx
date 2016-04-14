package com.sakura.api.model.transform;

/**
* Transformation de changement de zone
* @author d.mouton
* @class MoveToAreaTransform
* @constructor
*/
import com.sakura.data.design.Area;
class MoveToAreaTransform extends Transform {

    /**
	 * L'id de la zone de destination
	 * @property targetAreaId
	 * @type Float
	 */
    public var targetAreaId:Float;

    public var targetArea:Area;

    public function new():Void {
        super(TransformType.MOVE_TO_AREA);
    }
}
