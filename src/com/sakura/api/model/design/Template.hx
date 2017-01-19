package com.sakura.api.model.design;
import com.sakura.api.model.info.TemplateInfo;
import com.sakura.api.model.constraint.Constraint;
import org.tamina.utils.UID;

/**
 * A Template belongs to a Pattern and contains Areas (containing themselves Texts and Images)
 * @class Template
 * @constructor
 **/
class Template implements IConstricted {

    /**
     * @property backgroundPicture
     * @type {Picture}
     **/
    public var backgroundPicture:Picture;

    /**
     * @property foregroundPicture
     * @type {Picture}
     **/
    public var foregroundPicture:Picture;

    /**
     * @property backgroundPreviewPicture
     * @type {Picture}
     **/
    public var backgroundPreviewPicture:Picture;

    /**
     * @property foregroundPreviewPicture
     * @type {Picture}
     **/
    public var foregroundPreviewPicture:Picture;

    /**
     * @property patternBackgroundPicture
     * @type {Picture}
     **/
    public var patternBackgroundPicture:Picture;

    /**
     * @property patternForegroundPicture
     * @type {Picture}
     **/
    public var patternForegroundPicture:Picture;

    /**
     * @property patternMaskPicture
     * @type {Picture}
     **/
    public var patternMaskPicture:Picture;

    /**
     * @property percentX
     * @type {Float}
     * @default 0
     **/
    public var percentX:Float = 0;

    /**
     * @property percentY
     * @type {Float}
     * @default 0
     **/
    public var percentY:Float = 0;

    /**
     * @property root
     * @type {Pattern}
     **/
    public var root:Pattern;

    /**
     * @property scale
     * @type {Float}
     * @default 1
     **/
    public var scale:Float = 1;

    /**
     * @property constraints
     * @type {Array<Constraint>}
     **/
    public var constraints:Array<Constraint>;

    /**
     * @property content
     * @type {Array<Area>}
     **/
    public var content:Array<Area>;

    /**
     * @property height
     * @type {Float}
     **/
    public var height:Float;

    /**
     * @property id
     * @type {Float}
     **/
    public var id:Float;

    /**
     * @property name
     * @type {String}
     * @default ""
     **/
    public var name:String = "";

    /**
     * @property rotate
     * @type {Float}
     * @default 0
     **/
    public var rotate:Float = 0;

    /**
     * @property width
     * @type {Float}
     **/
    public var width:Float;

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
     * @property scaledWidth
     * @type {Float}
     * @readonly
     **/
    public var scaledWidth(get, null):Float;

    /**
     * @property scaledHeight
     * @type {Float}
     * @readonly
     **/
    public var scaledHeight(get, null):Float;

    /**
     * Constructor
     * @param id {Float}. Default : 0
     * @param x {Float}. Default : 0
     * @param y {Float}. Default : 0
     * @param width {Float}. Default : 5
     * @param height {Float}. Default : 5
     * @param name {String}. Default : ""
     **/
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

    /**
     * Fuse two templates by merging their areas (index to index)
     * @method merge
     * @param source {Template}
     **/
    public function merge(source:Template):Void {
        if (source != null) {
            for (i in 0...this.content.length) {
                if (i < source.content.length) {
                    this.content[ i ].merge(source.content[ i ]);
                }
            }
        }
    }

    /**
     * Returns a clone of this template. If copy is true, the clone will have the same id than this
     * @method clone
     * @param copy {Bool}. Default : false
     * @return clone {Template}
     **/
    public function clone(copy:Bool = false):Template {
        var result:Template = new Template( );
        result.id = this.id;
        result.name = this.name;
        result.x = this.x;
        result.y = this.y;
        result.width = this.width;
        result.height = this.height;
        result.rotate = this.rotate;
        result.scale = this.scale;
        result.percentX = this.percentX;
        result.percentY = this.percentY;

        for (constraint in this.constraints) {
            result.constraints.push(constraint.clone(copy));
        }

        result.patternBackgroundPicture = this.patternBackgroundPicture.clone(copy);

        if (this.patternForegroundPicture != null) {
            result.patternForegroundPicture = this.patternForegroundPicture.clone(copy);
        }

        if (this.patternMaskPicture != null) {
            result.patternMaskPicture = this.patternMaskPicture.clone(copy);
        }

        if (this.backgroundPicture != null) {
            result.backgroundPicture = this.backgroundPicture.clone(copy);
        }

        if (this.foregroundPicture != null) {
            result.foregroundPicture = this.foregroundPicture.clone(copy);
        }

        if (this.backgroundPreviewPicture != null) {
            result.backgroundPreviewPicture = this.backgroundPreviewPicture.clone(copy);
        }

        if (this.foregroundPreviewPicture != null) {
            result.foregroundPreviewPicture = this.foregroundPreviewPicture.clone(copy);
        }

        for (area in this.content) {
            var clonedArea:Area = cast area.clone(true);

            clonedArea.parent = this;
            result.content.push(clonedArea);
        }

        return result;
    }

    /**
     * Generates a {TemplateInfo} from current template data
     * @method toInfo
     * @return info {TemplateInfo}
     **/
    public function toInfo():TemplateInfo{
        var result = new TemplateInfo();
        result.id = id;
        result.name = name;
        result.height = height;
        result.width = width;
        result.x = x;
        result.y = y;

        for (constraint in this.constraints) {
            result.constraints.push(constraint.clone());
        }

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
