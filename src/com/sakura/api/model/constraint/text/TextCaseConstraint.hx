package com.sakura.api.model.constraint.text;

import org.tamina.utils.UID;
import com.sakura.api.model.design.TextCase;

class TextCaseConstraint extends Constraint {

    public static inline var NAME:String = "text_case";

    public function new(?textCase:TextCase = NONE) {
        super(ConstraintGroup.TEXT_TRANSFORM.name, NAME, EQUAL, textCase);
    }

    override public function clone(copy:Bool = false):TextCaseConstraint {
        var cloneID:Float = UID.getUID();

        if (copy) {
            cloneID = this.id;
        }

        var result = new TextCaseConstraint(value);
        result.id = cloneID;
        return result;
    }
}
