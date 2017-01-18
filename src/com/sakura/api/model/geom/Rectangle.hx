package com.sakura.api.model.geom;

/**
 * A simple Rectangle used in calculations
 * @class Rectangle
 **/
class Rectangle {

    public var height:Float;
    public var width:Float;
    public var x:Float;
    public var y:Float;

    /**
     * Constructor
     * @param [x] {Float} the x axis position of the rectangle (optional)
     * @param [y] {Float} the y axis position of the rectangle (optional)
     * @param [width] {Float} the width of the rectangle (optional)
     * @param [height] {Float} the height of the rectangle (optional)
     **/
    public function new(?x:Float = 0, ?y:Float = 0, ?width:Float = 0, ?height:Float = 0):Void{
        this.x = x;
        this.y = y;
        this.height = height;
        this.width = width;
    }
}
