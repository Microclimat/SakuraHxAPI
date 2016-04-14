package com.sakura.api.model.design;

import com.sakura.api.model.constraint.IConstraintGroupValidationResult;
import com.sakura.api.model.info.AreaInfo.IAreaInfo;
import com.sakura.api.model.info.AreaInfo;
import com.sakura.api.model.constraint.ConstraintValidationResult;
import com.sakura.api.model.constraint.ConstraintValidationResult.ConstraintGroupValidationResult;
import Array;
import com.sakura.api.model.constraint.Constraint;
import org.tamina.utils.UID;

class Area implements IArea {

    public var constraints:Array<Constraint>;
    public var content:Array<IDrawingElement>;
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

    public function new(id:Float = 0, x:Float = 0, y:Float = 0, width:Float = 5, height:Float = 5, name:String = "") {
        if (id != 0) {
            this.id = id;
        }
        else {
            this.id = UID.getUID();
        }
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.content = new Array<IDrawingElement>();
        this.name = name;
        this.constraints = new Array<Constraint>();
    }

    public function clone(copy:Bool = false):IArea {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result:Area = new Area( cloneID, x, y, width, height, name );
        result.content = this.content.slice(0);
        var contentBackup:Array<IDrawingElement> = new Array<IDrawingElement>();
        result.parent = parent;
        for (i in 0...content.length) {
            contentBackup.push(content[ i ].clone(copy));
            contentBackup[ i ].parent = result;
        }

        var constaintesBackup:Array<Constraint> = new Array<Constraint>();
        for (i in 0...constraints.length) {
            constaintesBackup.push(constraints[ i ].clone(copy));
        }
        result.constraints = constaintesBackup;

        result.content = contentBackup;
        return result;
    }

    public function getNumPicture():Int {
        var result:Int = 0;
        for (i in 0...content.length) {
            if (Std.is(content[i], Picture)) {
                result++;
            }
        }
        return result;
    }

    public function merge(source:IArea):Void {
        if (source != null) {
            for (i in 0...source.content.length) {
                var element = source.content[i];
                var newElement:IDrawingElement = element.clone(true);
                newElement.x = ( newElement.x / newElement.parent.width ) * this.width;
                newElement.y = ( newElement.y / newElement.parent.height ) * this.height;
                if (Std.is(newElement, Picture)) {
                    var p:Picture = cast newElement;
                    var scaleRatio:Float = this.width / newElement.parent.width;
                    p.xScale *= scaleRatio;
                    p.yScale *= scaleRatio;
                }
                newElement.parent = this;
                content.push(newElement);
            }

        }
    }

    public function validateConstraints():IConstraintGroupValidationResult{
        var result = new ConstraintGroupValidationResult();
        for(i in 0...constraints.length){
            var constraint = constraints[i];
            var validationResult = new ConstraintValidationResult(constraint, constraint.validate(this));
            if(!validationResult.result){
                result.result = false;
            }
            result.constraints.push(validationResult);
        }
        return result;
    }

    public function toInfo():IAreaInfo{
        var result = new AreaInfo();
        result.id = id;
        result.name = name;
        result.height = height;
        result.width = width;
        result.x = x;
        result.y = y;
        for(i in 0...constraints.length){
            result.constraints.push( constraints[i].clone() );
        }
        return result;
    }

    private function get_scaledWidth():Float { return width; }

    private function get_scaledHeight():Float { return height; }
}
