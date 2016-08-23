package com.sakura.api.model.constraint;
import com.sakura.api.model.constraint.image.ImageSelectConstraint;
class ConstraintGroup {

    public static var ALBUM(get_ALBUM, null):ConstraintGroup;
    public static var COLOR(get_COLOR, null):ConstraintGroup;
    public static var CONTENT(get_CONTENT, null):ConstraintGroup;
    public static var FILTER(get_FILTER, null):ConstraintGroup;
    public static var FONT(get_FONT, null):ConstraintGroup;
    public static var FONT_SIZE(get_FONT_SIZE, null):ConstraintGroup;
    public static var IMAGE_NUMBER(get_IMAGE_NUMBER, null):ConstraintGroup;
    public static var TEXT_NUMBER(get_TEXT_NUMBER, null):ConstraintGroup;
    public static var TRANSFORM(get_TRANSFORM, null):ConstraintGroup;
    public static var IMAGE_TRANSFORM(get_IMAGE_TRANSFORM, null):ConstraintGroup;

    private static var _ALBUM:ConstraintGroup;
    private static var _COLOR:ConstraintGroup;
    private static var _CONTENT:ConstraintGroup;
    private static var _FILTER:ConstraintGroup;
    private static var _FONT:ConstraintGroup;
    private static var _FONT_SIZE:ConstraintGroup;
    private static var _IMAGE_NUMBER:ConstraintGroup;
    private static var _TEXT_NUMBER:ConstraintGroup;
    private static var _TRANSFORM:ConstraintGroup;

    public var authorizedOperators:Array<Operator>;

    public var constraints:Array<Constraint>;

    public var name:String = "";
    public var valueType:ConstraintValueType;

    public function new(name:String = "", ?constraints:Array<Constraint>, ?authorizedOperators:Array<Operator>) {
        this.name = name;
        this.constraints = constraints != null ? constraints : new Array<Constraint>();
        this.authorizedOperators = authorizedOperators != null ? authorizedOperators : new Array<Operator>();
        valueType = ConstraintValueType.DEFAULT;
    }


    private static function get_ALBUM():ConstraintGroup {
        if (_ALBUM == null) {
            _ALBUM = new ConstraintGroup( "album" );
            _ALBUM.authorizedOperators.push(Operator.EQUAL);
            _ALBUM.authorizedOperators.push(Operator.DIFFERENT);
            _ALBUM.authorizedOperators.push(Operator.INCLUDE);
            _ALBUM.authorizedOperators.push(Operator.DEFAULT);
            _ALBUM.valueType = ConstraintValueType.ALBUM_LIST;
            _ALBUM.constraints.push(new AlbumConstraint());

        }
        return _ALBUM;
    }

    public static function get_COLOR():ConstraintGroup {
        if (_COLOR == null) {
            _COLOR = new ConstraintGroup( "color" );
            _COLOR.authorizedOperators.push(Operator.EQUAL);
            _COLOR.authorizedOperators.push(Operator.DIFFERENT);
            _COLOR.authorizedOperators.push(Operator.INCLUDE);
            _COLOR.authorizedOperators.push(Operator.DEFAULT);
            _COLOR.valueType = ConstraintValueType.COLOR;
            _COLOR.constraints.push(new FontColorConstraint());
        }
        return _COLOR;
    }

    public static function get_CONTENT():ConstraintGroup {
        if (_CONTENT == null) {
            _CONTENT = new ConstraintGroup( "content" );
            _CONTENT.authorizedOperators.push(Operator.DIFFERENT);
            _CONTENT.authorizedOperators.push(Operator.INCLUDE);
            _CONTENT.constraints.push(new TextConstraint());
            _CONTENT.constraints.push(new FilterConstraint());
            _CONTENT.constraints.push(new AllImageConstraint());
            _CONTENT.constraints.push(new PartnerImageConstraint());
            _CONTENT.constraints.push(new UserImageConstraint());
            _CONTENT.constraints.push(new MyDesignImageConstraint());
        }
        return _CONTENT;
    }

    public static function get_FILTER():ConstraintGroup {
        if (_FILTER == null) {
            _FILTER = new ConstraintGroup( "filter" );
            _FILTER.authorizedOperators.push(Operator.DIFFERENT);
            _FILTER.authorizedOperators.push(Operator.INCLUDE);
            _FILTER.authorizedOperators.push(Operator.EQUAL);
            _FILTER.valueType = ConstraintValueType.FILTER_LIST;
            _FILTER.constraints.push(new ImageFilterConstraint());
        }
        return _FILTER;
    }

    public static function get_FONT():ConstraintGroup {
        if (_FONT == null) {
            _FONT = new ConstraintGroup( "font" );
            _FONT.authorizedOperators.push(Operator.EQUAL);
            _FONT.authorizedOperators.push(Operator.DIFFERENT);
            _FONT.authorizedOperators.push(Operator.INCLUDE);
            _FONT.authorizedOperators.push(Operator.DEFAULT);
            _FONT.valueType = ConstraintValueType.FONT_LIST;
            _FONT.constraints.push(new FontConstraint());
        }
        return _FONT;
    }

    public static function get_FONT_SIZE():ConstraintGroup {
        if (_FONT_SIZE == null) {
            _FONT_SIZE = new ConstraintGroup( "fontSize" );
            _FONT_SIZE.authorizedOperators.push(Operator.EQUAL);
            _FONT_SIZE.authorizedOperators.push(Operator.DIFFERENT);
            _FONT_SIZE.authorizedOperators.push(Operator.INCLUDE);
            _FONT_SIZE.authorizedOperators.push(Operator.DEFAULT);
            _FONT_SIZE.authorizedOperators.push(Operator.LESS);
            _FONT_SIZE.authorizedOperators.push(Operator.MORE);
            _FONT_SIZE.valueType = ConstraintValueType.NUMERIC;
            _FONT_SIZE.constraints.push(new FontSizeConstraint());
        }
        return _FONT_SIZE;
    }

    public static function get_IMAGE_NUMBER():ConstraintGroup {
        if (_IMAGE_NUMBER == null) {
            _IMAGE_NUMBER = new ConstraintGroup( "imageNumber" );
            _IMAGE_NUMBER.authorizedOperators.push(Operator.LESS);
            _IMAGE_NUMBER.constraints.push(new ImageNumberConstraint());
            _IMAGE_NUMBER.valueType = ConstraintValueType.NUMERIC;
        }
        return _IMAGE_NUMBER;
    }

    public static function get_TEXT_NUMBER():ConstraintGroup {
        if (_TEXT_NUMBER == null) {
            _TEXT_NUMBER = new ConstraintGroup( "textNumber" );
            _TEXT_NUMBER.authorizedOperators.push(Operator.LESS);
            _TEXT_NUMBER.constraints.push(new TextNumberConstraint());
            _TEXT_NUMBER.valueType = ConstraintValueType.NUMERIC;
        }
        return _TEXT_NUMBER;
    }

    public static function get_TRANSFORM():ConstraintGroup {
        if (_TRANSFORM == null) {
            _TRANSFORM = new ConstraintGroup( "transform" );
            _TRANSFORM.authorizedOperators.push(Operator.DIFFERENT);
            _TRANSFORM.constraints.push(new ScaleConstraint());
            _TRANSFORM.constraints.push(new MoveConstraint());
            _TRANSFORM.constraints.push(new RotationConstraint());
            _TRANSFORM.constraints.push(new SelectConstraint());
        }
        return _TRANSFORM;
    }

    public static function get_IMAGE_TRANSFORM():ConstraintGroup {
        if (_TRANSFORM == null) {
            _TRANSFORM = new ConstraintGroup( "image_transform" );
            _TRANSFORM.authorizedOperators.push(Operator.DIFFERENT);
            _TRANSFORM.constraints.push(new ImageSelectConstraint());
        }
        return _TRANSFORM;
    }
}
