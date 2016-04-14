package com.sakura.api.model.transform;

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
