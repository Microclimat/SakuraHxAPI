package com.sakura.api.model.constraint.text;

import org.tamina.utils.UID;

class TextLineNumberConstraint extends Constraint {

    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "text_line_number"; }

    public function new(?operator:Operator, ?value:Int = 0) {
        super(ConstraintGroup.TEXT.name, NAME, operator, Std.string(value));
    }

    override public function clone(copy:Bool = false):TextLineNumberConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new TextLineNumberConstraint();
        result.id = cloneID;
        return result;
    }
}
