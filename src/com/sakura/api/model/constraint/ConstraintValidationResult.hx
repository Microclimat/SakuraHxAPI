package com.sakura.api.model.constraint;
import Array;

/**
 * Resultat de la validation d'une contrainte
 * @class ConstraintValidationResult
 */
class ConstraintValidationResult implements IConstraintValidationResult{

/**
	 * Le resultat
	 * @property result
	 * @type Bool
	 */
    public var result:Bool;

/**
	 * La contrainte
	 * @property constraint
	 * @type Constraint
	 */
    public var constraint:IConstraint;

    public function new(constraint:IConstraint, result:Bool) {
        this.constraint = constraint;
        this.result = result;
    }
}

/**
 * Resultat de la validation des contraintes
 * @class ConstraintGroupValidationResult
 */
class ConstraintGroupValidationResult implements IConstraintGroupValidationResult{

    /**
	 * Le resultat
	 * @property result
	 * @type Bool
	 */
    public var result:Bool;

/**
	 * La liste des validations de contraintes
	 * @property constraints
	 * @type Array<ConstraintValidationResult>
	 */
    public var constraints:Array<IConstraintValidationResult>;

    public function new() {
        this.result = true;
        this.constraints = new Array<IConstraintValidationResult>();
    }
}
