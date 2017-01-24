package com.sakura.api.model.design;

/**
 * Base interface for objects needing transformations (translations, rotations, scaling)
 * @class ITransformable
 **/
interface ITransformable {

    /**
     * Element's height
     * @property height
     * @type Float
     **/
    public var height:Float;

    /**
     * Element's id
     * @property id
     * @type Float
     **/
    public var id:Float;

    /**
     * Element's rotation in radians
     * @property rotate
     * @type Float
     * @default 0
     **/
    public var rotate:Float = 0;

    /**
     * Element's width
     * @property width
     * @type Float
     **/
    public var width:Float;

    /**
     * Element's X axis position
     * @property x
     * @type Float
     **/
    public var x:Float;

    /**
     * Element's Y axis position
     * @property y
     * @type Float
     **/
    public var y:Float;

}
