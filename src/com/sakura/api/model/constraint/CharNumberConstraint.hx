package com.sakura.api.model.constraint;
import org.tamina.log.QuickLogger;
import com.sakura.api.model.design.Text;
import com.sakura.api.model.design.IRestrictable;
import org.tamina.utils.UID;


class CharNumberConstraint extends Constraint   {
    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "charNumber"; }

    public function new( ?operator:Operator, number:Int = 0) {
        super(ConstraintGroup.FONT.name, NAME, operator, Std.string(number));
    }

    override public function clone(copy:Bool = false):CharNumberConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new CharNumberConstraint( operator, Std.parseInt(this.value) );
        result.id = cloneID;
        return result;
    }

    override public function validate(target:IRestrictable):Bool {
        var result = true;
        switch (this.operator){
            case Operator.LESS:
                for (i in 0...target.content.length) {
                    if ( Text.is(target.content[i])) {
                        var text:Text = cast target.content[i];
                        if(text.label.length >= Std.parseInt(this.value)){
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
