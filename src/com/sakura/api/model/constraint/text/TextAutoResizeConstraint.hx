package com.sakura.api.model.constraint.text;

import org.tamina.utils.UID;

class TextAutoResizeConstraint extends TransformConstraint {

    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "text_auto_resize"; }

    public function new() {
        super(NAME);
    }

    override public function clone(copy:Bool = false):TextAutoResizeConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new TextAutoResizeConstraint();
        result.id = cloneID;
        return result;
    }
}
