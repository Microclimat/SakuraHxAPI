package com.sakura.api.model.constraint.text;
import org.tamina.utils.UID;

class TextSelectConstraint extends TransformConstraint {

    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "text_select"; }

    public function new() {
        super(NAME);
    }

    override public function clone(copy:Bool = false):TextSelectConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new TextSelectConstraint();
        result.id = cloneID;
        return result;
    }
}
