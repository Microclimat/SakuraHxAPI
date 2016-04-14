package com.sakura.api.model.constraint;
import org.tamina.utils.UID;

class MyDesignImageConstraint extends ContentConstraint  {

    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "myDesignImage"; }

    public function new(operator:Operator = null) {
        super(NAME, operator);
    }

    override public function clone(copy:Bool = false):MyDesignImageConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new MyDesignImageConstraint( operator );
        result.id = cloneID;
        return result;
    }
}
