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
* AreaInfo
* <br/>Les informations sur une zone
* @author d.mouton
* @class AreaInfo
* @constructor
*/
import com.sakura.api.model.constraint.IConstraint;
import com.sakura.api.model.geom.Rectangle;

class AreaInfo implements IAreaInfo{
    /**
	 * La hauteur en pixel
	 * @property height
	 * @type Int
	 */
    public var height:Float;
    /**
	 * L'id de la zone
	 * @property id
	 * @type Float
	 */
    public var id:Float;
    /**
	 * Le nom de la zone
	 * @property name
	 * @type String
	 */
    public var name:String = "";
    /**
	 * La largeur en pixel
	 * @property width
	 * @type Int
	 */
    public var width:Float;

/**
	 * Position en X
	 * @property x
	 * @type Float
	 */
    public var x:Float;

/**
	 * Position en y
	 * @property y
	 * @type Float
	 */
    public var y:Float;

    /**
	 * La liste des contraintes
	 * @property constraints
	 * @type Array<Constraint>
	 */
    public var constraints:Array<IConstraint>;

/**
	 * Returns a rectangle representing this object's bounds in its local coordinate system
	 * @property boundingBox
	 * @type Rectangle
	 */
    public var boundingBox:Rectangle;

    /**
	 * Le nombre d'element
	 * @property numElements
	 * @type Int
	 */
    public var numElements:Int;

    public function new( ) {
        constraints = new Array<IConstraint>();
        numElements = 0;
    }
}

/**
* AreaInfo
* <br/>Les informations sur une zone
* @author d.mouton
* @class AreaInfo
* @constructor
*/
interface IAreaInfo {
/**
	 * La hauteur en pixel
	 * @property height
	 * @type Int
	 */
    public var height:Float;
/**
	 * L'id de la zone
	 * @property id
	 * @type Float
	 */
    public var id:Float;
/**
	 * Le nom de la zone
	 * @property name
	 * @type String
	 */
    public var name:String = "";
/**
	 * La largeur en pixel
	 * @property width
	 * @type Int
	 */
    public var width:Float;

/**
	 * Position en X
	 * @property x
	 * @type Float
	 */
    var x:Float;

/**
	 * Position en y
	 * @property y
	 * @type Float
	 */
    var y:Float;

/**
	 * La liste des contraintes
	 * @property constraints
	 * @type Array<Constraint>
	 */
    var constraints:Array<IConstraint>;

/**
	 * Returns a rectangle representing this object's bounds in its local coordinate system
	 * @property boundingBox
	 * @type Rectangle
	 */
    public var boundingBox:Rectangle;

    /**
	 * Le nombre d'element
	 * @property numElements
	 * @type Int
	 */
    public var numElements:Int;

}
