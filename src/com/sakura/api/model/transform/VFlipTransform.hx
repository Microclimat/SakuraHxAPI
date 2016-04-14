package com.sakura.api.model.transform;
import com.sakura.api.model.TransformType;

/**
* Transformation de flip vertical
* @author d.mouton
* @class VFlipTransform
* @constructor
*/
class VFlipTransform extends Transform  {

    public function new():Void {
        super(TransformType.VFLIP);
    }
}
