package com.sakura.api.model.constraint;
interface IConstraintGroupValidationResult {

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

}
