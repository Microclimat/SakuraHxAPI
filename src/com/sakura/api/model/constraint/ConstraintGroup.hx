package com.sakura.api.model.constraint;

import com.sakura.api.model.constraint.text.TextAutoResizeConstraint;
import com.sakura.api.model.constraint.text.TextCaseConstraint;
import com.sakura.api.model.constraint.text.TextLineNumberConstraint;
import com.sakura.api.model.constraint.text.TextMoveConstraint;
import com.sakura.api.model.constraint.text.TextScaleConstraint;
import com.sakura.api.model.constraint.text.TextSelectConstraint;
import com.sakura.api.model.constraint.text.TextRotationConstraint;
import com.sakura.api.model.constraint.image.ImageSelectConstraint;

class ConstraintGroup {

    public static var ALBUM(get, null):ConstraintGroup;
    public static var COLOR(get, null):ConstraintGroup;
    public static var CONTENT(get, null):ConstraintGroup;
    public static var FILTER(get, null):ConstraintGroup;
    public static var FONT(get, null):ConstraintGroup;
    public static var FONT_SIZE(get, null):ConstraintGroup;
    public static var IMAGE_NUMBER(get, null):ConstraintGroup;
    public static var TEXT(get, null):ConstraintGroup;
    public static var TEXT_NUMBER(get, null):ConstraintGroup;
    public static var TRANSFORM(get, null):ConstraintGroup;
    public static var IMAGE_TRANSFORM(get, null):ConstraintGroup;
    public static var TEXT_TRANSFORM(get, null):ConstraintGroup;


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

    public static function get_ALBUM():ConstraintGroup {
        if (ALBUM == null) {
            ALBUM = new ConstraintGroup( "album" );
            ALBUM.authorizedOperators.push(Operator.EQUAL);
            ALBUM.authorizedOperators.push(Operator.DIFFERENT);
            ALBUM.authorizedOperators.push(Operator.INCLUDE);
            ALBUM.authorizedOperators.push(Operator.DEFAULT);
            ALBUM.valueType = ConstraintValueType.ALBUM_LIST;
            ALBUM.constraints.push(new AlbumConstraint());
        }
        return ALBUM;
    }

    public static function get_COLOR():ConstraintGroup {
        if (COLOR == null) {
            COLOR = new ConstraintGroup( "color" );
            COLOR.authorizedOperators.push(Operator.EQUAL);
            COLOR.authorizedOperators.push(Operator.DIFFERENT);
            COLOR.authorizedOperators.push(Operator.INCLUDE);
            COLOR.authorizedOperators.push(Operator.DEFAULT);
            COLOR.valueType = ConstraintValueType.COLOR;
            COLOR.constraints.push(new FontColorConstraint());
        }
        return COLOR;
    }

    public static function get_CONTENT():ConstraintGroup {
        if (CONTENT == null) {
            CONTENT = new ConstraintGroup( "content" );
            CONTENT.authorizedOperators.push(Operator.DIFFERENT);
            CONTENT.authorizedOperators.push(Operator.INCLUDE);
            CONTENT.constraints.push(new TextConstraint());
            CONTENT.constraints.push(new FilterConstraint());
            CONTENT.constraints.push(new AllImageConstraint());
            CONTENT.constraints.push(new PartnerImageConstraint());
            CONTENT.constraints.push(new UserImageConstraint());
            CONTENT.constraints.push(new MyDesignImageConstraint());
        }
        return CONTENT;
    }

    public static function get_FILTER():ConstraintGroup {
        if (FILTER == null) {
            FILTER = new ConstraintGroup( "filter" );
            FILTER.authorizedOperators.push(Operator.DIFFERENT);
            FILTER.authorizedOperators.push(Operator.INCLUDE);
            FILTER.authorizedOperators.push(Operator.EQUAL);
            FILTER.valueType = ConstraintValueType.FILTER_LIST;
            FILTER.constraints.push(new ImageFilterConstraint());
        }
        return FILTER;
    }

    public static function get_FONT():ConstraintGroup {
        if (FONT == null) {
            FONT = new ConstraintGroup( "font" );
            FONT.authorizedOperators.push(Operator.EQUAL);
            FONT.authorizedOperators.push(Operator.DIFFERENT);
            FONT.authorizedOperators.push(Operator.INCLUDE);
            FONT.authorizedOperators.push(Operator.DEFAULT);
            FONT.valueType = ConstraintValueType.FONT_LIST;
            FONT.constraints.push(new FontConstraint());
        }
        return FONT;
    }

    public static function get_FONT_SIZE():ConstraintGroup {
        if (FONT_SIZE == null) {
            FONT_SIZE = new ConstraintGroup( "fontSize" );
            FONT_SIZE.authorizedOperators.push(Operator.EQUAL);
            FONT_SIZE.authorizedOperators.push(Operator.DIFFERENT);
            FONT_SIZE.authorizedOperators.push(Operator.INCLUDE);
            FONT_SIZE.authorizedOperators.push(Operator.DEFAULT);
            FONT_SIZE.authorizedOperators.push(Operator.LESS);
            FONT_SIZE.authorizedOperators.push(Operator.MORE);
            FONT_SIZE.valueType = ConstraintValueType.NUMERIC;
            FONT_SIZE.constraints.push(new FontSizeConstraint());
        }
        return FONT_SIZE;
    }

    public static function get_IMAGE_NUMBER():ConstraintGroup {
        if (IMAGE_NUMBER == null) {
            IMAGE_NUMBER = new ConstraintGroup( "imageNumber" );
            IMAGE_NUMBER.authorizedOperators.push(Operator.LESS);
            IMAGE_NUMBER.constraints.push(new ImageNumberConstraint());
            IMAGE_NUMBER.valueType = ConstraintValueType.NUMERIC;
        }
        return IMAGE_NUMBER;
    }

    public static function get_TEXT():ConstraintGroup {
        if (TEXT == null) {
            TEXT = new ConstraintGroup( "text" );
            TEXT.authorizedOperators.push(Operator.EQUAL);
            TEXT.authorizedOperators.push(Operator.DIFFERENT);
            TEXT.authorizedOperators.push(Operator.INCLUDE);
            TEXT.authorizedOperators.push(Operator.DEFAULT);
            TEXT.authorizedOperators.push(Operator.LESS);
            TEXT.authorizedOperators.push(Operator.MORE);
            TEXT.constraints.push(new CharNumberConstraint());
            TEXT.constraints.push(new TextLineNumberConstraint());
            TEXT.valueType = ConstraintValueType.NUMERIC;
        }
        return TEXT;
    }

    public static function get_TEXT_NUMBER():ConstraintGroup {
        if (TEXT_NUMBER == null) {
            TEXT_NUMBER = new ConstraintGroup( "textNumber" );
            TEXT_NUMBER.authorizedOperators.push(Operator.LESS);
            TEXT_NUMBER.constraints.push(new TextNumberConstraint());
            TEXT_NUMBER.valueType = ConstraintValueType.NUMERIC;
        }
        return TEXT_NUMBER;
    }

    public static function get_TRANSFORM():ConstraintGroup {
        if (TRANSFORM == null) {
            TRANSFORM = new ConstraintGroup( "transform" );
            TRANSFORM.authorizedOperators.push(Operator.DIFFERENT);
            TRANSFORM.constraints.push(new ScaleConstraint());
            TRANSFORM.constraints.push(new MoveConstraint());
            TRANSFORM.constraints.push(new RotationConstraint());
            TRANSFORM.constraints.push(new SelectConstraint());
        }
        return TRANSFORM;
    }

    public static function get_IMAGE_TRANSFORM():ConstraintGroup {
        if (IMAGE_TRANSFORM == null) {
            IMAGE_TRANSFORM = new ConstraintGroup( "image_transform" );
            IMAGE_TRANSFORM.authorizedOperators.push(Operator.DIFFERENT);
            IMAGE_TRANSFORM.constraints.push(new ImageSelectConstraint());
        }
        return IMAGE_TRANSFORM;
    }

    public static function get_TEXT_TRANSFORM():ConstraintGroup {
        if (TEXT_TRANSFORM == null) {
            TEXT_TRANSFORM = new ConstraintGroup( "text_transform" );
            TEXT_TRANSFORM.authorizedOperators.push(Operator.DIFFERENT);
            TEXT_TRANSFORM.constraints.push(new TextSelectConstraint());
            TEXT_TRANSFORM.constraints.push(new TextScaleConstraint());
            TEXT_TRANSFORM.constraints.push(new TextMoveConstraint());
            TEXT_TRANSFORM.constraints.push(new TextRotationConstraint());
            TEXT_TRANSFORM.constraints.push(new TextAutoResizeConstraint());
            TEXT_TRANSFORM.constraints.push(new TextCaseConstraint());
        }
        return TEXT_TRANSFORM;
    }
}
