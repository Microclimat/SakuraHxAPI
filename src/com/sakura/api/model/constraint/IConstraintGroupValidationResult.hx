package com.sakura.api.model.constraint;

/**
 * Base interface to group validation results of constraints
 * @class IConstraintGroupValidationResult
 **/
interface IConstraintGroupValidationResult {

    /**
	 * The result
	 * @property result
	 * @type {Bool}
	 */
    public var result:Bool;

    /**
	 * La liste des validations de contraintes
	 * @property constraints
	 * @type {Array<ConstraintValidationResult>}
	 */
    public var constraints:Array<IConstraintValidationResult>;

}
