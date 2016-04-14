package com.sakura.api.model.transform;
import com.sakura.api.model.TransformType;

/**
* Transformation de flip horizontal
* @author d.mouton
* @class HFlipTransform
* @constructor
*/
class HFlipTransform extends Transform  {

    public function new():Void {
        super(TransformType.HFLIP);
    }
}
