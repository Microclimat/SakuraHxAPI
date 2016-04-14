package com.sakura.api.model.constraint;
import org.tamina.utils.UID;

class PartnerImageConstraint extends ContentConstraint   {
    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "partnerImage"; }

    public function new(operator:Operator = null) {
        super(NAME, operator);
    }

    override public function clone(copy:Bool = false):PartnerImageConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new PartnerImageConstraint( operator );
        result.id = cloneID;
        return result;
    }
}
