package com.sakura.api.model.constraint;
import com.sakura.api.model.design.Text;
import org.tamina.log.QuickLogger;
import com.sakura.api.model.design.IRestrictable;
import org.tamina.utils.UID;

class TextNumberConstraint extends Constraint {
    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "textNumber"; }

    public function new(operator:Operator = null, textNumber:Int = -1) {
        super(ConstraintGroup.TEXT_NUMBER.name, NAME, operator, Std.string(textNumber));
    }

    override public function clone(copy:Bool = false):TextNumberConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new TextNumberConstraint( operator, Std.parseInt(value) );
        result.id = cloneID;
        return result;
    }

    override public function validate(target:IRestrictable):Bool{
        var result = true;
        var textNumber = getTextNumber(target);
        switch (this.operator){
            case Operator.LESS:
                result = textNumber < Std.parseInt(value);
            case Operator.EQUAL:
                result = textNumber == Std.parseInt(value);
            case Operator.MORE:
                result = textNumber > Std.parseInt(value);
            default:
                QuickLogger.info("unsupported operator");
        }
        return result;
    }

    private function getTextNumber(target:IRestrictable):Int{
        var result:Int = 0;
        for(i in 0...target.content.length){
            if(Text.is(target.content[i])){
                result++;
            }
        }
        return result;
    }
}
