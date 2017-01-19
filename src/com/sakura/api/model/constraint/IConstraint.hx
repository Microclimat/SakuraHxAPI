package com.sakura.api.model.constraint;
import com.sakura.api.model.design.IRestrictable;

/**
 * Base interface for a Contraint
 * @class IConstraint
 **/
interface IConstraint {

    /**
     * @property groupName
     * @type {String}
     * @default ""
     **/
    public var groupName:String = "";

    /**
     * @property id
     * @type {Float}
     * @default 0
     **/
    public var id:Float = 0;

    /**
     * @property name
     * @type {String}
     * @default ""
     **/
    public var name:String = "";

    /**
     * @property operator
     * @type {Operator}
     **/
    public var operator:Operator;

    /**
     * @property value
     * @type {String}
     * @default ""
     **/
    public var value:String = "";

    /**
     * Returns a clone of the implementation (a {Constraint}). If copy is true, the clone will have the same id than the implementation.
     * @method clone
     * @param copy {Bool}. Default : false
     * @return clone {Constraint}
     **/
    public function clone(copy:Bool = false):Constraint;

    /**
     * Returns a clone of the implementation (a {Constraint}). If copy is true, the clone will have the same id than the implementation.
     * @method clone
     * @param copy {Bool}. Default : false
     * @return clone {Constraint}
     **/
    public function validate(target:IRestrictable):Bool;

}
