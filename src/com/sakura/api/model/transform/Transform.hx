package com.sakura.api.model.transform;


/**
* Base class for transformations
* @author d.mouton
* @class Transform
* @extends ITransform
* @constructor
* @param	type {TransformType} the transformation type
*/
class Transform implements ITransform {

     /**
	 * The transformation type to apply
	 * @property type
	 * @type TransformType
	 */
    public var type:TransformType;

    /**
     * @property silentNotification
     * @type Bool
     * @default false
     **/
    public var silentNotification:Bool = false;

    /**
     * @param type {TransformType}
     * @param silentNotification {Bool} Default : false
     **/
    public function new(type:TransformType, silentNotification:Bool = false):Void {
        this.type = type;
        this.silentNotification = silentNotification;
    }
}

/**
 * Interface for all transformation implementations
 * @class ITransform
 **/
interface ITransform {

    /**
	 * The transformation type to apply
	 * @property type
	 * @type TransformType
	 */
    var type:TransformType;

    /**
     * @property silentNotification
     * @type Bool
     * @default false
     **/
    var silentNotification:Bool;
}