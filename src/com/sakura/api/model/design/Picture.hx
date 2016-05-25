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

import js.html.Blob;
import haxe.MimeType;
import js.html.CanvasElement;
import js.html.Image;
import org.tamina.net.URL;
import com.sakura.api.model.geom.Point;
import org.tamina.utils.UID;

/**
* Picture
* <br/>namespace com.sakura.data.design
* @author d.mouton
* @class Picture
* @constructor
* @extends IDrawingElement
*/
@:expose class Picture implements IPicture
{

    inline public static var SD_MAX_DRAWING_PIXELS:Float = 1000 * 1000;
    public static var USE_SD_PICTURE:Bool = true;

	public var SD:SDPicture;

	public var bottomLeftPoint:Point;
	public var bottomRightPoint:Point;

	public var brightness:Float = 0;

	public var contrast:Float = 0;

	public var displayScale:Float = 1.0;
	public var externalId:String = "";
	public var externalProviderId:Int = 0;

	public var filter:PictureFilter = PictureFilter.NONE;
	public var hFlip:Bool = false;

	public var height:Float = 1;

	public var id:Float;
	public var name:String = "";
	public var parent:Area;

	public var ref:Picture;
	public var rotate:Float = 0;


	public var topLeftPoint:Point;
	public var topRightPoint:Point;
	
	public var mimeType:MimeType;
    public var blob:Blob;

	/**
	 * URL de l'image
	 * @property url
	 * @type String
	 */
	public var url(get, set):URL;
	public var previewUrl:URL;
	public var vFlip:Bool = false;
	public var width:Float = 1;
	public var x:Float = 0;

    /**
	 * Scale horizontale de l'image
	 * @property xScale
	 * @type Float
	 */
	public var xScale:Float = 1;
	public var y:Float = 0;

    /**
	 * Scale verticale de l'image
	 * @property yScale
	 * @type Float
	 */
	public var yScale:Float = 1;
    public var minRatio:Float = 0.0;

    private var _source:CanvasElement;
	
	/**
	 * Source de l'image
	 * @property source
	 * @type Image
	 */
    public var source(get, set):CanvasElement;

    /**
	 * Qualité de l'image apres transformation
	 * @property quality
	 * @type PictureQuality
	 */
    public var quality:PictureQuality;


	public var scaledWidth(get, null):Float;
	public var scaledHeight(get, null):Float;
	
	private var _url:URL;
	
	public function new( source:CanvasElement = null, url:URL = null, ref:Picture = null )
	{
		this.source = source;
		this._url = url;
		this.id = UID.getUID();
		this.ref = ref;
		this.bottomLeftPoint = new Point( 0, 1 );
		this.bottomRightPoint = new Point( 1, 1 );
		this.topLeftPoint = new Point( 0, 0 );
		this.topRightPoint = new Point( 1, 0 );
        this.quality = PictureQuality.GOOD;
	}
	
	private function get_scaledWidth():Float	{
        return Math.round( source.width * xScale * displayScale); }
	private function get_scaledHeight():Float	{ return Math.round( source.height * yScale * displayScale); }
	
	private function get_url():URL
	{
		var result:URL = _url;
		return result;
	}

	private function set_url( value )
	{
		return _url = value;
	}

    private function get_source():CanvasElement
    {
        return _source;
    }

    private function set_source( value:CanvasElement ):CanvasElement
    {
        _source = value;
        if(_source != null && this.width == 0){
            this.width = _source.width;
            this.height = _source.height;
        }
        return _source;
    }

	public static function is(target:Dynamic):Bool{
		var result = false;
		if(target.contrast != null){
			result = true;
		}
		return result;
	}
	
	public function clone( copy:Bool = false ):Picture {
		var cloneID = UID.getUID();
		if ( copy )
		{
			cloneID = this.id;
		}
		var result:Picture = new Picture( source, _url, this );
		result.id = cloneID;
		result.bottomLeftPoint = this.bottomLeftPoint;
		result.bottomRightPoint = this.bottomRightPoint;
		result.brightness = this.brightness;
		result.contrast = this.contrast;
		result.filter = this.filter;
		result.hFlip = this.hFlip;
		result.previewUrl = this.previewUrl;
		result.height = this.height;
		result.name = this.name;
		result.parent = this.parent;
		result.rotate = this.rotate;
		result.topLeftPoint = this.topLeftPoint;
		result.topRightPoint = this.topRightPoint;
		result.vFlip = this.vFlip;
		result.width = this.width;
		result.x = this.x;
		result.xScale = this.xScale;
		result.y = this.y;
		result.yScale = this.yScale;
		result.externalId = this.externalId;
		result.externalProviderId = this.externalProviderId;
		result.displayScale = this.displayScale;
		if ( this.SD != null )
		{
			result.SD = this.SD.clone();
		}
		return result;
	}
	
}

interface IPicture extends IDrawingElement {

    public var brightness:Float;
    public var contrast:Float;
    public var displayScale:Float;
    public var filter:PictureFilter;
    public var hFlip:Bool;
    public var height:Float;
    public var rotate:Float;
    public var url(get, set):URL;
	public var previewUrl:URL;
    public var vFlip:Bool;
    public var xScale:Float;
    public var yScale:Float;

    public var source(get, set):CanvasElement;
    public var scaledWidth(get, null):Float;
    public var scaledHeight(get, null):Float;
    public var name:String;
    public var externalId:String;
    public var externalProviderId:Int;
	public var mimeType:MimeType;
	public var blob:Blob;
    public var quality:PictureQuality;

}
