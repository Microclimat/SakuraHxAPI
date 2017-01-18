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

import com.sakura.api.model.info.TemplateInfo.ITemplateInfo;
import com.sakura.api.model.constraint.IConstraint;
import com.sakura.api.model.info.AreaInfo.IAreaInfo;
import com.sakura.api.model.constraint.Constraint;

/**
* PatternInfo
* <br/>Pattern's informations
* @author d.mouton
* @class PatternInfo
* @constructor
*/
class PatternInfo implements IPatternInfo
{
    /**
	 * Pattern id
	 * @property id
	 * @type Float
	 */
    public var id:Float;

    /**
	 * Pattern name
	 * @property name
	 * @type String
	 */
    public var name:String;

    /**
	 * First template's width (in pixels)
	 * @property templateWidth
	 * @type Int
	 */
    public var templateWidth:Float;

    /**
	 * First template's height (in pixels)
	 * @property templateHeight
	 * @type Int
	 */
    public var templateHeight:Float;
    /**
	 * First template's area list
	 * @property areas
	 * @type Array<AreaInfo>
	 */
    public var areas:Array<IAreaInfo>;

    /**
	 * Templates list
	 * @property templates
	 * @type Array<TemplateInfo>
	 */
    public var templates:Array<ITemplateInfo>;

    /**
	 * If the pattern as a 3D preview
	 * @property asPreview
	 * @type Bool
	 */
    public var asPreview:Bool=false;

    /**
	 * Constraints list
	 * @property constraints
	 * @type Array<Constraint>
	 */
    public var constraints:Array<IConstraint>;

    public function new( ) {
        areas = new Array<IAreaInfo>();
        templates = new Array<ITemplateInfo>();
        constraints = new Array<IConstraint>();
    }
}

/**
 * @class IPatternInfo
 **/
interface IPatternInfo
{
    /**
	 * Pattern id
	 * @property id
	 * @type Float
	 */
    public var id:Float;

    /**
	 * Pattern name
	 * @property name
	 * @type String
	 */
    public var name:String;

    /**
	 * First template's width (in pixels)
	 * @property templateWidth
	 * @type Int
	 */
    public var templateWidth:Float;

    /**
	 * First template's height (in pixels)
	 * @property templateHeight
	 * @type Int
	 */
    public var templateHeight:Float;

    /**
	 * First template's areas list
	 * @property areas
	 * @type Array<AreaInfo>
	 */
    public var areas:Array<IAreaInfo>;

    /**
	 * Templates list
	 * @property templates
	 * @type Array<TemplateInfo>
	 */
    public var templates:Array<ITemplateInfo>;

    /**
	 * If the pattern as a 3D preview
	 * @property asPreview
	 * @type Bool
	 */
    public var asPreview:Bool;

    /**
	 * Constraints list
	 * @property constraints
	 * @type Array<Constraint>
	 */
    public var constraints:Array<IConstraint>;
}
