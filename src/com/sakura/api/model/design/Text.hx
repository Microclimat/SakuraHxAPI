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
* Texte
* <br/>namespace com.sakura.data.design
* @author d.mouton
* @class Text
* @constructor
* @extends IDrawingElement
*/
@:expose class Text implements IText {

	/**
	 * The horizontal text alignment. Any of "start", "end", "left", "right", and "center".
	 * @property align
	 * @type String
	 */
    public var align:String = "";
	
	/**
	 * Si le texte est en gras
	 * @property bold
	 * @type Bool
	 * @default false
	 */
    public var bold:Bool = false;
	
	/**
	 * La couleur du texte
	 * @property color
	 * @type Float
	 * @example color = 16711680; // float value for #FF0000.
	 */
    public var color:Float=0;

	/**
	 * La font à utiliser
	 * @property font
	 * @type String
	 * @example font= 'Arial';
	 */
    public var font:String="";

    public var height:Float=0;

    public var id:Float = 0;
	
	/**
	 * Si le texte est en italic
	 * @property italic
	 * @type Bool
	 * @default false
	 */
    public var italic:Bool = false;
	
	/**
	 * Le texte à afficher
	 * @property label
	 * @type String
	 */
    public var label:String="";
    public var parent:Area;
    public var rotate:Float=0;

	/**
	 * La taille du texte en px
	 * @property size
	 * @type Int
	 */
    public var size:Int = 0;
	
	/**
	 * Si le texte est souligné
	 * @property underline
	 * @type Bool
	 * @default false
	 */
    public var underline:Bool=false;
    public var width:Float=0;
    public var x:Float=0;
    public var y:Float=0;

    public var scaledWidth(get, null):Float;
    public var scaledHeight(get, null):Float;

    public function new(label:String = "", align:String = "", bold:Bool = false, color:Float = 0, font:String = "Arial", italic:Bool = false, underline:Bool = false, size:Int = 12) {
        this.label = label;
        this.align = align;
        this.bold = bold;
        this.color = color;
        this.font = font;
        this.italic = italic;
        this.underline = underline;
        this.size = size;
        this.id = UID.getUID();
    }

    public static function fromIText(source:IText):Text {
        var result = new Text();
        var result:Text = new Text();
        result.align = source.align;
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
        return result;
    }


    public function clone(copy:Bool = false):Text {
        var cloneID = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result:Text = new Text();
        result.align = align;
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
        return result;
    }

    public static function is(target:Dynamic):Bool{
        var result = false;
        if(target.label != null){
            result = true;
        }
        return result;
    }

    private function get_scaledWidth():Float { return width; }

    private function get_scaledHeight():Float { return height; }

}

interface IText extends IDrawingElement extends ITransformable {
    public var align:String;
    public var bold:Bool;
    public var color:Float;
    public var font:String;
    public var italic:Bool;
    public var size:Int;
    public var underline:Bool;
    public var label:String;

    public var scaledWidth(get, null):Float;
    public var scaledHeight(get, null):Float;
}