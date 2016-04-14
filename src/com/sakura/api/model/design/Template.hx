package com.sakura.api.model.design;
import com.sakura.api.model.info.TemplateInfo;
import com.sakura.api.model.constraint.Constraint;
import org.tamina.utils.UID;
class Template {


    public var backgroundPicture:Picture;
    public var foregroundPicture:Picture;
    public var backgroundPreviewPicture:Picture;
    public var foregroundPreviewPicture:Picture;

    public var patternBackgroundPicture:Picture;
    public var patternForegroundPicture:Picture;
    public var patternMaskPicture:Picture;
    public var percentX:Float = 0;
    public var percentY:Float = 0;
    public var root:Pattern;
    public var scale:Float = 1;

    public var constraints:Array<Constraint>;
    public var content:Array<Area>;
    public var height:Float;
    public var id:Float;
    public var name:String = "";
    public var rotate:Float = 0;
    public var width:Float;
    public var x:Float;
    public var y:Float;
    public var scaledWidth(get, null):Float;
    public var scaledHeight(get, null):Float;

    public function new(id:Float = 0, x:Float = 0, y:Float = 0, width:Float = 5, height:Float = 5, name:String = "") {
        if (id != 0) {
            this.id = id;
        }
        else {
            this.id = UID.getUID();
        }
        this.x = x;
        this.y = y;
        this.width = width;
        this.height = height;
        this.content = new Array<Area>();
        this.name = name;
        this.constraints = new Array<Constraint>();
    }

    private function get_scaledWidth():Float { return width; }

    private function get_scaledHeight():Float { return height; }

    public function merge(source:Template):Void {
        if (source != null) {
            for (i in 0...this.content.length) {
                if (i < source.content.length) {
                    this.content[ i ].merge(source.content[ i ]);
                }
            }
        }
    }

    public function toInfo():TemplateInfo{
        var result = new TemplateInfo();
        result.id = id;
        result.name = name;
        result.height = height;
        result.width = width;
        result.backgroundUrl = this.patternBackgroundPicture.url.path;
        if(this.patternForegroundPicture != null){
            result.foregroundUrl = this.patternForegroundPicture.url.path;
        }
        if(this.patternMaskPicture != null){
            result.maskUrl = this.patternMaskPicture.url.path;
        }
        if(this.backgroundPicture != null){
            result.templateBackgroundUrl = this.backgroundPicture.url.path;
        }
        if(this.foregroundPicture != null){
            result.templateForegroundUrl = this.foregroundPicture.url.path;
        }
        if(this.backgroundPreviewPicture != null){
            result.templatePreviewBackgroundUrl = this.backgroundPreviewPicture.url.path;
        }
        if(this.foregroundPreviewPicture != null){
            result.templatePreviewForegroundUrl = this.foregroundPreviewPicture.url.path;
        }
        for(i in 0...content.length){
            result.areas.push( content[i].toInfo());
        }
        return result;
    }
}
