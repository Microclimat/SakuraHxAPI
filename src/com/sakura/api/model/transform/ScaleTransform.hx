package com.sakura.api.model.transform;

class ScaleTransform extends Transform {

    public var scaleX:Float;
    public var scaleY:Float;

    public function new(scaleX:Float,scaleY:Float):Void {
        super(TransformType.SCALE);
        this.scaleX = scaleX;
        this.scaleY = scaleY;
    }

}
