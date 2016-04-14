package com.sakura.api.model.constraint;
import com.sakura.api.model.design.IRestrictable;
import com.sakura.api.model.design.Area;
import org.tamina.utils.UID;

/**
 * Une contrainte, utilisée pour contraindre le contenu des zones de personnalisation {Area}
 * @class Constraint
 */
class Constraint implements IConstraint{

    public var groupName:String = "";

    public var id:Float = 0;

/**
	 * Le nom de la contrainte
	 * @property name
	 * @type String
	 */
    public var name:String = "";


/**
	 * L'operateur
	 * @property operator
	 * @type Operator
	 */
    public var operator:Operator;

/**
	 * La valeur de l'operation
	 * @property value
	 * @type String
	 */
    public var value:String = "";
    
    public function new(groupName:String = "", name:String = "", ?operator:Operator, value:String = "") {
        this.groupName = groupName;
        this.name = name;
        this.operator = operator;
        this.value = value;
        this.id = UID.getUID();
    }

    public function clone( copy:Bool = false ):Constraint
    {
        var cloneID:Float = UID.getUID();
        if ( copy )
        {
            cloneID = this.id;
        }
        var result:Constraint = new Constraint( groupName, name, operator, value );
        result.id = cloneID;
        return result;
    }

    public function validate(target:IRestrictable):Bool{
        var result = true;
        return result;
    }
}
