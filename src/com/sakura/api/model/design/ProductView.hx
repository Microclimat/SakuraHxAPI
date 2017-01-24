package com.sakura.api.model.design;
import org.tamina.utils.UID;
import org.tamina.net.URL;

/**
 * @class ProductView
 * @extends IdentifiableObject
 * @constructor
 **/
class ProductView extends IdentifableObject {

    /**
     * @property url
     * @type URL
     **/
    public var url:URL;

    /**
     * @property backgroundUrl
     * @type String
     **/
    public var backgroundUrl:String;

    /**
     * @property foregroundUrl
     * @type String
     **/
    public var foregroundUrl:String;

    /**
     * @property foregroundAlpha
     * @type Float
     * @default 1.0
     **/
    public var foregroundAlpha:Float = 1.0;

    /**
     * @property modelUrl
     * @type String
     **/
    public var modelUrl:String;

    /**
     * @property modelBlendMode
     * @type String
     **/
    public var modelBlendMode:String;

    /**
     * @property modelAlpha
     * @type Float
     * @default 0.8
     **/
    public var modelAlpha:Float = 0.8;

    /**
     * @param id {Float} Default 0
     * @param name {String}
     * @param [url] {URL} (optional)
     **/
    public function new(id:Float = 0, name:String = "", ?url:URL) {
        this.url = url;
        super(id, name);
    }

    /**
     * Creates a clone of this, and returns it. If "copy" is true, the result will have the same id than the source.
     * @method clone
     * @param copy {Bool} if true, the returned ProductView will have the same id than the source
     * @return result {ProductView}
     **/
    public function clone(copy:Bool = false):ProductView {
        var cloneID:Float = UID.getUID();

        if (copy) {
            cloneID = this.id;
        }

        var result =new ProductView( cloneID, this.name, this.url );
        result.backgroundUrl = backgroundUrl;
        result.foregroundUrl = foregroundUrl;
        result.foregroundAlpha = foregroundAlpha;
        result.modelBlendMode = modelBlendMode;
        result.modelAlpha = modelAlpha;
        result.modelUrl = modelUrl;

        return result;
    }

}
