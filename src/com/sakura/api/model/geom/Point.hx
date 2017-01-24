package com.sakura.api.model.geom;

/**
 * Represents a 2D point
 * @class Point
 * @author David Mouton
 * @constructor
 */
class Point {

	/**
	 * @property x
	 * @type {Float}
	 **/
	public var x:Float;

	/**
	 * @property y
	 * @type {Float}
	 **/
	public var y:Float;

	/**
	 * Constructor
	 * @param x {Float} the x position. Default : 0
	 * @param y {Float} the y position. Default : 0
	 **/
	public function new(x:Float = 0, y:Float = 0) {
		this.x = x;
		this.y = y;
	}
}