package com.sakura.api.model.geom;
class Vec2Const {

    public static var Epsilon:Float = 0.0000001;
    public static var EpsilonSqr:Float = Epsilon * Epsilon;
    public static var Zero:Vec2Const = new Vec2Const();

    private static var _RadsToDeg:Float = 180 / Math.PI;

    private var _x:Float;
    public var x(get, set):Float;
    private var _y:Float;
    public var y(get, set):Float;


    public function new(x:Float = 0, y:Float = 0) {
        _x = x;
        _y = y;
    }

    private function get_x():Float {
        return _x;
    }

    private function set_x(value:Float):Float {
        return _x = value;
    }

    private function get_y():Float {
        return _y;
    }

    private function set_y(value:Float):Float {
        return _y = value;
    }

    public function add(pos:Vec2Const):Vec2 {
        return new Vec2( _x + pos._x, _y + pos._y );
    }

    public function addXY(x:Float, y:Float):Vec2 {
        return new Vec2( _x + x, _y + y );
    }

    public function clone():Vec2 {
        return new Vec2( _x, _y );
    }

/**
		 * Cross determinant
		 */

    public function crossDet(vec:Vec2Const):Float {
        return _x * vec._y - _y * vec._x;
    }

    public function crossDetXY(x:Float, y:Float):Float {
        return _x * y - _y * x;
    }

    public function distance(vec:Vec2Const):Float {
        var xd:Float = _x - vec._x;
        var yd:Float = _y - vec._y;
        return Math.sqrt(xd * xd + yd * yd);
    }

    public function distanceSqr(vec:Vec2Const):Float {
        var xd:Float = _x - vec._x;
        var yd:Float = _y - vec._y;
        return xd * xd + yd * yd;
    }

    public function distanceXY(x:Float, y:Float):Float {
        var xd:Float = _x - x;
        var yd:Float = _y - y;
        return Math.sqrt(xd * xd + yd * yd);
    }

    public function distanceXYSqr(x:Float, y:Float):Float {
        var xd:Float = _x - x;
        var yd:Float = _y - y;
        return xd * xd + yd * yd;
    }

    public function div(vec:Vec2Const):Vec2 {
        return new Vec2( _x / vec._x, _y / vec._y );
    }

    public function divXY(x:Float, y:Float):Vec2 {
        return new Vec2( _x / x, _y / y );
    }

/**
		 * Dot product
		 */

    public function dot(vec:Vec2Const):Float {
        return _x * vec._x + _y * vec._y;
    }

    public function dotXY(x:Float, y:Float):Float {
        return _x * x + _y * y;
    }

/**
		 * Queries.
		 */

    public function equals(vec:Vec2Const):Bool {
        return _x == vec._x && _y == vec._y;
    }

    public function equalsXY(x:Float, y:Float):Bool {
        return _x == x && _y == y;
    }

    public function getDegrees():Float {
        return getRads() * _RadsToDeg;
    }

    public function getRads():Float {
        return Math.atan2(_y, _x);
    }

    public function isNear(vec2:Vec2Const):Bool {
        return distanceSqr(vec2) < EpsilonSqr;
    }

    public function isNearXY(x:Float, y:Float):Bool {
        return distanceXYSqr(x, y) < EpsilonSqr;
    }

    public function isNormalized():Bool {
        return Math.abs(( _x * _x + _y * _y ) - 1) < EpsilonSqr;
    }

    public function isValid():Bool {
        return !Math.isNaN(_x) && !Math.isNaN(_y) && Math.isFinite(_x) && Math.isFinite(_y);
    }

    public function isWithin(vec2:Vec2Const, epsilon:Float):Bool {
        return distanceSqr(vec2) < epsilon * epsilon;
    }

    public function isWithinXY(x:Float, y:Float, epsilon:Float):Bool {
        return distanceXYSqr(x, y) < epsilon * epsilon;
    }

    public function isZero():Bool {
        return _x == 0 && _y == 0;
    }

/**
		 * Distance
		 */

    public function length():Float {
        return Math.sqrt(_x * _x + _y * _y);
    }

    public function lengthSqr():Float {
        return _x * _x + _y * _y;
    }

/**
		 * Lerp / slerp
		 * Note: Slerp is not well tested yet.
		 */

    public function lerp(to:Vec2Const, t:Float):Vec2 {
        return new Vec2( _x + t * ( to._x - _x ), _y + t * ( to._y - _y ) );
    }

    public function mul(vec:Vec2Const):Vec2 {
        return new Vec2( _x * vec._x, _y * vec._y );
    }

    public function mulXY(x:Float, y:Float):Vec2 {
        return new Vec2( _x * x, _y * y );
    }

    public function negate():Vec2 {
        return new Vec2( -_x, -_y );
    }

    public function normalLeft():Vec2 {
        return new Vec2( _y, -_x );
    }

    public function normalRight():Vec2 {
        return new Vec2( -_y, _x );
    }

/**
		 * Normalize
		 */

    public function normalize():Vec2 {
        var nf:Float = 1 / Math.sqrt(_x * _x + _y * _y);
        return new Vec2( _x * nf, _y * nf );
    }

/**
		 * Reflect
		 */

    public function reflect(normal:Vec2Const):Vec2 {
        var d:Float = 2 * ( _x * normal._x + _y * normal._y );
        return new Vec2( _x - d * normal._x, _y - d * normal._y );
    }

/**
		 * Rotate
		 */

    public function rotate(rads:Float):Vec2 {
        var s:Float = Math.sin(rads);
        var c:Float = Math.cos(rads);
        return new Vec2( _x * c - _y * s, _x * s + _y * c );
    }

/**
		 * Spinor rotation
		 */

    public function rotateSpinor(vec:Vec2Const):Vec2 {
        return new Vec2( _x * vec._x - _y * vec._y, _x * vec._y + _y * vec._x );
    }

/**
		 * Scale
		 */

    public function scale(s:Float):Vec2 {
        return new Vec2( _x * s, _y * s );
    }

    public function slerp(vec:Vec2Const, t:Float):Vec2 {
        var cosTheta:Float = dot(vec);
        var theta:Float = Math.acos(cosTheta);
        var sinTheta:Float = Math.sin(theta);
        if (sinTheta <= Epsilon)
            return vec.clone();
        var w1:Float = Math.sin(( 1 - t ) * theta) / sinTheta;
        var w2:Float = Math.sin(t * theta) / sinTheta;
        return scale(w1).add(vec.scale(w2));
    }

    public function spinorBetween(vec:Vec2Const):Vec2 {
        var d:Float = lengthSqr();
        var r:Float = ( vec._x * _x + vec._y * _y ) / d;
        var i:Float = ( vec._y * _x - vec._x * _y ) / d;
        return new Vec2( r, i );
    }

    public function sub(pos:Vec2Const):Vec2 {
        return new Vec2( _x - pos._x, _y - pos._y );
    }

    public function subXY(x:Float, y:Float):Vec2 {
        return new Vec2( _x - x, _y - y );
    }

/**
		 * String
		 */

    public function toString():String {
        return "[" + _x + ", " + _y + "]";
    }
}
