package com.sakura.api.model.constraint;
import org.tamina.utils.UID;

class ScaleConstraint extends TransformConstraint {

    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "scale"; }

    public function new() {
        super(NAME);
    }

    override public function clone(copy:Bool = false):ScaleConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new ScaleConstraint();
        result.id = cloneID;
        return result;
    }
}
