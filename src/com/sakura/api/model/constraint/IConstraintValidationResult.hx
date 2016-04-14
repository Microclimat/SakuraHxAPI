package com.sakura.api.model.constraint;
interface IConstraintValidationResult {


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

}
