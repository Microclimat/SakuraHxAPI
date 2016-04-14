package com.sakura.api.model.constraint;
import org.tamina.log.QuickLogger;
import com.sakura.api.model.design.Picture;
import com.sakura.api.model.design.IRestrictable;
import org.tamina.utils.UID;

class ImageNumberConstraint extends Constraint {
    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "imageNumber"; }

    public function new(operator:Operator = null, imageNumber:Int = -1) {
        super(ConstraintGroup.IMAGE_NUMBER.name, NAME, operator, Std.string(imageNumber));
    }

    override public function clone(copy:Bool = false):ImageNumberConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new ImageNumberConstraint( operator, Std.parseInt(value) );
        result.id = cloneID;
        return result;
    }

    override public function validate(target:IRestrictable):Bool{
        var result = true;
        var imageNumber = getImageNumber(target);
        switch (this.operator){
            case Operator.LESS:
                result = imageNumber < Std.parseInt(value);
            case Operator.EQUAL:
                result = imageNumber == Std.parseInt(value);
            case Operator.MORE:
                result = imageNumber > Std.parseInt(value);
            default:
            QuickLogger.info("unsupported operator");
        }
        return result;
    }

    private function getImageNumber(target:IRestrictable):Int{
        var result:Int = 0;
        for(i in 0...target.content.length){
            if(Std.is(target.content[i],Picture)){
                result++;
            }
        }
        return result;
    }
}
