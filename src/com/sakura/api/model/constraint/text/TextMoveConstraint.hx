package com.sakura.api.model.constraint.text;
import org.tamina.utils.UID;

class TextMoveConstraint extends TransformConstraint {

    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "text_move"; }

    public function new() {
        super(NAME);
    }

    override public function clone(copy:Bool = false):TextMoveConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new TextMoveConstraint();
        result.id = cloneID;
        return result;
    }
}
