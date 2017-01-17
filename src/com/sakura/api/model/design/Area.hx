package com.sakura.api.model.design;

import com.sakura.api.model.design.Picture;
import com.sakura.api.model.constraint.IConstraintGroupValidationResult;
import com.sakura.api.model.info.AreaInfo.IAreaInfo;
import com.sakura.api.model.info.AreaInfo;
import com.sakura.api.model.constraint.ConstraintValidationResult;
import com.sakura.api.model.constraint.ConstraintValidationResult.ConstraintGroupValidationResult;
import Array;
import com.sakura.api.model.constraint.Constraint;
import org.tamina.utils.UID;
import org.tamina.geom.Rectangle;
import js.html.svg.Rect;

/**
 * The Area class represents a customization area in a template.
 * Images and texts can be contained.
 * @class Area
 **/
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
    public var editable:Bool=false;

    /**
     * @param id {Float}
     * @param x {Float}
     * @param y {Float}
     * @param width {Float}
     * @param height {Float}
     * @param name {String}
     **/
    public function new(id:Float = 0, x:Float = 0, y:Float = 0, width:Float = 5, height:Float = 5, name:String = "") {
        if (id != 0) {
            this.id = id;
        } else {
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

    /**
     * Clones an area
     * @method clone
     * @param copy {Bool} if the new area shall keep the original id
     * @return area {IArea}
     **/
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
        result.editable = this.editable;
        result.content = contentBackup;


        return result;
    }

    /**
     * Gives the number of pictures in the area
     * @method getNumPicture
     * @return result {Int} the number of pictures in the area
     **/
    public function getNumPicture():Int {
        var result:Int = 0;

        for (i in 0...content.length) {
            if (Picture.is(content[i])) {
                result++;
            }
        }

        return result;
    }

    /**
     * Merge this with another area
     * @method merge
     * @param source {IArea}
     **/
    public function merge(source:IArea):Void {
        if (source != null) {
            var usedRect:Rectangle = getUsedRect(source);
            var usedWidth:Float = usedRect.right - usedRect.left;
            var usedHeight:Float = usedRect.bottom - usedRect.top;

            var alignedRight:Bool = usedRect.left > source.width - usedRect.right;
            var alignedBottom:Bool = usedRect.top > source.height * 0.3 && usedRect.top > source.height - usedRect.bottom;
            var centeredW:Bool = usedRect.left == source.width - usedRect.right;
            var centeredH:Bool = usedRect.top > 0 && usedRect.top == source.height - usedRect.bottom;

            var maxScaleW:Float, maxScaleH:Float;
            var ratioW:Float = this.width / source.width;
            var ratioH:Float = this.height / source.height;

            if (alignedRight) {
                maxScaleW = (this.width - (source.width - usedRect.right) * ratioW) / usedWidth;
            } else {
                maxScaleW = (this.width - usedRect.left * ratioW * 2) / usedWidth;
            }

            if (alignedBottom) {
                maxScaleH = (this.height - (source.height - usedRect.bottom) * ratioH) / usedHeight;
            } else {
                maxScaleH = (this.height - usedRect.top * ratioH * 2) / usedHeight;
            }

            var scale = Math.min(maxScaleW, maxScaleH);

            var newArea:Rect = cast {
                x: usedRect.left * ratioW,
                y: usedRect.top * ratioH,
                width: usedWidth * scale,
                height: usedHeight * scale,
            };

            if (alignedRight) {
                newArea.x = (usedRect.right * ratioW) - newArea.width;
            } else if (centeredW) {
                newArea.x = (this.width - newArea.width) / 2;
            }

            if (alignedBottom) {
                newArea.y = (usedRect.bottom * ratioH) - newArea.height;
            } else if (centeredH) {
                newArea.y = (this.height - newArea.height) / 2;
            }

            for (i in 0...source.content.length) {
                var newElement:IDrawingElement = source.content[i].clone(true);
                var relX:Float = newElement.x - usedRect.left;
                var relY:Float = newElement.y - usedRect.top;
                newElement.x = relX * scale + newArea.x;
                newElement.y = relY * scale + newArea.y;

                if (Std.is(newElement, Picture)) {
                    var p:Picture = cast newElement;
                    p.xScale *= scale;
                    p.yScale *= scale;

                } else if (Std.is(newElement, Text)) {
                    var t:Text = cast newElement;
                    var wRatio:Float = t.width / t.size;
                    var hRatio:Float = t.height / t.size;

                    t.size = t.size * scale;
                    t.width = t.size * wRatio;
                    t.height = t.size * hRatio;
                }

                newElement.parent = this;
                content.push(newElement);
            }
        }
    }

    /**
     * Returns an array of constraints result wich tells if the constraint was validated or not by the area
     * @method validateConstraints
     * @return result {IConstraintGroupValidationResult}
     **/
    public function validateConstraints():IConstraintGroupValidationResult {
        var result = new ConstraintGroupValidationResult();

        for (i in 0...constraints.length) {
            var constraint = constraints[i];
            var validationResult = new ConstraintValidationResult(constraint, constraint.validate(this));

            if (!validationResult.result) {
                result.result = false;
            }

            result.constraints.push(validationResult);
        }

        return result;
    }

    /**
     * Creates an IAreaInfo from this
     * @method toInfo
     * @return result {IAreaInfo}
     **/
    public function toInfo():IAreaInfo {
        var result = new AreaInfo();
        result.id = id;
        result.name = name;
        result.height = height;
        result.width = width;
        result.x = x;
        result.y = y;
        result.numElements = content.length;

        for (i in 0...constraints.length){
            result.constraints.push(constraints[i].clone());
        }

        return result;
    }

    private function get_scaledWidth():Float { return width; }

    private function get_scaledHeight():Float { return height; }

    private function getUsedRect(source:IArea):Rectangle {
        var usedRect:Rectangle = null;

        if (source != null) {
            var areaH:Float = source.height;
            var areaW:Float = source.width;

            var minY:Float = -1; var maxY:Float = -1;
            var minX:Float = -1; var maxX:Float = -1;

            for (i in 0...source.content.length) {
                var element:IDrawingElement = source.content[i];
                var height:Float = element.height;
                var width:Float = element.width;

                if (Std.is(element, Picture)) {
                    var p:Picture = cast element;
                    height *= p.yScale;
                    width *= p.xScale;
                }

                if (minY == -1 || minY > Math.max(0, element.y - height / 2)) {
                    minY = Math.max(0, element.y - height / 2);
                }

                if (maxY == -1 || maxY < Math.min(areaH, element.y + height / 2)) {
                    maxY = Math.min(areaH, element.y + height / 2);
                }

                if (minX == -1 || minX > Math.max(0, element.x - width / 2)) {
                    minX = Math.max(0, element.x - width / 2);
                }

                if (maxX == -1 || maxX < Math.min(areaW, element.x + width / 2)) {
                    maxX = Math.min(areaW, element.x + width / 2);
                }
            }

            if (areaW - maxX < minX) {
                minX = areaW - maxX;
            } else {
                maxX = areaW - minX;
            }

            usedRect = cast {
                top: Math.max(0, minY),
                bottom: Math.min(areaH, Math.max(0, maxY)),
                left: Math.max(0, minX),
                right: Math.min(areaW, Math.max(0, maxX))
            };
        }

        return usedRect;
    }
}
