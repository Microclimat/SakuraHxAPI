package com.sakura.api.model.constraint;
import org.tamina.log.QuickLogger;
import com.sakura.api.model.design.IRestrictable;
import org.tamina.utils.UID;

class AllImageConstraint extends ContentConstraint   {
    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "allImage"; }

    public function new(operator:Operator = null) {
        super(NAME, operator);
    }

    override public function clone(copy:Bool = false):AllImageConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new AllImageConstraint( operator );
        result.id = cloneID;
        return result;
    }

    override public function validate(target:IRestrictable):Bool{
        var result = true;
        var imageNumber = getImageNumber(target);
        switch (this.operator){
            case Operator.DIFFERENT:
                result = imageNumber == 0;
            case Operator.INCLUDE:
                var textConstrain = getContentConstraintByTypeAndOperator(target,TextConstraint,Operator.INCLUDE);
                result = (textConstrain != null ) && (getTextNumber(target) > 0);
            default:
                QuickLogger.info("unsupported operator");
        }
        return result;
    }
}
