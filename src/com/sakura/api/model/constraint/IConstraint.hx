package com.sakura.api.model.constraint;
import com.sakura.api.model.design.IRestrictable;

/**
 * Base interface for a Contraint
 * @class IConstraint
 **/
interface IConstraint {

    public var groupName:String = "";
    public var id:Float = 0;
    public var name:String = "";
    public var operator:Operator;
    public var value:String = "";

    public function clone(copy:Bool = false):Constraint;
    public function validate(target:IRestrictable):Bool;

}
