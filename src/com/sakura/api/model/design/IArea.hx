package com.sakura.api.model.design;

/**
 * Created by d.mouton on 13/04/2016.
 */
import com.sakura.api.model.constraint.IConstraintGroupValidationResult;
import com.sakura.api.model.info.AreaInfo.IAreaInfo;
interface IArea extends IRestrictable{

    public var height:Float;
    public var id:Float;
    public var name:String = "";
    public var parent:Template;
    public var rotate:Float = 0;
    public var width:Float;
    public var x:Float;
    public var y:Float;
    public var scaledWidth(get, null):Float;
    public var scaledHeight(get, null):Float;
    public var movable:Bool=false;

    function toInfo():IAreaInfo;
    function validateConstraints():IConstraintGroupValidationResult;
    function merge(source:IArea):Void;
    function getNumPicture():Int;
    function clone(copy:Bool = false):IArea;

}
