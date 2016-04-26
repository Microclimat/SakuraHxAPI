package com.sakura.api.model.constraint;
import com.sakura.api.model.design.Text;
import com.sakura.api.model.design.Picture;
import com.sakura.api.model.design.IRestrictable;
class ContentConstraint extends Constraint {

    public function new(name:String, ?operator:Operator) {
        super( ConstraintGroup.CONTENT.name, name, operator, name );
    }

    private function getImageNumber(target:IRestrictable):Int{
        var result:Int = 0;
        for(i in 0...target.content.length){
            if(Picture.is(target.content[i])){
                result++;
            }
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

    private function getContentConstraintByTypeAndOperator<T>(target:IRestrictable,type:T, operator:Operator):T{
        var result:T = null;
        for(i in 0...target.constraints.length){
            var constraint = target.constraints[i];
            if(Std.is(constraint,type) && constraint.operator == operator){
                result = cast constraint;
            }
        }
        return result;
    }
}
