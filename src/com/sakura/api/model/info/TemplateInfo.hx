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
package com.sakura.api.model.info;

import com.sakura.api.model.constraint.IConstraint;
import com.sakura.api.model.info.AreaInfo.IAreaInfo;
import com.sakura.api.model.geom.Rectangle;

/**
* TemplateInfo
* <br/>Template's informations
* @author d.mouton
* @class TemplateInfo
* @constructor
*/
class TemplateInfo implements ITemplateInfo {

    /**
	 * Height in pixels
	 * @property height
	 * @type Float
	 */
    public var height:Float;

    /**
	 * The id
	 * @property id
	 * @type Float
	 */
    public var id:Float;

    /**
	 * The name
	 * @property name
	 * @type String
	 * @default ""
	 */
    public var name:String = "";

    /**
	 * Width in pixels
	 * @property width
	 * @type Int
	 */
    public var width:Float;

    /**
	 * X axis position
	 * @property x
	 * @type Float
	 */
    public var x:Float;

    /**
	 * Y axis position
	 * @property y
	 * @type Float
	 */
    public var y:Float;

    /**
	 * Constraints list
	 * @property constraints
	 * @type Array<IConstraint>
	 */
    public var constraints:Array<IConstraint>;

    /**
	 * Areas list
	 * @property areas
	 * @type Array<IAreaInfo>
	 */
    public var areas:Array<IAreaInfo>;

    /**
	 * Background image's url
	 * @property backgroundUrl
	 * @type String
	 */
    public var backgroundUrl:String;

    /**
	 * Foreground image's url
	 * @property foregroundUrl
	 * @type String
	 */
    public var foregroundUrl:String;

    /**
	 * Mask image's url
	 * @property maskUrl
	 * @type String
	 */
    public var maskUrl:String;

    /**
	 * Printable background image's url
	 * @property templateBackgroundUrl
	 * @type String
	 */
    public var templateBackgroundUrl:String;

    /**
	 * Printable foreground image's url
	 * @property templateForegroundUrl
	 * @type String
	 */
    public var templateForegroundUrl:String;

    /**
	 * Printable background preview's url
	 * @property templatePreviewBackgroundUrl
	 * @type String
	 */
    public var templatePreviewBackgroundUrl:String;

    /**
	 * Printable foreground preview's url
	 * @property templatePreviewForegroundUrl
	 * @type String
	 */
    public var templatePreviewForegroundUrl:String;

    /**
	 * Returns a rectangle representing this object's bounds in its local coordinate system
	 * @property boundingBox
	 * @type Rectangle
	 */
    public var boundingBox:Rectangle;

    /**
     * Constructor
     * Inits arrays
     **/
    public function new( ) {
        constraints = new Array<IConstraint>();
        areas = new Array<IAreaInfo>();
    }
}

/**
 * ITemplateInfo
 * <br/>Interface used to define template's needed infos
 * @author d.mouton
 * @class ITemplateInfo
 */
interface ITemplateInfo {

    /**
	 * Height in pixels
	 * @property height
	 * @type Float
	 */
    public var height:Float;

    /**
	 * The id
	 * @property id
	 * @type Float
	 */
    public var id:Float;

    /**
	 * The name
	 * @property name
	 * @type String
	 * @default ""
	 */
    public var name:String = "";

    /**
	 * Width in pixels
	 * @property width
	 * @type Int
	 */
    public var width:Float;

    /**
	 * X axis position
	 * @property x
	 * @type Float
	 */
    public var x:Float;

    /**
	 * Y axis position
	 * @property y
	 * @type Float
	 */
    public var y:Float;

    /**
	 * Constraints list
	 * @property constraints
	 * @type Array<IConstraint>
	 */
    public var constraints:Array<IConstraint>;

    /**
	 * Areas list
	 * @property areas
	 * @type Array<IAreaInfo>
	 */
    public var areas:Array<IAreaInfo>;

    /**
	 * Background image's url
	 * @property backgroundUrl
	 * @type String
	 */
    public var backgroundUrl:String;

    /**
	 * Foreground image's url
	 * @property foregroundUrl
	 * @type String
	 */
    public var foregroundUrl:String;

    /**
	 * Mask image's url
	 * @property maskUrl
	 * @type String
	 */
    public var maskUrl:String;

    /**
	 * Printable background image's url
	 * @property templateBackgroundUrl
	 * @type String
	 */
    public var templateBackgroundUrl:String;

    /**
	 * Printable foreground image's url
	 * @property templateForegroundUrl
	 * @type String
	 */
    public var templateForegroundUrl:String;

    /**
	 * Printable background preview's url
	 * @property templatePreviewBackgroundUrl
	 * @type String
	 */
    public var templatePreviewBackgroundUrl:String;

    /**
	 * Printable foreground preview's url
	 * @property templatePreviewForegroundUrl
	 * @type String
	 */
    public var templatePreviewForegroundUrl:String;

    /**
	 * Returns a rectangle representing this object's bounds in its local coordinate system
	 * @property boundingBox
	 * @type Rectangle
	 */
    public var boundingBox:Rectangle;

}
