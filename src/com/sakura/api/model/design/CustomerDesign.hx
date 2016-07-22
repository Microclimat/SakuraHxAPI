package com.sakura.api.model.design;
class CustomerDesign extends Pattern {

    public var previewPicture:Picture;
    public var price:Float = 0;
    public var version:String="";


    public function new(id:Float = 0, name:String = "", description:String = "", enabled:Bool = true) {
        super(id,name,description,enabled);
    }
}
