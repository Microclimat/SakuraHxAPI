package com.sakura.api.model.constraint;
import org.tamina.utils.UID;

class AlbumConstraint extends Constraint {
    static public var NAME(get_NAME, null):String;

    private static function get_NAME():String { return "album"; }

    public function new(operator:Operator = null, albumID:Int = -1) {
        super(ConstraintGroup.ALBUM.name, NAME, operator, Std.string(albumID));
    }

    override public function clone(copy:Bool = false):AlbumConstraint {
        var cloneID:Float = UID.getUID();
        if (copy) {
            cloneID = this.id;
        }
        var result = new AlbumConstraint( operator, Std.parseInt(value) );
        result.id = cloneID;
        return result;
    }
}
