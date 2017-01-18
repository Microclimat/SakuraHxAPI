package com.sakura.api.model.constraint;
import com.sakura.api.model.design.IRestrictable;
import com.sakura.api.model.design.Area;
import org.tamina.utils.UID;

/**
 * A constraint is used to control the content of an {Area}
 * @class Constraint
 */
class Constraint implements IConstraint {

    /**
     * Constraint group name
     * @property groupName
     * @type {String}
     **/
    public var groupName:String = "";

    /**
     * Constraint id
     * @property id
     * @type {Float}
     **/
    public var id:Float = 0;

    /**
	 * Constraint name
	 * @property name
	 * @type {String}
	 */
    public var name:String = "";


    /**
	 * Constraint operator
	 * @property operator
	 * @type {Operator}
	 */
    public var operator:Operator;

    /**
	 * Operation value
	 * @property value
	 * @type {String}
	 */
    public var value:String = "";

    /**
     * Constructor
     * @param groupName {String}
     * @param name {String}
     * @param [operator] {Operator} (optional)
     * @param value {String}
     **/
    public function new(groupName:String = "", name:String = "", ?operator:Operator, value:String = "") {
        this.groupName = groupName;
        this.name = name;
        this.operator = operator;
        this.value = value;
        this.id = UID.getUID();
    }

    /**
     * Creates a clone of this, and returns it. If "copy" is true, the result will have the same id than the source.
     * @method clone
     * @param copy {Bool} if true, the returned Constraint will have the same id than the source
     * @return result {Constraint}
     **/
    public function clone(copy:Bool = false):Constraint {
        var cloneID:Float = UID.getUID();

        if (copy)  {
            cloneID = this.id;
        }

        var result:Constraint = new Constraint( groupName, name, operator, value );
        result.id = cloneID;

        return result;
    }

    /**
     * By default returns true
     * @method validate
     * @param target {IRestrictable}
     * @return result {Bool}
     **/
    public function validate(target:IRestrictable):Bool {
        var result = true;

        return result;
    }
}
