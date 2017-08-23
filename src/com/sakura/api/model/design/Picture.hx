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

import com.sakura.api.model.constraint.Constraint;
import com.sakura.api.model.design.Picture.IPicture;
import com.sakura.api.model.geom.Point;
import haxe.ExifData;
import haxe.MimeType;
import js.html.Blob;
import js.html.CanvasElement;
import org.tamina.net.URL;
import org.tamina.utils.UID;

/**
* Picture
* <br/>
* @namespace com.sakura.data.design
* @author d.mouton
* @class Picture
* @constructor
* @extends IDrawingElement
*/
@:expose class Picture implements IPicture {

    /**
     * @property SD_MAX_DRAWING_PIXELS
     * @type Float
     * @static
     * @readonly
     * @default 1000*1000
     **/
    inline public static var SD_MAX_DRAWING_PIXELS:Float = 1000 * 1000;

    /**
     * @property USE_SD_PICTURE
     * @type Bool
     * @static
     * @default true
     **/
    public static var USE_SD_PICTURE:Bool = false;

    /**
     * @property SD
     * @type SDPicture
     **/
    public var SD:SDPicture;

    /**
     * @property bottomLeftPoint
     * @type Point
     **/
    public var bottomLeftPoint:Point;

    /**
     * @property bottomRightPoint
     * @type Point
     **/
    public var bottomRightPoint:Point;

    /**
     * @property brightness
     * @type Float
     * @default 0
     **/
    public var brightness:Float = 0;

    /**
     * @property contrast
     * @type Float
     * @default 0
     **/
    public var contrast:Float = 0;

    /**
     * @property displayScale
     * @type Float
     * @default 1.0
     **/
    public var displayScale:Float = 1.0;

    /**
     * @property externalId
     * @type String
     * @default ""
     **/
    public var externalId:String = "";

    /**
     * @property externalProviderId
     * @type Int
     * @default 0
     **/
    public var externalProviderId:Int = 0;

    /**
     * @property filter
     * @type PictureFilter
     * @default PictureFilter.NONE
     **/
    public var filter:PictureFilter = PictureFilter.NONE;

    /**
     * @property hFlip
     * @type Bool
     * @default false
     **/
    public var hFlip:Bool = false;

    /**
     * @property height
     * @type Float
     * @default 1
     **/
    public var height:Float = 1;

    /**
     * @property id
     * @type Float
     **/
    public var id:Float;

    /**
     * @property name
     * @type String
     * @default ""
     **/
    public var name:String = "";

    /**
     * @property parent
     * @type Area
     **/
    public var parent:Area;

    /**
     * @property ref
     * @type IPicture
     **/
    public var ref:IPicture;

    /**
     * @property rotate
     * @type Float
     * @default 0
     **/
    public var rotate:Float = 0;

    /**
     * @property exif
     * @type ExifData
     **/
    public var exif:ExifData;

    /**
     * @property topLeftPoint
     * @type Point
     **/
    public var topLeftPoint:Point;

    /**
     * @property topRightPoint
     * @type Point
     **/
    public var topRightPoint:Point;

    /**
     * @property mimeType
     * @type MimeType
     **/
    public var mimeType:MimeType;

    /**
     * @property blob
     * @type Blob
     **/
    public var blob:Blob;

    /**
	 * Image url
	 * @property url
	 * @type URL
	 */
    public var url(get, set):URL;

    /**
     * @property previewUrl
     * @type URL
     **/
    public var previewUrl:URL;

    /**
     * @property vFlip
     * @type Bool
     * @default false
     **/
    public var vFlip:Bool = false;

    /**
     * @property width
     * @type Float
     * @default 1
     **/
    public var width:Float = 1;

    /**
     * @property x
     * @type Float
     * @default 0
     **/
    public var x:Float = 0;

    /**
	 * Picture's horizontal scale
	 * @property xScale
	 * @type Float
	 */
    public var xScale:Float = 1;

    /**
     * @property y
     * @type Float
     * @default 0
     **/
    public var y:Float = 0;

    /**
	 * Picture's vertical scale
	 * @property yScale
	 * @type Float
	 */
    public var yScale:Float = 1;

    /**
     * @property minRatio
     * @type Float
     * @default 0.0
     **/
    public var minRatio:Float = 0.0;

    /**
	 * Image's source
	 * @property source
	 * @type CanvasElement
	 */
    public var source(get, set):CanvasElement;

    /**
	 * Image quality after transformation
	 * @property quality
	 * @type PictureQuality
	 */
    public var quality:PictureQuality;

    /**
     * @property scaledWidth
     * @type Float
     * @readonly
     **/
    public var scaledWidth(get, null):Float;

    /**
     * @property scaledHeight
     * @type Float
     * @readonly
     **/
    public var scaledHeight(get, null):Float;

    /**
	 * Text's constraints
	 * @property constraints
	 * @type Array<Constraint>
	 */
    public var constraints:Array<Constraint>;

    private var _url:URL;
    private var _source:CanvasElement;


    /**
     * Constructor
     * @param source {CanvasElement} the image source
     * @param url {URL} the image url
     * @param ref {IPicture} the reference (another image)
     **/
    public function new(source:CanvasElement = null, url:URL = null, ref:IPicture = null) {
        this.source = source;
        this._url = url;
        this.id = UID.getUID();
        this.ref = ref;
        this.bottomLeftPoint = new Point( 0, 1 );
        this.bottomRightPoint = new Point( 1, 1 );
        this.topLeftPoint = new Point( 0, 0 );
        this.topRightPoint = new Point( 1, 0 );
        this.quality = PictureQuality.GOOD;
        this.constraints = new Array<Constraint>();
    }

    private function get_scaledWidth():Float {
        return Math.round(source.width * xScale * displayScale); }

    private function get_scaledHeight():Float { return Math.round(source.height * yScale * displayScale); }

    private function get_url():URL {
        var result:URL = _url;
        return result;
    }

    private function set_url(value) {
        return _url = value;
    }

    private function get_source():CanvasElement {
        return _source;
    }

    private function set_source(value:CanvasElement):CanvasElement {
        _source = value;
        if (_source != null && this.width == 0) {
            this.width = _source.width;
            this.height = _source.height;
        }
        return _source;
    }

    /**
     * Checks if target is a Picture
     * @method is
     * @param target {Dynamic}
     * @return result {Bool}
     **/
    public static function is(target:Dynamic):Bool {
        var result = false;

        if (target.contrast != null) {
            result = true;
        }
        return result;
    }

    /**
     * Returns a clone of this.
     * <br>If copy is true, the clone will have the same id than this
     * @method clone
     * @param copy {Bool}
     * @return clone {Picture}
     **/
    public function clone(copy:Bool = false):Picture {
        var cloneID = UID.getUID();
        var ref = this;

        if (copy) {
            cloneID = this.id;
            if (this.ref != null) {
                ref = cast this.ref;
            }
        }

        var result:Picture = new Picture(source, _url, ref);
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
        result.exif = this.exif;
        result.mimeType = this.mimeType;
        result.blob = this.blob;

        for(i in 0...constraints.length){
            result.constraints.push(constraints[i].clone());
        }

        if (this.SD != null) {
            result.SD = this.SD.clone();
        }

        return result;
    }

}

/**
 * Contains all needed informations for a Picture
 * @class IPicture
 **/
interface IPicture extends IDrawingElement {

    /**
     * @property brightness
     * @type Float
     **/
    public var brightness:Float;

    /**
     * @property contrast
     * @type Float
     **/
    public var contrast:Float;

    /**
     * @property displayScale
     * @type Float
     **/
    public var displayScale:Float;

    /**
     * @property filter
     * @type PictureFilter
     **/
    public var filter:PictureFilter;

    /**
     * @property hFlip
     * @type Bool
     **/
    public var hFlip:Bool;

    /**
     * @property height
     * @type Float
     **/
    public var height:Float;

    /**
     * @property rotate
     * @type Float
     **/
    public var rotate:Float;

    /**
     * @property url
     * @type URL
     **/
    public var url(get, set):URL;

    /**
     * @property previewUrl
     * @type URL
     **/
    public var previewUrl:URL;

    /**
     * @property vFlip
     * @type Bool
     **/
    public var vFlip:Bool;

    /**
     * @property xScale
     * @type Float
     **/
    public var xScale:Float;

    /**
     * @property yScale
     * @type Float
     **/
    public var yScale:Float;

    /**
     * @property exif
     * @type ExifData
     **/
    public var exif:ExifData;

    /**
     * @property source
     * @type CanvasElement
     **/
    public var source(get, set):CanvasElement;

    /**
     * @property scaledWidth
     * @type Float
     * @readonly
     **/
    public var scaledWidth(get, null):Float;

    /**
     * @property scaledHeight
     * @type Float
     * @readonly
     **/
    public var scaledHeight(get, null):Float;

    /**
     * @property name
     * @type String
     **/
    public var name:String;

    /**
     * @property externalId
     * @type String
     **/
    public var externalId:String;

    /**
     * @property externalProviderId
     * @type Int
     **/
    public var externalProviderId:Int;

    /**
     * @property mimeType
     * @type MimeType
     **/
    public var mimeType:MimeType;

    /**
     * @property blob
     * @type Blob
     **/
    public var blob:Blob;

    /**
     * @property quality
     * @type PictureQuality
     **/
    public var quality:PictureQuality;

    /**
     * @property ref
     * @type IPicture
     **/
    public var ref:IPicture;

}
