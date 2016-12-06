package com.sakura.api.model.constraint;

import org.tamina.utils.UID;

import com.sakura.api.model.io.AddImageOptions;

class AddImageOptionsConstraint extends Constraint {
    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "addimageoptions"; }

    public function new(options:AddImageOptions = null) {
        if (options == null) {
            options = new AddImageOptions(null, LETTERBOX, CENTER);
        }

        super(ConstraintGroup.AREA.name, NAME, EQUAL, options.toString());
    }

    override public function clone(copy:Bool = false):AddImageOptionsConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new AddImageOptionsConstraint(AddImageOptions.fromString(value));
        result.id = cloneID;
        return result;
    }

}
