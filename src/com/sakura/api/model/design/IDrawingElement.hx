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

/**
* Classe de base des élements Text et Picture
* @author d.mouton
* @class IDrawingElement
* @constructor
*/
interface IDrawingElement extends ITransformable
{
	/**
	 * L'id de l'element
	 * @property id
	 * @type Float
	 */
	var id:Float;
	
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
	 * Largeur en px
	 * @property width
	 * @type Float
	 */
	var width:Float;
	
	/**
	 * Hauteur en px
	 * @property height
	 * @type Float
	 */
	var height:Float;
	
	/**
	 * Rotation en radian
	 * @property rotate
	 * @type Float
	 */
	var rotate:Float;
	var parent:Area;
	var scaledWidth(get, null):Float;
	

	var scaledHeight(get, null):Float;
	
	function clone( copy:Bool = false ):IDrawingElement;

}