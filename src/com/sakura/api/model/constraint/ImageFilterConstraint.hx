package com.sakura.api.model.constraint;
import org.tamina.utils.UID;

class ImageFilterConstraint extends Constraint {
    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "imageFilter"; }

    public function new(operator:Operator = null, filterID:Int = 0) {
        super(ConstraintGroup.FILTER.name, NAME, operator, Std.string(filterID));
    }

    override public function clone(copy:Bool = false):ImageFilterConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new ImageFilterConstraint( operator, Std.parseInt(value) );
        result.id = cloneID;
        return result;
    }
}
