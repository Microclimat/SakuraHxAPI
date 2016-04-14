package com.sakura.api.model.geom;
class Vec2 extends Vec2Const {
    public function new(x:Float = 0, y:Float = 0) {
        super(x, y);
    }

    public static function swap(a:Vec2, b:Vec2):Void {
        var xa:Float = a._x;
        var ya:Float = a._y;
        a._x = b._x;
        a._y = b._y;
        b._x = xa;
        b._y = ya;
    }


    public function addSelf(pos:Vec2Const):Vec2 {
        _x += pos._x;
        _y += pos._y;
        return this;
    }

    public function addXYSelf(x:Float, y:Float):Vec2 {
        _x += x;
        _y += y;
        return this;
    }

    public function copy(pos:Vec2Const):Vec2 {
        _x = pos._x;
        _y = pos._y;
        return this;
    }

    public function copyXY(x:Float, y:Float):Vec2 {
        _x = x;
        _y = y;
        return this;
    }

/**
		 * Div
		 */

    public function divSelf(vec:Vec2Const):Vec2 {
        _x /= vec._x;
        _y /= vec._y;
        return this;
    }

    public function divXYSelf(x:Float, y:Float):Vec2 {
        _x /= x;
        _y /= y;
        return this;
    }

/**
		 * lerp
		 */

    public function lerpSelf(to:Vec2Const, t:Float):Vec2 {
        _x = _x + t * ( to._x - _x );
        _y = _y + t * ( to._y - _y );
        return this;
    }

/**
		 * Mul
		 */

    public function mulSelf(vec:Vec2Const):Vec2 {
        _x *= vec._x;
        _y *= vec._y;
        return this;
    }

    public function mulXYSelf(x:Float, y:Float):Vec2 {
        _x *= x;
        _y *= y;
        return this;
    }

    public function negateSelf():Vec2 {
        _x = -_x;
        _y = -_y;
        return this;
    }

    public function normalLeftSelf():Vec2 {
        var xr:Float = _x;
        _x = _y ;
        _y = -xr;
        return this;
    }

    public function normalRightSelf():Vec2 {
        var xr:Float = _x;
        _x = - _y ;
        _y = xr;
        return this;
    }

/**
		 * Normalize
		 */

    public function normalizeSelf():Vec2 {
        var nf:Float = 1 / Math.sqrt( _x * _x + _y * _y );
        _x *= nf;
        _y *= nf;
        return this;
    }

/**
		 * Rotate
		 */

    public function rotateSelf(rads:Float):Vec2 {
        var s:Float = Math.sin( rads );
        var c:Float = Math.cos( rads );
        var xr:Float = _x * c - _y * s;
        _y = _x * s + _y * c;
        _x = xr;
        return this;
    }

/**
		 * Spinor
		 */

    public function rotateSpinorSelf(vec:Vec2Const):Vec2 {
        var xr:Float = _x * vec._x - _y * vec._y;
        _y = _x * vec._y + _y * vec._x;
        _x = xr;
        return this;
    }

/**
		 * Scale
		 */

    public function scaleSelf(s:Float):Vec2 {
        _x *= s;
        _y *= s;
        return this;
    }

/**
		 * Sub
		 */

    public function subSelf(pos:Vec2Const):Vec2 {
        _x -= pos._x;
        _y -= pos._y;
        return this;
    }

    public function subXYSelf(x:Float, y:Float):Vec2 {
        _x -= x;
        _y -= y;
        return this;
    }

    public function zero():Vec2 {
        _x = 0;
        _y = 0;
        return this;
    }
}
