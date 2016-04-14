package com.sakura.api.model.geom;
class Rectangle {

    public var height:Float;
    public var width:Float;
    public var x:Float;
    public var y:Float;

    public function new(?x:Float = 0, ?y:Float = 0, ?width:Float = 0, ?height:Float = 0):Void{
        this.x = x;
        this.y = y;
        this.height = height;
        this.width = width;
    }

}
