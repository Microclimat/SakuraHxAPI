/*
* SakuraEditor
* Visit http://storage.sakuradesigner.microclimat.com/apps/api/ for documentation, updates and examples.
*
* Copyright (c) 2014 microclimat, inc.
* 
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without
* restriction, including without limitation the rights to use,
* copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following
* conditions:
* 
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
* 
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
*/
package com.sakura.api.model.design;

import org.tamina.utils.UID;

/**
* Text (will be contained in an Area)
* @namespace com.sakura.data.design
* @author d.mouton
* @class Text
* @constructor
* @extends IText
*/
@:expose class Text implements IText {

    /**
     * The horizontal text alignment. Any of "start", "end", "left", "right", and "center".
     * @property align
     * @type String
     */
    public var align:String = "";

	/**
	 * The vertical text alignment. Any of "top", "bottom", and "center".
	 * @property valign
	 * @type String
	 */
    public var valign:String = "";
	
	/**
	 * Is the text bold ?
	 * @property bold
	 * @type Bool
	 * @default false
	 */
    public var bold:Bool = false;
	
	/**
	 * Text's color
	 * @property color
	 * @type Float
	 * @example color = 16711680; // float value for #FF0000.
	 */
    public var color:Float = 0;

	/**
	 * The font to use
	 * @property font
	 * @type String
	 * @example font= 'Arial';
	 */
    public var font:String = "";

    /**
     * Text's height
     * @property height
     * @type Float
     * @default 0
     **/
    public var height:Float = 0;

    /**
     * Text's id
     * @property id
     * @type Float
     * @default 0
     **/
    public var id:Float = 0;
	
	/**
	 * Is the text in italic ?
	 * @property italic
	 * @type Bool
	 * @default false
	 */
    public var italic:Bool = false;
	
	/**
	 * The text to display
	 * @property label
	 * @type String
	 */
    public var label:String = "";

    /**
	 * The text's parent
	 * @property parent
	 * @type Area
	 */
    public var parent:Area;

    /**
	 * The rotation in radians
	 * @property rotate
	 * @type Float
	 * @default 0
	 */
    public var rotate:Float = 0;

	/**
	 * Text's size in pixels
	 * @property size
	 * @type Float
	 * @default 0
	 */
    public var size:Float = 0;
	
	/**
	 * Is the text underlined ?
	 * @property underline
	 * @type Bool
	 * @default false
	 */
    public var underline:Bool = false;

    /**
	 * Text's width
	 * @property width
	 * @type Float
	 * @default 0
	 */
    public var width:Float = 0;

    /**
	 * Position on the x axis
	 * @property x
	 * @type Float
	 * @default 0
	 */
    public var x:Float = 0;

    /**
	 * Position on the y axis
	 * @property y
	 * @type Float
	 * @default 0
	 */
    public var y:Float = 0;

    /**
	 * Is the text moveable ?
	 * @property isFixed
	 * @type Bool
	 * @default false
	 */
    public var isFixed:Bool = false;

    /**
	 * Does the text automatically resize itself ?
	 * @property autoResize
	 * @type Bool
	 * @default false
	 */
    public var autoResize:Bool = false;

    /**
	 * Text's width after scaling
	 * @property scaledWidth
	 * @type Float
	 * @readonly
	 */
    public var scaledWidth(get, null):Float;

    /**
	 * Text's height after scaling
	 * @property scaledHeight
	 * @type Float
	 * @readonly
	 */
    public var scaledHeight(get, null):Float;

    /**
     * Constructor
     * @param label {String} Default : ""
     * @param align {String} Default : ""
     * @param bold {Bool} Default : false
     * @param color {Float} Default : 0
     * @param font {String} Default : "Arial"
     * @param italic {Bool} Default : false
     * @param underline {Bool} Default : false
     * @param size {Float} Default : 12
     * @param valign {String} Default : ""
     **/
    public function new(label:String = "", align:String = "", bold:Bool = false, color:Float = 0, font:String = "Arial", italic:Bool = false, underline:Bool = false, size:Float = 12, valign:String = "") {
        this.label = label;
        this.align = align;
        this.valign = valign;
        this.bold = bold;
        this.color = color;
        this.font = font;
        this.italic = italic;
        this.underline = underline;
        this.size = size;
        this.id = UID.getUID();
    }

    /**
     * @method fromIText
     * @static
     * @param source {IText}
     * @return result {Text}
     **/
    public static function fromIText(source:IText):Text {
        var result:Text = new Text();

        result.align = source.align;
        result.valign = source.valign;
        result.bold = source.bold;
        result.color = source.color;
        result.font = source.font;
        result.height = source.height;
        result.id = source.id;
        result.italic = source.italic;
        result.label = source.label;
        result.parent = source.parent;
        result.rotate = source.rotate;
        result.size = source.size;
        result.underline = source.underline;
        result.width = source.width;
        result.x = source.x;
        result.y = source.y;
        result.isFixed = source.isFixed;

        return result;
    }

    /**
     * Returns a clone of the text. If copy is true, the clone will have the same id than the implementation.
     * @method clone
     * @param copy {Bool}. Default : false
     * @return clone {Text}
     **/
    public function clone(copy:Bool = false):Text {
        var cloneID = UID.getUID();

        if (copy) {
            cloneID = this.id;
        }

        var result:Text = new Text();
        result.align = align;
        result.valign = valign;
        result.bold = bold;
        result.color = color;
        result.font = font;
        result.height = height;
        result.id = id;
        result.italic = italic;
        result.label = label;
        result.parent = parent;
        result.rotate = rotate;
        result.size = size;
        result.underline = underline;
        result.width = width;
        result.x = x;
        result.y = y;
        result.isFixed = isFixed;

        return result;
    }

    /**
     * @method fillFrom
     * @static
     * @param target {Text}
     * @param source {IText}
     **/
    public static function fillFrom(target:Text, source:IText):Void {
        target.align = source.align;
        target.valign = source.valign;
        target.bold = source.bold;
        target.color = source.color;
        target.font = source.font;
        target.height = source.height;
        target.id = source.id;
        target.italic = source.italic;
        target.label = source.label;
        target.parent = source.parent;
        target.rotate = source.rotate;
        target.size = source.size;
        target.underline = source.underline;
        target.width = source.width;
        target.x = source.x;
        target.y = source.y;
    }

    /**
     * @method is
     * @static
     * @param target {Dynamic}
     * @return result {Bool}
     **/
    public static function is(target:Dynamic):Bool{
        var result = false;

        if (target.label != null) {
            result = true;
        }

        return result;
    }

    private function get_scaledWidth():Float { return width; }

    private function get_scaledHeight():Float { return height; }

}

/**
 * @class IText
 * @extends IDrawingElement
 * @extends ITransformable
 **/
interface IText extends IDrawingElement extends ITransformable {

    /**
     * @property align
     * @type String
     **/
    public var align:String;

    /**
     * @property valign
     * @type String
     **/
    public var valign:String;

    /**
     * @property bold
     * @type Bool
     **/
    public var bold:Bool;

    /**
     * @property color
     * @type Float
     **/
    public var color:Float;

    /**
     * @property font
     * @type String
     **/
    public var font:String;

    /**
     * @property italic
     * @type Bool
     **/
    public var italic:Bool;

    /**
     * @property size
     * @type Float
     **/
    public var size:Float;

    /**
     * @property underline
     * @type Bool
     **/
    public var underline:Bool;

    /**
     * @property label
     * @type String
     **/
    public var label:String;

    /**
     * @property isFixed
     * @type Bool
     **/
    public var isFixed:Bool;

    /**
     * @property autoResize
     * @type Bool
     **/
    public var autoResize:Bool;

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
}