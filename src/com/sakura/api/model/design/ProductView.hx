package com.sakura.api.model.design;
import org.tamina.utils.UID;
import org.tamina.net.URL;
class ProductView extends IdentifableObject {
    public var url:URL;
    public var backgroundUrl:String;
    public var foregroundUrl:String;
    public var foregroundAlpha:Float = 1.0;
    public var modelUrl:String;
    public var modelBlendMode:String;
    public var modelAlpha:Float=0.8;

    public function new(id:Float = 0, name:String = "", ?url:URL) {
        this.url = url;
        super(id, name);
    }

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
