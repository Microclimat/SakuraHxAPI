package com.sakura.api.model.transform;

/**
* Transformation de Suppression
* @author d.mouton
* @class DeleteTransform
* @constructor
*/
class DeleteTransform  extends Transform{



    public function new(silentNotification:Bool=false):Void {
        super(TransformType.DELETE,silentNotification);
    }
}
