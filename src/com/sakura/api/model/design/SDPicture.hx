package com.sakura.api.model.design;
import org.tamina.net.URL;
import js.html.CanvasElement;

/**
 * @class SDPicture
 * @constructor
 * @author David Mouton
 */
class SDPicture 
{
	/**
	 * @property displayScale
	 * @type Float
	 * @default 1.0
	 **/
    public var displayScale:Float = 1.0;

	/**
	 * @property width
	 * @type Float
	 * @default 1
	 **/
    public var width:Float = 1;

	/**
	 * @property width
	 * @type Float
	 * @default 1
	 **/
    public var height:Float = 1;

	/**
	 * @property source
	 * @type CanvasElement
	 **/
    public var source:CanvasElement;

	/**
	 * @property url
	 * @type URL
	 **/
	public var url:URL;

	/**
	 * Constructor
	 * @param displayScale {Float}. Default : 1.0
	 * @param width {Float}. Default : 1.0
	 * @param height {Float}. Default : 1.0
	 * @param source {CanvasElement}. Default : null
	 **/
	public function new(displayScale:Float = 1.0, width:Float = 1.0, height:Float = 1.0, source:CanvasElement = null) {
		this.displayScale = displayScale;
        this.width = width;
        this.height = height;
        this.source = source;
	}

	/**
     * Returns a clone of this.
     * @method clone
     * @return clone {SDPicture}
     **/
	public function clone():SDPicture {
		var result:SDPicture = new SDPicture(this.displayScale, this.width, this.height, this.source);
		result.url = this.url;

		return result;
	}
}