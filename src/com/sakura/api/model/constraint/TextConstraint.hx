package com.sakura.api.model.constraint;

import org.tamina.log.QuickLogger;
import com.sakura.api.model.design.IRestrictable;
import org.tamina.utils.UID;

class TextConstraint extends ContentConstraint   {
    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "text"; }

    public function new(operator:Operator = null) {
        super(NAME, operator);
    }

    override public function clone(copy:Bool = false):TextConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new TextConstraint( operator );
        result.id = cloneID;
        return result;
    }

    override public function validate(target:IRestrictable):Bool{
        var result = true;
        var textNumber = getTextNumber(target);
        switch (this.operator){
            case Operator.DIFFERENT:
                result = textNumber == 0;
            case Operator.INCLUDE:
                var imagesConstrain = getContentConstraintByTypeAndOperator(target,AllImageConstraint,Operator.INCLUDE);
                result = (imagesConstrain != null ) && (getImageNumber(target) > 0);
            default:
                QuickLogger.info("unsupported operator");
        }
        return result;
    }

}
