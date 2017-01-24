package com.sakura.api.model.design;

import com.sakura.api.model.constraint.IConstraintGroupValidationResult;
import com.sakura.api.model.info.AreaInfo.IAreaInfo;

/**
 * Interface containing all the needed data for an area to have
 * @class IArea
 **/
interface IArea extends IRestrictable extends ITransformable {

    /**
     * @property height
     * @type Float
     **/
    public var height:Float;

    /**
     * @property id
     * @type Float
     **/
    public var id:Float;

    /**
     * @property name
     * @type String
     * @default ""
     **/
    public var name:String = "";

    /**
     * @property parent
     * @type Template
     **/
    public var parent:Template;

    /**
     * @property rotate
     * @type Float
     * @default 0
     **/
    public var rotate:Float = 0;

    /**
     * @property width
     * @type Float
     **/
    public var width:Float;

    /**
     * @property x
     * @type Float
     **/
    public var x:Float;

    /**
     * @property y
     * @type Float
     **/
    public var y:Float;

    /**
     * @property scaledWidth
     * @type Float
     * @readonly
     **/
    public var scaledWidth(get, null):Float;

    /**
     * @property scaledHeight
     * @type Float
     * @readonly
     **/
    public var scaledHeight(get, null):Float;

    /**
     * @property editable
     * @type Bool
     * @default false
     **/
    public var editable:Bool=false;

    /**
     * @method toInfo
     * @return info {IAreaInfo}
     **/
    public function toInfo():IAreaInfo;

    /**
     * @method validateConstraints
     * @return results {IConstraintGroupValidationResult}
     **/
    public function validateConstraints():IConstraintGroupValidationResult;

    /**
     * @method merge
     * @param source {IArea}
     **/
    public function merge(source:IArea):Void;

    /**
     * @method validateConstraints
     * @return nbPictures {Int}
     **/
    public function getNumPicture():Int;

    /**
     * Returns a clone of the implementation. If copy is true, the clone will have the same id than the implementation.
     * @method clone
     * @param copy {Bool}. Default : false
     * @return clone {IArea}
     **/
    public function clone(copy:Bool = false):IArea;

}
