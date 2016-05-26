package com.sakura.api.editor;

import com.sakura.api.model.design.Template;
import com.sakura.api.model.info.TemplateInfo.ITemplateInfo;
import com.sakura.api.model.design.Area;
import com.sakura.api.model.transform.Transform.ITransform;
import com.sakura.api.model.design.Text.IText;
import com.sakura.api.model.design.Picture.IPicture;
import com.sakura.api.model.info.PatternInfo.IPatternInfo;
import com.sakura.api.model.design.IDrawingArea;
import com.sakura.api.model.constraint.IConstraintGroupValidationResult;
import com.sakura.api.model.design.ExternalImageProvider;
import com.sakura.api.model.design.IArea;
import com.sakura.api.model.design.PictureFilter;
import com.sakura.api.model.event.SakuraEventType;
import com.sakura.api.model.geom.Rectangle;
import js.html.Blob;
import haxe.MimeType;
import js.html.CanvasElement;
import haxe.ds.StringMap;
import org.tamina.log.LogLevel;
import org.tamina.utils.UID;
import js.html.Image;
import org.tamina.net.URL;
import org.tamina.events.Event;
import haxe.Scheme;

@:native("SakuraEditor")
extern class SakuraEditor {
    static function getInstance():SakuraEditor;
    
    public function addEventListener(type:String, listener:SakuraEvent -> Void, ?useCapture:Bool):Void;

    public function removeElement(elementId:Float):Void;
    public function selectElement(elementId:Float):Void;
    public function displayPatternById(patternId:Int, save:Bool = false, merge:Bool = true):Void;
    public function init(targetContentId:String, contentWidth:Int, contentHeight:Int, token:String, configURL:String, patternId:Int, isCustomerDesign:Bool = false, useHttps:Bool = false):Void;
    public function resizeTo(contentWidth:Int, contentHeight:Int):Void;
    public function addImageFromURL(url:String, ?targetAreaId:Float):IPicture;
    public function addCanvas(canvas:CanvasElement, mimeType:MimeType, source:Blob, ?targetAreaId:Float):IPicture;
    public function transformElement(elementId:Float,value:ITransform):Void;
    public function addImage(img:Image, ?targetAreaId:Float):IPicture;
    public function removeImagesByAreaById(targetAreaId:Float):Void;
    public function moveElementTo(elementId:Float, posX:Float, posY:Float):Void;
    public function rotateElementBy(elementId:Float, angle:Float):Void;
    public function scaleElementBy(elementId:Float, scaleX:Float, scaleY:Float):Void;
    public function scaleElementTo(elementId:Float, scaleX:Float, scaleY:Float):Void;
    public function addText(label:String, align:String = "", bold:Bool = false, color:String = "", font:String = "Arial", italic:Bool = false, underline:Bool = false, size:Int = 0, ?targetAreaId:Float):IText;
    public function updateText(elementId:Float, label:String, align:String = "", bold:Bool = false, color:String = "", font:String = "Arial", italic:Bool = false, underline:Bool = false, size:Int = 12):Void;
    public function addCustomerDesign(?previewArea:Rectangle, size:Int=512):Void;
    public function getHoveredArea(canContainsImages:Bool = true,canContainsText:Bool = true):Area;
    public function changeCurrentTemplateAreas(areas:Array<Area>):IPatternInfo;
    public function displayTemplateByIndex(index:Int):IPatternInfo;
    public function registerPlugin(plugin:Dynamic):Void;
    public function getConfig():Config;
    public function applyFilter(targetPictureId:Float, filter:PictureFilter, ?value:Float):Void;
    public function setLogLevel(level:LogLevel):Void;
    public function getConstraintManager():ConstraintManager;
    public function removeEventListener(type:SakuraEventType, listener:Event<SakuraEventType> -> Void):Void ;
    public function removeAllEventListeners(type:SakuraEventType):Void;
    public function displayCustomerDesignByHash(hash:String):Void;
    public function getAreaById(areaId:Float):IArea;
    public function addExternalImageFromURL(thumbUrl:String, pictureId:String, providerId:ExternalImageProvider, ?targetAreaId:Float):IPicture;
    public function addArea(area:IArea, ?targetTemplateId:Float):Void;
    public function removeArea(area:IArea, ?targetTemplateId:Float):Void;
    public function addTemplate(template:Template, ?index:Int):Void;
    public function removeTemplate(templateId:Float):Void;
    public function duplicateTemplate(sourceTemplateIndex:Int):Template;
    public function updateAreaOverlay(areaId:Float, areaOverlay:CanvasElement, ?alignRules:Int):Void;
    public function hideAreaOverlay(areaId:Float):Void;

}

typedef Config = {
    var skin:Skin;
    var defaultText:String;
}

typedef ConstraintManager = {
    function canAddPictureToArea(target:IArea):Bool;
    function canAddTextToArea(target:IArea):Bool;
    function validatePattern():IConstraintGroupValidationResult;
    function canMoveAreaElements(target:IArea):Bool;
    function canScaleAreaElements(target:IArea):Bool;
    function canRemoveAreaElements(target:IArea):Bool;
    function canRotateAreaElements(target:IArea):Bool;
    function getAvailableFonts(target:IArea, fonts:Array<String>):Array<String>;
    function getAvailableColors(target:IArea, colors:Array<String>):Array<String>;
    function getAvailableSizes(target:IArea):Array<Int>;
    public function canApplyFilters(target:IArea):Bool;
}


interface Skin {
    public function getProperty(target:SkinProperty):PropertyValue;
    public function setProperty(target:SkinProperty, value:PropertyValue):Void;
    public function getSize(target:Size):Int;
    public function setSize(target:Size, value:Int):Void;
}

@:enum abstract Size(String) from String to String {

    /**
     * indique le nombre maximum d'image que peut contenir les zones.
     * 0 -> illimité
     * Si on ajoute une image à une zone qui ne peut pas en contenir d'autres, on supprime la précédente. * Si swapPictures est à true, on ne supprime rien.
     * 
     * @property MAX_PICTURE_BY_AREA
     * @type String
     * @static
     * @readOnly
     * @default "maxPictureByArea"
     */
    var MAX_PICTURE_BY_AREA = 'maxPictureByArea';
}

/**
* Les differentes propriétés d'une skin
* @author d.mouton
* @class SkinProperty
* @static
*/
@:enum abstract SkinProperty(String) from String to String {

    /**
     * si on affiche le fond ou si il est transparent
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
     * Lors de l'import d'une image si keepPictureQuality est à true, l'image apparaîtra au maximum de sa résolution. Ainsi, une image de 250x250 dans une zone de 500x500 apparaitra sans remplir la zone.
     * @property KEEP_PICTURE_QUALITY
     * @type String
     * @static
     * @readOnly
     * @default "keepPictureQuality"
     */
    var KEEP_PICTURE_QUALITY = 'keepPictureQuality';

    /**
     * active ou non le scale non homothétique
     * @property KEEP_ASPECT_RATIO
     * @type String
     * @static
     * @readOnly
     * @default "keepAspectRatio"
     */
    var KEEP_ASPECT_RATIO = 'keepAspectRatio';

    /**
     * active ou non le déplacement
     * @property MOVE
     * @type String
     * @static
     * @readOnly
     * @default "move"
     */
    var MOVE = 'move';

    /**
     * active ou non la rotation
     * @property ROTATE
     * @type String
     * @static
     * @readOnly
     * @default "rotate"
     */
    var ROTATE = 'rotate';

    /**
     * active ou non l’étirement
     * @property SCALE
     * @type String
     * @static
     * @readOnly
     * @default "scale"
     */
    var SCALE = 'scale';

    /**
     * active ou non la suppression
     * @property DELETE
     * @type String
     * @static
     * @readOnly
     * @default "delete"
     */
    var DELETE = 'delete';


    /**
     *  à true, la bordure des zones sont constamment visibles
     * @property DISPLAY_AREA_BORDER
     * @type String
     * @static
     * @readOnly
     * @default "displayAreaBorder"
     */
    var DISPLAY_AREA_BORDER = 'displayAreaBorder';

    /**
     *  lors d'un changement de zone, indique si on permute avec un élément de la zone de destination.
     * @property SWAP_PICTURES
     * @type String
     * @static
     * @readOnly
     * @default "swapPictures"
     */
    var SWAP_PICTURES = 'swapPictures';

    /**
     *  Indique si on utilise l'UI de transformation NEXT
     * @property USE_NEXT_TRANSFORM_ICON
     * @type Bool
     * @static
     * @readOnly
     * @default "false"
     */
    var USE_NEXT_TRANSFORM_ICON = 'useNextTransformIcon';

    /**
     *  Indique si le text est editable depuis le canvas
     * @property TEXT_EDITABLE
     * @type Bool
     * @static
     * @readOnly
     * @default "false"
     */
    var TEXT_EDITABLE = 'isTextEditable';

    /**
     *  Indique si le text est contraint à la zone
     * @property KEEP_TEXT_INSIDE_AREA
     * @type Bool
     * @static
     * @readOnly
     * @default "false"
     */
    var KEEP_TEXT_INSIDE_AREA = 'keepTextInsideArea';

    /**
     *  Indique si les preview doivent etre fusionnées lors du addCustomerDesign()
     * @property MERGE_PREVIEW
     * @type Bool
     * @static
     * @readOnly
     * @default "true"
     */
    var MERGE_PREVIEW = 'mergePreview';

    /**
     *  Indique si les foreground sont masqués lors de la section d'un élement
     * @property AUTO_HIDE_FOREGROUND
     * @type Bool
     * @static
     * @readOnly
     * @default "true"
     */
    var AUTO_HIDE_FOREGROUND = 'autoHideForeground';

}

@:enum abstract PropertyValue(String) from String to String {
    var AUTO = 'auto';
    var FALSE = 'false';
    var OFF = 'off';
    var ON = 'on';
    var STATIC = 'static';
    var TRUE = 'true';
    var UNKNOWN = 'null';
}
