package com.sakura.api.model.constraint;
import org.tamina.utils.UID;

class FilterConstraint extends ContentConstraint    {

    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "filter"; }

    public function new(operator:Operator = null) {
        super(NAME, operator);
    }

    override public function clone(copy:Bool = false):FilterConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new FilterConstraint( operator );
        result.id = cloneID;
        return result;
    }
}
