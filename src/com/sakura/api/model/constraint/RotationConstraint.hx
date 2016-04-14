package com.sakura.api.model.constraint;
import org.tamina.utils.UID;

class RotationConstraint extends TransformConstraint {

    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "rotation"; }

    public function new() {
        super(NAME);
    }

    override public function clone(copy:Bool = false):RotationConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new RotationConstraint();
        result.id = cloneID;
        return result;
    }
}
