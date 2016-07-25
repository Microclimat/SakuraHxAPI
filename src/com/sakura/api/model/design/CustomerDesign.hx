package com.sakura.api.model.design;
import com.sakura.api.model.net.Host.Version;
class CustomerDesign extends Pattern {

    public var previewPicture:Picture;
    public var price:Float = 0.0;
    public var version:Version = '';


    public function new(id:Float = 0.0, name:String = "", description:String = "", enabled:Bool = true) {
        super(id,name,description,enabled);
    }
}
