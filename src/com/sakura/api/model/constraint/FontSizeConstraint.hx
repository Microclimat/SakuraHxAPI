package com.sakura.api.model.constraint;
import org.tamina.log.QuickLogger;
import com.sakura.api.model.design.Text;
import com.sakura.api.model.design.IRestrictable;
import org.tamina.utils.UID;

class FontSizeConstraint extends Constraint {
    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "fontSize"; }

    public function new(operator:Operator = null, size:Int = -1) {
        super(ConstraintGroup.FONT_SIZE.name, NAME, operator, Std.string(size));
    }

    override public function clone(copy:Bool = false):FontSizeConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new FontSizeConstraint( operator, Std.parseInt(value) );
        result.id = cloneID;
        return result;
    }

    override public function validate(target:IRestrictable):Bool {
        var result = true;
        switch (this.operator){
            case Operator.DIFFERENT:
                for (i in 0...target.content.length) {
                    if (Std.is(target.content[i], Text)) {
                        var text:Text = cast target.content[i];
                        if(text.size == Std.parseInt(this.value)){
                            result = false;
                        }
                    }
                }
            case Operator.EQUAL:
                for (i in 0...target.content.length) {
                    if (Std.is(target.content[i], Text)) {
                        var text:Text = cast target.content[i];
                        if(text.size != Std.parseInt(this.value)){
                            result = false;
                        }
                    }
                }
            case Operator.MORE:
                for (i in 0...target.content.length) {
                    if (Std.is(target.content[i], Text)) {
                        var text:Text = cast target.content[i];
                        if(text.size <= Std.parseInt(this.value)){
                            result = false;
                        }
                    }
                }
            case Operator.LESS:
                for (i in 0...target.content.length) {
                    if (Std.is(target.content[i], Text)) {
                        var text:Text = cast target.content[i];
                        if(text.size >= Std.parseInt(this.value)){
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
