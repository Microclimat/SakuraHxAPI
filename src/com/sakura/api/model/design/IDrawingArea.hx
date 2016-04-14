package com.sakura.api.model.design;

/**
 * ...
 * @author David Mouton
 */

interface IDrawingArea extends IDrawingElement
{

	var name:String;
	var content:Array<IDrawingElement>;
	
}