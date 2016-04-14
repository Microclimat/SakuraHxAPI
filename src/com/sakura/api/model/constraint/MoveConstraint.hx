package com.sakura.api.model.constraint;
import org.tamina.utils.UID;

class MoveConstraint extends TransformConstraint {

    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "move"; }

    public function new() {
        super(NAME);
    }

    override public function clone(copy:Bool = false):MoveConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new MoveConstraint();
        result.id = cloneID;
        return result;
    }
}
