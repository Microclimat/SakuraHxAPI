package com.sakura.api.model.transform;


/**
* Classe de base pour les transformations
* @author d.mouton
* @class Transform
* @constructor
* @param	type {TransformType} le type de transformation
*/
class Transform implements ITransform{

     /**
	 * Le type de transformation à appliquer
	 * @property type
	 * @type TransformType
	 */
    public var type:TransformType;

    public var silentNotification:Bool = false;


    public function new(type:TransformType,silentNotification:Bool=false):Void {
        this.type = type;
        this.silentNotification = silentNotification;
    }
}


interface ITransform {
    var type:TransformType;
    var silentNotification:Bool;
}