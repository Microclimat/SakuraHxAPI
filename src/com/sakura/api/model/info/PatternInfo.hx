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

/**
* PatternInfo
* <br/>Les informations sur un Patron
* @author d.mouton
* @class PatternInfo
* @constructor
*/
import com.sakura.api.model.info.TemplateInfo.ITemplateInfo;
import com.sakura.api.model.constraint.IConstraint;
import com.sakura.api.model.info.AreaInfo.IAreaInfo;
import com.sakura.api.model.constraint.Constraint;
class PatternInfo implements IPatternInfo
{
    /**
	 * L'id du Patron
	 * @property id
	 * @type Float
	 */
    public var id:Float;
    /**
	 * Le nom du Patron
	 * @property name
	 * @type String
	 */
    public var name:String;
    /**
	 * La largeur en pixel du premier template
	 * @property templateWidth
	 * @type Int
	 */
    public var templateWidth:Float;
    /**
	 * La hauteur en pixel du premier template
	 * @property templateHeight
	 * @type Int
	 */
    public var templateHeight:Float;
    /**
	 * La liste des Zones du premier template
	 * @property areas
	 * @type Array<AreaInfo>
	 */
    public var areas:Array<IAreaInfo>;

    /**
	 * La liste des Templates
	 * @property templates
	 * @type Array<TemplateInfo>
	 */
    public var templates:Array<ITemplateInfo>;

    /**
	 * Si la patron a une preview 3D
	 * @property asPreview
	 * @type Bool
	 */
    public var asPreview:Bool=false;

    /**
	 * La liste des contraintes
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

interface IPatternInfo
{
/**
	 * L'id du Patron
	 * @property id
	 * @type Float
	 */
    public var id:Float;
/**
	 * Le nom du Patron
	 * @property name
	 * @type String
	 */
    public var name:String;
/**
	 * La largeur en pixel du premier template
	 * @property templateWidth
	 * @type Int
	 */
    public var templateWidth:Float;
/**
	 * La hauteur en pixel du premier template
	 * @property templateHeight
	 * @type Int
	 */
    public var templateHeight:Float;
/**
	 * La liste des Zones du premier template
	 * @property areas
	 * @type Array<AreaInfo>
	 */
    public var areas:Array<IAreaInfo>;

/**
	 * La liste des Templates
	 * @property templates
	 * @type Array<TemplateInfo>
	 */
    public var templates:Array<ITemplateInfo>;

    public var asPreview:Bool;

/**
	 * La liste des contraintes
	 * @property constraints
	 * @type Array<Constraint>
	 */
    public var constraints:Array<IConstraint>;

}
