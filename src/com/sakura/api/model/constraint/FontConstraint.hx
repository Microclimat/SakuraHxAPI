package com.sakura.api.model.constraint;
import com.sakura.api.model.design.Text;
import org.tamina.log.QuickLogger;
import com.sakura.api.model.design.IRestrictable;
import org.tamina.utils.UID;


class FontConstraint extends Constraint {
    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "font"; }

    public function new(?operator:Operator, font:String = "") {
        super(ConstraintGroup.FONT.name, NAME, operator, font);
    }

    override public function clone(copy:Bool = false):FontConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new FontConstraint( operator, value );
        result.id = cloneID;
        return result;
    }

    override public function validate(target:IRestrictable):Bool {
        var result = true;
        switch (this.operator){
            case Operator.DIFFERENT:
                for (i in 0...target.content.length) {
                    if (Text.is(target.content[i])) {
                        var text:Text = cast target.content[i];
                        if(text.font == this.value){
                            result = false;
                        }
                    }
                }
            case Operator.EQUAL:
                for (i in 0...target.content.length) {
                    if (Text.is(target.content[i])) {
                        var text:Text = cast target.content[i];
                        if(text.font != this.value){
                            result = false;
                        }
                    }
                }
            default:
                QuickLogger.info("unsupported operator");
        }
        return result;
    }
}
