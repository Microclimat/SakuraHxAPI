package com.sakura.api.editor;

import com.sakura.api.model.constraint.Constraint;
import com.sakura.api.model.constraint.IConstraintGroupValidationResult;
import com.sakura.api.model.design.Area;
import com.sakura.api.model.design.ConstrictedType;
import com.sakura.api.model.design.ElementType;
import com.sakura.api.model.design.ExternalImageProvider;
import com.sakura.api.model.design.IArea;
import com.sakura.api.model.design.MergeOptions;
import com.sakura.api.model.design.Pattern;
import com.sakura.api.model.design.Picture.IPicture;
import com.sakura.api.model.design.Picture;
import com.sakura.api.model.design.PictureFilter;
import com.sakura.api.model.design.Template;
import com.sakura.api.model.design.Text.IText;
import com.sakura.api.model.event.SakuraEventType;
import com.sakura.api.model.geom.Rectangle;
import com.sakura.api.model.info.PatternInfo.IPatternInfo;
import com.sakura.api.model.io.AddImageOptions;
import com.sakura.api.model.net.ServiceError;
import com.sakura.api.model.transform.Transform.ITransform;
import haxe.MimeType;
import js.html.Blob;
import js.html.CanvasElement;
import js.html.Image;
import msignal.Signal.Signal0;
import msignal.Signal.Signal2;
import org.tamina.events.Event;
import org.tamina.log.LogLevel;
import org.tamina.net.URL;

@:native("SakuraEditor")
extern class SakuraEditor {
    static function getInstance():SakuraEditor;

    public function addEventListener(type:String, listener:SakuraEvent -> Void, ?useCapture:Bool):Void;
    public function init(options:InitOptions):Void;
    public function resizeTo(contentWidth:Int, contentHeight:Int):Void;
    public function registerPlugin(plugin:Dynamic):Void;
    public function getConfig():Config;
    public function setLogLevel(level:LogLevel):Void;
    public function getConstraintManager():ConstraintManager;
    public function removeEventListener(type:SakuraEventType, listener:Event<SakuraEventType> -> Void):Void ;
    public function removeAllEventListeners(type:SakuraEventType):Void;
    public function updateVisualPlugins():Void;
    public function getLoadManager():LoadManager;
    public function getUploadManager():UploadManager;

    public var area(default, null):AreaAPI;
    public var element(default, null):ElementAPI;
    public var pattern(default, null):PatternAPI;
    public var template(default, null):TemplateAPI;
}

typedef AreaAPI = {
    public function add(area:IArea, ?targetTemplateId:Float):Void;
    public function remove(area:IArea, ?targetTemplateId:Float):Void;
    public function updateOverlay(areaId:Float, areaGuide:CanvasElement, ?alignRules:Int):Void ;
    public function hideOverlay(areaId:Float):Void;
    public function update(area:IArea):Void;
    public function get(areaId:Float):Area ;
    public function getHoveredArea(canContainsImages:Bool, ?canContainsText:Bool):Area ;
}

typedef ElementAPI = {
    public function applyFilter(targetPictureId:Float, filter:PictureFilter, ?value:Float):Void;
    public function remove(elementId:Float):Void;
    public function transform(elementId:Float, value:ITransform):Void;
    public function select(elementId:Float):Void;
    public function moveTo(elementId:Float, posX:Float, posY:Float):Void;
    public function rotateBy(elementId:Float, angle:Float):Void;
    public function scaleBy(elementId:Float, scaleX:Float, scaleY:Float):Void;
    public function scaleTo(elementId:Float, scaleX:Float, scaleY:Float):Void;
    public function addImageFromURL(url:String, ?targetAreaId:Float, ?options:AddImageOptions):Picture;
    public function addExternalImageFromURL(thumbUrl:String, pictureId:String, providerId:ExternalImageProvider, ?targetAreaId:Float, ?options:AddImageOptions):Picture;
    public function addImage(img:Image, ?targetAreaId:Float, ?options:AddImageOptions):Picture;
    public function addBlob(canvas:CanvasElement, mimeType:MimeType, source:Blob, ?targetAreaId:Float, ?options:AddImageOptions):Picture;
    public function addPicture(sourcePicture:Picture, ?targetAreaId:Float, ?options:AddImageOptions, ?clonePicture:Bool):Picture;
    public function addText(label:String, ?align:String, ?bold:Bool, ?color:String, ?font:String, ?italic:Bool, ?underline:Bool, ?size:Float, ?valign:String, ?targetAreaId:Float):IText;
    public function addIText(value:IText, ?targetAreaId:Float):IText;
    public function updateText(elementId:Float, label:String, ?align:String, ?bold:Bool, ?color:String, ?font:String, ?italic:Bool, ?underline:Bool, ?size:Float, ?valign:String):Void;
    public function updateIText(value:IText):Void;
    public function updatePictureRef(pictureId:Float, ref:IPicture):Void;
}

typedef PatternAPI = {
    public function mergeTo(pPattern:Pattern, targetPatternId:Int):Void;
    public function get():Pattern;
    public function display(patternId:Int, ?save:Bool, ?merge:Bool, ?mergeOptions:MergeOptions):Void;
    public function getCustomerDesignById(designId:Int):Void;
    public function displayCustomerDesignByHash(hash:String):Void;
    public function addCustomerDesign(?previewArea:Rectangle, ?size:Int):Void;
}

typedef TemplateAPI = {
    public function displayByIndex(index:Int):IPatternInfo;
    public function changeCurrentTemplateAreas(areas:Array<Area>):IPatternInfo;
    public function add(template:Template, ?index:Int):Void;
    public function duplicate(sourceTemplateIndex:Int):Template;
    public function remove(templateId:Float):Void;
    public function addTemplateBackground(backgroundUrl:String):Void;
}

typedef LoadManager = {
    public function load(url:URL, ?targetAreaId:Float, loadCompleteHandler:Picture -> Null<Float> -> Void):Picture;
    public function abortAll():Void;
}

typedef UploadManager = {
    var errorSignal:Signal2<Float, ServiceError>;
    var uploadStartedSignal:Signal0;
    var allUploadCompleteSignal:Signal0;

    public function upload(target:Picture):Void;
    public function poolSize():Int;
    public function abortAll():Void;
    public function waitForUpload(pictureId:Float, callback:haxe.Constraints.Function):Void;
}

typedef Config = {
    var skin:Skin;
    var defaultText:String;
}

typedef ConstraintManager = {
    public function canAddPicture(?ignoreContent:Bool):Bool;
    public function canAddText(?ignoreContent:Bool):Bool;
    public function canAddPictureToTemplate(templateIndex:Int, ?ignoreContent:Bool):Bool;
    public function canAddTextToTemplate(templateIndex:Int, ?ignoreContent:Bool):Bool;
    public function canAddPictureToArea(target:IArea, ?ignoreContent:Bool):Bool;
    public function canAddTextToArea(target:IArea, ?ignoreContent:Bool):Bool;

    public function getAddImageOptions(target:IArea):AddImageOptions;
    public function getPictureAreaId(?templateIndex:Int):Float;
    public function getPictureAreasId(?templateIndex:Int):Array<Float>;
    public function getTextAreaId(?templateIndex:Int):Float;

    public function validatePattern():IConstraintGroupValidationResult;
    public function canMoveAreaElements(target:IArea, ?type:ElementType):Bool;
    public function canScaleAreaElements(target:IArea, ?type:ElementType):Bool;
    public function canRemoveAreaElements(target:IArea, ?type:ElementType):Bool;
    public function canRotateAreaElements(target:IArea, ?type:ElementType):Bool;
    public function getAvailableFonts(target:IArea, fonts:Array<FontDefinition>):Array<FontDefinition>;
    public function getAvailableColors(target:IArea, colors:Array<String>):Array<String>;
    public function getAvailableSizes(target:IArea):Array<Int>;
    public function getTextMaxSize(text:IText):Int;
    public function getTextMaxLines(text:IText):Int;
    public function getMaxPictureByArea():Int;
    public function getMaxPictureForArea(target:Area):Int;
    public function canApplyFilters(target:IArea):Bool;
    public function isAreaEmpty(targetId:Float):Bool;

    public function getConstraints(targetType:ConstrictedType, ?targetId:Float, ?constraintName:String):Array<Constraint>;
    public function filterConstraints(targetType:ConstrictedType, ?targetId:Float, filterCallback:Constraint -> Bool):Void;
    public function removeConstraints(targetType:ConstrictedType, ?targetId:Float, constraintName:String):Void;
    public function addConstraint(targetType:ConstrictedType, ?targetId:Float, constraint:Constraint):Void;
}

/**
 * Typedef to represent a font defined by its name and its value
 * @class FontDefinition
 **/
typedef FontDefinition = {

    /**
     * @property value
     * @type String
     **/
    var value:String;

    /**
     * @property name
     * @type String
     **/
    var name:String;
}

/**
 * Interface Skin
 * @class Skin
 **/
interface Skin {

    /**
     * @method getProperty
     * @param target {SkinProperty}
     * @return {PropertyValue} the value
     **/
    public function getProperty(target:SkinProperty):PropertyValue;

    /**
     * @method setProperty
     * @param target {SkinProperty}
     * @param value {PropertyValue}
     **/
    public function setProperty(target:SkinProperty, value:PropertyValue):Void;

    /**
     * @method getSize
     * @param target {Size}
     * @return {Int} the size
     **/
    public function getSize(target:Size):Int;

    /**
     * @method setSize
     * @param target {Size}
     * @param value {Int}
     **/
    public function setSize(target:Size, value:Int):Void;
}

/**
 * Enum about the size's property
 * @class Size
 * @static
 **/
@:enum abstract Size(String) from String to String {

    /**
     * Define the maximum amount of images for an area
     * 0 = unlimited
     * If we add an image to an Area which cannot contain more, delete the previous one. If swapPictures is true, do not delete.
     * @property MAX_PICTURE_BY_AREA
     * @type String
     * @static
     * @readOnly
     * @default "maxPictureByArea"
     */
    var MAX_PICTURE_BY_AREA = 'maxPictureByArea';
}

/**
* Enum Skin properties
* @author d.mouton
* @class SkinProperty
* @static
*/
@:enum abstract SkinProperty(String) from String to String {

    /**
     * Do we display background or is it transparent ?
     * @property DISPLAY_BACKGROUND
     * @type String
     * @static
     * @readOnly
     * @default "displayBackground"
     */
    var DISPLAY_BACKGROUND = 'displayBackground';

    /**
     * @property PATTERN_DISPLAY_MODE
     * @type String
     * @static
     * @readOnly
     * @default "patternDisplayMode"
     */
    var PATTERN_DISPLAY_MODE = 'patternDisplayMode';

    /**
     *
     * @property DISPLAY_TEMPLATE_THUMBS
     * @type String
     * @static
     * @readOnly
     * @default "displayTemplateThumbs"
     */
    var DISPLAY_TEMPLATE_THUMBS = 'displayTemplateThumbs';

    /**
     * When importing an image, if keepPictureQuality is true, the image will be displayed a its maximum resolution. A 10x10 image won't fill an entire 50x50 area
     * @property KEEP_PICTURE_QUALITY
     * @type String
     * @static
     * @readOnly
     * @default "keepPictureQuality"
     */
    var KEEP_PICTURE_QUALITY = 'keepPictureQuality';

    /**
     * Do we keep the aspect ratio ?
     * @property KEEP_ASPECT_RATIO
     * @type String
     * @static
     * @readOnly
     * @default "keepAspectRatio"
     */
    var KEEP_ASPECT_RATIO = 'keepAspectRatio';

    /**
     * Are the elements moveable ?
     * @property MOVE
     * @type String
     * @static
     * @readOnly
     * @default "move"
     */
    var MOVE = 'move';

    /**
     * Are the elements rotatable ?
     * @property ROTATE
     * @type String
     * @static
     * @readOnly
     * @default "rotate"
     */
    var ROTATE = 'rotate';

    /**
     * Are the elements scalable ?
     * @property SCALE
     * @type String
     * @static
     * @readOnly
     * @default "scale"
     */
    var SCALE = 'scale';

    /**
     * Are the elements deletable ?
     * @property DELETE
     * @type String
     * @static
     * @readOnly
     * @default "delete"
     */
    var DELETE = 'delete';


    /**
     * If true, the elements borders will always be displayed
     * @property DISPLAY_AREA_BORDER
     * @type String
     * @static
     * @readOnly
     * @default "displayAreaBorder"
     */
    var DISPLAY_AREA_BORDER = 'displayAreaBorder';

    /**
     * If true, the areas will display a placeholder image if they're empty
     * @property DISPLAY_AREA_GUIDES
     * @type String
     * @static
     * @readOnly
     * @default "displayAreaGuides"
     */
    var DISPLAY_AREA_GUIDES = 'displayAreaGuides';

    /**
     * While changing an element's area, do we swap with a destination area's element ?
     * @property SWAP_PICTURES
     * @type String
     * @static
     * @readOnly
     * @default "swapPictures"
     */
    var SWAP_PICTURES = 'swapPictures';

    /**
     * Do we use the "next" transformation interface ?
     * @property USE_NEXT_TRANSFORM_ICON
     * @type Bool
     * @static
     * @readOnly
     * @default "false"
     */
    var USE_NEXT_TRANSFORM_ICON = 'useNextTransformIcon';

    /**
     * Is the text editable from the canvas ?
     * @property TEXT_EDITABLE
     * @type Bool
     * @static
     * @readOnly
     * @default "false"
     */
    var TEXT_EDITABLE = 'isTextEditable';

    /**
     * Can the text be moved outside of the area ?
     * @property KEEP_TEXT_INSIDE_AREA
     * @type Bool
     * @static
     * @readOnly
     * @default "false"
     */
    var KEEP_TEXT_INSIDE_AREA = 'keepTextInsideArea';

    /**
     * Do the previews have to be fused (merged) when adding the customer design (addCustomerDesign()) ?
     * @property MERGE_PREVIEW
     * @type Bool
     * @static
     * @readOnly
     * @default "true"
     */
    var MERGE_PREVIEW = 'mergePreview';

    /**
     * Is the foreground hidden when selecting an element ?
     * @property AUTO_HIDE_FOREGROUND
     * @type Bool
     * @static
     * @readOnly
     * @default "true"
     */
    var AUTO_HIDE_FOREGROUND = 'autoHideForeground';

}

/**
 * Enum describing the different values that a SkinProperty can take
 * @class PropertyValue
 * @static
 **/
@:enum abstract PropertyValue(String) from String to String {

    /**
     * @property AUTO
     * @type String
     * @default 'auto'
     **/
    var AUTO = 'auto';

    /**
     * @property FALSE
     * @type String
     * @default 'false'
     **/
    var FALSE = 'false';

    /**
     * @property OFF
     * @type String
     * @default 'off'
     **/
    var OFF = 'off';

    /**
     * @property ON
     * @type String
     * @default 'on'
     **/
    var ON = 'on';

    /**
     * @property STATIC
     * @type String
     * @default 'static'
     **/
    var STATIC = 'static';

    /**
     * @property TRUE
     * @type String
     * @default 'true'
     **/
    var TRUE = 'true';

    /**
     * @property UNKNOWN
     * @type String
     * @default 'NULL'
     **/
    var UNKNOWN = 'null';
}

@:native("InitOptions")
extern class InitOptions {

    /**
     * @property targetContentId
     * the DIV's id to put the editor in
     * @type String
     **/
    public var targetContentId:String;

    /**
     * @property contentWidth
     * the editor's width
     * @type Int
     **/
    public var contentWidth:Int;

    /**
     * @property contentHeight
     * the editor's height
     * @type Int
     **/
    public var contentHeight:Int;

    /**
     * @property token
     * the partner's token (given at your account's creation)
     * @type String
     **/
    public var token:String;

    /**
     * @property configURL
     * the editor's config file url
     * @type String
     **/
    public var configURL:String;

    /**
     * @property useHttps
     * if true, the https protocol is used
     * @type Bool
     * @default false
     **/
    public var useHttps:Bool;

    /**
     * @property model
     * The pattern to be loaded at init time
     * @type PatternType
     **/
    public var model:PatternType;

    public function new(targetContentId:String, contentWidth:Int, contentHeight:Int, token:String, configURL:String, useHttps:Bool = false):Void;

    /**
     * Return a model PatternType
     * @static
     * @method createPatternType
     * @param   patternId {Array<Area>} list of the Areas to use
     * @param   customerDesignHash {Array<Area>} list of the Areas to use
     * @param   pattern {Array<Area>} list of the Areas to use
     * @return {PatternType} the model
     */
    public static function createPatternType(?patternId:Int, ?customerDesignHash:String, ?pattern:Pattern):PatternType;

}

/**
 * @class PatternType
 **/
enum PatternType {
    /**
    * @property RemotePattern
    * A remote Pattern
    **/
    RemotePattern(patternId:Int);
    /**
    * @property RemoteCustomerDesign
    * A remote CustomerDesign
    **/
    RemoteCustomerDesign(customerDesignHash:String);
    /**
    * @property StaticPattern
    * A Pattern given in params
    **/
    StaticPattern(pattern:Pattern);
}
