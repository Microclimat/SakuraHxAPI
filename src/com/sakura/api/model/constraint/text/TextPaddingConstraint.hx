package com.sakura.api.model.constraint.text;

import org.tamina.utils.UID;

class TextPaddingConstraint extends Constraint   {
    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "text_padding"; }

    public function new(value:Int) {
        super(NAME, Operator.EQUAL, Std.string(value));
    }

    override public function clone(copy:Bool = false):TextPaddingConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new TextPaddingConstraint(Std.parseInt(value));
        result.id = cloneID;
        return result;
    }

}
