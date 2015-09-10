package com.sakura.api;

import org.tamina.log.LogLevel;
import org.tamina.utils.UID;
import js.html.Image;
import org.tamina.net.URL;
import org.tamina.events.Event;

@:native("SakuraEditor")
extern class SakuraEditor {
static function getInstance():SakuraEditor;

public function addEventListener(type:String, listener:SakuraEvent -> Void, ?useCapture:Bool):Void;

public function removeElement(elementId:Float):Void;
public function selectElement(elementId:Float):Void;
public function displayPatternById(patternId:Int, save:Bool = false):Void;
public function init(targetContentId:String, contentWidth:Int, contentHeight:Int, token:String, configURL:String, patternId:Int, isCustomerDesign:Bool = false):Void;
public function addImageFromURL(url:String, ?targetAreaId:Float):Picture;
public function transformElement(elementId:Float,value:Transform):Void;
public function addImage(img:Image, ?targetAreaId:Float):Picture;
public function moveElementTo(elementId:Float, posX:Float, posY:Float):Void;
public function rotateElementBy(elementId:Float, angle:Float):Void;
public function scaleElementBy(elementId:Float, scaleX:Float, scaleY:Float):Void;
public function scaleElementTo(elementId:Float, scaleX:Float, scaleY:Float):Void;
public function addText(label:String, align:String = "", bold:Bool = false, color:String = "", font:String = "Arial", italic:Bool = false, underline:Bool = false, size:Int = 0, ?targetAreaId:Float):Text;
public function updateText(elementId:Float, label:String, align:String = "", bold:Bool = false, color:String = "", font:String = "Arial", italic:Bool = false, underline:Bool = false, size:Int = 12):Void;
public function addCustomerDesign():Void;
public function getHoveredArea(canContainsImages:Bool = true,canContainsText:Bool = true):IDrawingArea;
public function changeCurrentTemplateAreas(areas:Array<IDrawingArea>):PatternInfo;
public function displayTemplateByIndex(index:Int):PatternInfo;
public function registerPlugin(plugin:Dynamic):Void;
public function getConfig():Config;
public function applyFilter(targetPictureId:Float, filter:PictureFilter, ?value:Float):Void;
public function setLogLevel(level:LogLevel):Void;
public function getConstraintManager():ConstraintManager;
public function removeEventListener(type:SakuraEventType, listener:Event<SakuraEventType> -> Void):Void ;
public function removeAllEventListeners(type:SakuraEventType):Void;
public function displayCustomerDesignByHash(hash:String):Void

}

typedef Config = {
    var skin:Skin;
}

typedef ConstraintManager = {
    function canAddPictureToArea(target:Area):Bool;
    function canAddTextToArea(target:Area):Bool;
    function validatePattern():ConstraintGroupValidationResult;
    function canMoveAreaElements(target:Area):Bool;
    function canScaleAreaElements(target:Area):Bool;
    function canRemoveAreaElements(target:Area):Bool;
    function canRotateAreaElements(target:Area):Bool;
}

interface ConstraintValidationResult {

/**
	 * Le resultat
	 * @property result
	 * @type Bool
	 */
    public var result:Bool;

/**
	 * La contrainte
	 * @property constraint
	 * @type Constraint
	 */
    public var constraint:Constraint;

}

/**
 * Resultat de la validation des contraintes
 * @class ConstraintGroupValidationResult
 */
interface ConstraintGroupValidationResult {

/**
	 * Le resultat
	 * @property result
	 * @type Bool
	 */
    public var result:Bool;

/**
	 * La liste des validations de contraintes
	 * @property constraints
	 * @type Array<ConstraintValidationResult>
	 */
    public var constraints:Array<ConstraintValidationResult>;

}

class Constraint {

    public var groupName:String = "";

    public var id:Float = 0;
    public var name:String = "";
    public var operator:Operator;
    public var value:String = "";

    public function new(groupName:String = "", name:String = "", ?operator:Operator, value:String = "") {
        this.groupName = groupName;
        this.name = name;
        this.operator = operator;
        this.value = value;
        this.id = UID.getUID();
    }

    public function clone( copy:Bool = false ):Constraint
    {
        var cloneID:Float = UID.getUID();
        if ( copy )
        {
            cloneID = this.id;
        }
        var result:Constraint = new Constraint( groupName, name, operator, value );
        result.id = cloneID;
        return result;
    }

}

class Area implements IDrawingArea{
    public function new():Void {
        this.constraints = new Array<Constraint>();
    }

    public var id:Float;

    public var x:Float;

    public var y:Float;

    public var width:Float;

    public var height:Float;

    public var rotate:Float;

    public var parent:IDrawingArea;

    public var constraints:Array<Constraint>;

    public var scaledWidth(get, null):Float;
    public var scaledHeight(get, null):Float;

    public function clone(copy:Bool = false):IDrawingElement {
        return null;
    }

    public var name:String;

    public var content:Array<IDrawingElement>;

    private function get_scaledWidth():Float {
        return 0;
    }

    private function get_scaledHeight():Float {
        return 0;
    }
}

/**
* AreaInfo
* <br/>Les informations sur une zone
* @author d.mouton
* @class AreaInfo
* @constructor
*/
interface AreaInfo {
/**
	 * La hauteur en pixel
	 * @property height
	 * @type Int
	 */
    public var height:Float;
/**
	 * L'id de la zone
	 * @property id
	 * @type Float
	 */
    public var id:Float;
/**
	 * Le nom de la zone
	 * @property name
	 * @type String
	 */
    public var name:String = "";
/**
	 * La largeur en pixel
	 * @property width
	 * @type Int
	 */
    public var width:Float;

/**
	 * Position en X
	 * @property x
	 * @type Float
	 */
    var x:Float;

/**
	 * Position en y
	 * @property y
	 * @type Float
	 */
    var y:Float;

/**
	 * La liste des contraintes
	 * @property constraints
	 * @type Array<Constraint>
	 */
    var constraints:Array<Constraint>;

/**
	 * Returns a rectangle representing this object's bounds in its local coordinate system
	 * @property boundingBox
	 * @type Rectangle
	 */
    public var boundingBox:Rectangle;

}

/**
 * ...
 * @author David Mouton
 */

interface IDrawingArea extends IDrawingElement
{

    var name:String;
    var content:Array<IDrawingElement>;

}

/**
* Classe de base des élements Text et Picture
* @author d.mouton
* @class IDrawingElement
* @constructor
*/
interface IDrawingElement
{
/**
	 * L'id de l'element
	 * @property id
	 * @type Float
	 */
    var id:Float;

/**
	 * Position en X
	 * @property x
	 * @type Float
	 */
    var x:Float;

/**
	 * Position en y
	 * @property y
	 * @type Float
	 */
    var y:Float;

/**
	 * Largeur en px
	 * @property width
	 * @type Float
	 */
    var width:Float;

/**
	 * Hauteur en px
	 * @property height
	 * @type Float
	 */
    var height:Float;

/**
	 * Rotation en radian
	 * @property rotate
	 * @type Float
	 */
    var rotate:Float;
    var parent:IDrawingArea;
    var scaledWidth(get, null):Float;


    var scaledHeight(get, null):Float;

    function clone( copy:Bool = false ):IDrawingElement;
}

@:enum abstract Operator(String) from String to String   {

    var INCLUDE = 'in';
    var EQUAL = '=';
    var LESS = '<';
    var MORE = '>';
    var DIFFERENT = '<>';
    var DEFAULT = '';

}

/**
* PatternInfo
* <br/>Les informations sur un Patron
* @author d.mouton
* @class PatternInfo
* @constructor
*/
interface PatternInfo
{
/**
	 * L'id du Patron
	 * @property id
	 * @type Float
	 */
    public var id:Float;
/**
	 * Le nom du Patron
	 * @property name
	 * @type String
	 */
    public var name:String;
/**
	 * La largeur en pixel du premier template
	 * @property templateWidth
	 * @type Int
	 */
    public var templateWidth:Float;
/**
	 * La hauteur en pixel du premier template
	 * @property templateHeight
	 * @type Int
	 */
    public var templateHeight:Float;
/**
	 * La liste des Zones du premier template
	 * @property areas
	 * @type Array<AreaInfo>
	 */
    public var areas:Array<AreaInfo>;

/**
	 * La liste des Templates
	 * @property templates
	 * @type Array<TemplateInfo>
	 */
    public var templates:Array<TemplateInfo>;

    public var asPreview:Bool;

/**
	 * La liste des contraintes
	 * @property constraints
	 * @type Array<Constraint>
	 */
    public var constraints:Array<Constraint>;

}

interface Picture extends IDrawingElement {

    public var brightness:Float;
    public var contrast:Float;
    public var displayScale:Float;
    public var filter:String;
    public var hFlip:Bool;
    public var height:Float;
    public var rotate:Float;
    public var url(get, set):URL;
    public var vFlip:Bool;
    public var xScale:Float;
    public var yScale:Float;

    public var source(get, set):Image;
    public var scaledWidth(get, null):Float;
    public var scaledHeight(get, null):Float;
/**
	 * Qualité de l'image apres transformation
	 * @property pictureQuality
	 * @type quality
	 */
    public var quality:PictureQuality;

}

@:enum abstract PictureQuality(Int) from Int to Int  {

/**
	 * Bonne qualité
	 * @property GOOD
	 * @type Int
	 * @static
	 * @default 0
	 */
    var GOOD = 0;

/**
	 * Qualité médiocre
	 * @property POOR
	 * @type Int
	 * @static
	 * @default 1
	 */
    var POOR = 1;

/**
	 * Mauvaise qualité
	 * @property BAD
	 * @type Int
	 * @static
	 * @default 2
	 */
    var BAD = 2;
}

@:enum abstract PictureFilter(String) from String to String   {

    var BLACK_AND_WHITE = 'blackAndWhite';
    var NONE = '';
    var BLUR = 'blur';
    var NEGATIVE = 'negative';
    var SEPIA = 'sepia';
    var PIXELATE = 'pixelate';
    var RED = 'red';
    var GREEN = 'green';
    var BLUE = 'blue';
    var BRIGHTNESS = 'brightness';
    var CONTRAST = 'contrast';

}

@:enum abstract PropertyValue(String) from String to String   {
    var AUTO='auto';
    var FALSE='false';
    var OFF='off';
    var ON='on';
    var STATIC='static';
    var TRUE='true';
    var UNKNOWN='null';
}

class Rectangle {

    public var height:Float;
    public var width:Float;
    public var x:Float;
    public var y:Float;

    public function new(?x:Float = 0, ?y:Float = 0, ?width:Float = 0, ?height:Float = 0):Void{
        this.x = x;
        this.y = y;
        this.height = height;
        this.width = width;
    }

}

/**
* Type d'évenement porté par les SakuraEvent
* @author d.mouton
* @class SakuraEventType
* @constructor
*/


typedef SakuraEvent = Event<SakuraEventType>;

@:enum abstract SakuraEventType(String) from String to String {
/**
	 * @property LOADING
	 * @type String
	 * @static
	 * @readOnly
	 * @default "loading"
	 */
    var LOADING = "loading";

/**
	 * @property ERROR
	 * @type String
	 * @static
	 * @readOnly
	 * @default "error"
	 */
    var ERROR = "error";

/**
	 * @property PROGRESS
	 * @type String
	 * @static
	 * @readOnly
	 * @default "progress"
	 */
    var PROGRESS = "progress";

/**
	 * @property PRICE_UPDATE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "priceUpdate"
	 */
    var PRICE_UPDATE = "priceUpdate";

/**
	 * @property READY
	 * @type String
	 * @static
	 * @readOnly
	 * @default "ready"
	 */
    var READY = "ready";

/**
	 * @property CUSTOMER_DESIGN_ADDED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "customerDesignAdded"
	 */
    var CUSTOMER_DESIGN_ADDED = "customerDesignAdded";

/**
	 * @property DESIGN_UPDATED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "designUpdatedHandler"
	 */
    var DESIGN_UPDATED = "designUpdatedHandler";

/**
	 * @property BUSY
	 * @type String
	 * @static
	 * @readOnly
	 * @default "busy"
	 */
    var BUSY = "busy";

/**
	 * @property BUSY_COMPLETE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "busyComplete"
	 */
    var BUSY_COMPLETE = "busyComplete";

/**
	 * @property ELEMENT_SELECTED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "elementSelected"
	 */
    var ELEMENT_SELECTED = "elementSelected";

/**
	 * @property ELEMENT_MOVE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "elementMoved"
	 */
    var ELEMENT_MOVED = "elementMoved";

/**
	 * @property ELEMENT_REMOVED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "elementRemoved"
	 */
    var ELEMENT_REMOVED = "elementRemoved";

/**
	 * @property PICTURE_LOADED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "pictureLoaded"
	 */
    var PICTURE_LOADED = "pictureLoaded";

/**
	 * @property ELEMENT_ADDED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "elementAdded"
	 */
    var ELEMENT_ADDED = "elementAdded";


/**
	 * @property PICTURE_QUALITY_CHANGED
	 * @type String
	 * @static
	 * @readOnly
	 * @default "pictureQualityChanged"
	 */
    var PICTURE_QUALITY_CHANGED = "pictureQualityChanged";

}

/**
* Les differentes taille d'une skin
* @author d.mouton
* @class Size
* @static
*/
@:enum abstract Size(String) from String to String {

/**
	 * indique le nombre maximum d'image que peut contenir les zones.
0 -> illimité
Si on ajoute une image à une zone qui ne peut pas en contenir d'autres, on supprime la précédente. Si swapPictures est à true, on ne supprime rien.
	 * @property MAX_PICTURE_BY_AREA
	 * @type String
	 * @static
	 * @readOnly
	 * @default "maxPictureByArea"
	 */
    var MAX_PICTURE_BY_AREA = 'maxPictureByArea';
}

interface Skin {
    public function getProperty(target:SkinProperty):PropertyValue;
    public function setProperty(target:SkinProperty,value:PropertyValue):Void;
    public function getSize(target:Size):Int;
    public function setSize(target:Size,value:Int):Void;
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
    var DISPLAY_BACKGROUND ='displayBackground';

/**
	 * @property PATTERN_DISPLAY_MODE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "patternDisplayMode"
	 */
    var PATTERN_DISPLAY_MODE ='patternDisplayMode';

/**
	 *
	 * @property DISPLAY_TEMPLATE_THUMBS
	 * @type String
	 * @static
	 * @readOnly
	 * @default "displayTemplateThumbs"
	 */
    var DISPLAY_TEMPLATE_THUMBS ='displayTemplateThumbs';

/**
	 * Lors de l'import d'une image si keepPictureQuality est à true, l'image apparaîtra au maximum de sa résolution. Ainsi, une image de 250x250 dans une zone de 500x500 apparaitra sans remplir la zone.
	 * @property KEEP_PICTURE_QUALITY
	 * @type String
	 * @static
	 * @readOnly
	 * @default "keepPictureQuality"
	 */
    var KEEP_PICTURE_QUALITY ='keepPictureQuality';

/**
	 * active ou non le scale non homothétique
	 * @property KEEP_ASPECT_RATIO
	 * @type String
	 * @static
	 * @readOnly
	 * @default "keepAspectRatio"
	 */
    var KEEP_ASPECT_RATIO ='keepAspectRatio';

/**
	 * active ou non le déplacement
	 * @property MOVE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "move"
	 */
    var MOVE ='move';

/**
	 * active ou non la rotation
	 * @property ROTATE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "rotate"
	 */
    var ROTATE ='rotate';

/**
	 * active ou non l’étirement
	 * @property SCALE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "scale"
	 */
    var SCALE ='scale';

/**
	 *  à true, la bordure des zones sont constamment visibles
	 * @property DISPLAY_AREA_BORDER
	 * @type String
	 * @static
	 * @readOnly
	 * @default "displayAreaBorder"
	 */
    var DISPLAY_AREA_BORDER ='displayAreaBorder';

/**
	 *  lors d'un changement de zone, indique si on permute avec un élément de la zone de destination.
	 * @property SWAP_PICTURES
	 * @type String
	 * @static
	 * @readOnly
	 * @default "swapPictures"
	 */
    var SWAP_PICTURES ='swapPictures';
}

/**
* TemplateInfo
* <br/>Les informations sur un template
* @author d.mouton
* @class TemplateInfo
* @constructor
*/
interface TemplateInfo {
/**
	 * La hauteur en pixel
	 * @property height
	 * @type Int
	 */
    public var height:Float;
/**
	 * L'id
	 * @property id
	 * @type Float
	 */
    public var id:Float;
/**
	 * Le nom
	 * @property name
	 * @type String
	 */
    public var name:String = "";
/**
	 * La largeur en pixel
	 * @property width
	 * @type Int
	 */
    public var width:Float;

/**
	 * La liste des Zones
	 * @property areas
	 * @type Array<AreaInfo>
	 */
    public var areas:Array<AreaInfo>;

/**
	 * Returns a rectangle representing this object's bounds in its local coordinate system
	 * @property boundingBox
	 * @type Rectangle
	 */
    public var boundingBox:Rectangle;

    public var backgroundUrl:String;

}

interface Text extends IDrawingElement {
    public var align:String;
    public var bold:Bool;
    public var color:String;
    public var font:String;
    public var italic:Bool;
    public var size:Int;
    public var underline:Bool;
    public var label:String;

    public var scaledWidth(get, null):Float;
    public var scaledHeight(get, null):Float;
}

interface Transform {
    var type:TransformType;
}

@:enum abstract TransformType(String) from String to String {
/**
	 * @property DELETE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "delete"
	 */
    var DELETE = 'delete';

/**
	 * @property ROTATE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "rotate"
	 */
    var ROTATE = 'rotate';

/**
	 * @property ROTATE_BY
	 * @type String
	 * @static
	 * @readOnly
	 * @default "rotateBy"
	 */
    var ROTATE_BY = 'rotateBy';

/**
	 * @property SCALE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "scale"
	 */
    var SCALE = 'scale';

/**
	 * @property SCALE_BY
	 * @type String
	 * @static
	 * @readOnly
	 * @default "scaleBy"
	 */
    var SCALE_BY = 'scaleBy';

/**
	 * @property START
	 * @type String
	 * @static
	 * @readOnly
	 * @default "start"
	 */
    var START = 'start';

/**
	 * @property MOVE
	 * @type String
	 * @static
	 * @readOnly
	 * @default "move"
	 */
    var MOVE = 'move';

/**
	 * @property HFLIP
	 * @type String
	 * @static
	 * @readOnly
	 * @default "hFlip"
	 */
    var HFLIP = 'hFlip';
}


