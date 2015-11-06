package com.sakura.api;

import js.html.InputElement;
import js.html.AnchorElement;
import js.html.Event;
import js.html.Image;

@:native("SakuraIO")
extern class SakuraIO {
    public static function handleFileSelect(input:InputElement, callBack:Image -> IOError -> Void, maxFileSize:Int = -1, cleanInputValue:Bool = true):Void;
    public static function fileChangeHandler(evt:Event):Void;
    public static function initExternalAuth(link:AnchorElement, provider:ExternalImageProviderType):Void;
    public static function closeInstagramAuth():Void;
    public static function sendLocal(key:String, value:String):Void;
    public static function watchLocal(key:String):Void;
    public static function addEventListener(type:String,listener:org.tamina.events.Event<String>->Void):Void;

}

typedef IOError = {
    var code:IOErrorCode;
    var message:String;
}

@:enum abstract IOErrorCode(Int) from Int to Int{

/**
	 * @property NONE
	 * @type Int
	 * @static
	 * @readOnly
	 * @default 0
	 */
    var NONE = 0;

/**
	 * @property FILE_SIZE_LIMIT_EXCEEDED
	 * @type Int
	 * @static
	 * @readOnly
	 * @default 1
	 */
    var FILE_SIZE_LIMIT_EXCEEDED = 1;

/**
	 * @property INVALID_IMAGE_FORMAT
	 * @type Int
	 * @static
	 * @readOnly
	 * @default 2
	 */
    var INVALID_IMAGE_FORMAT = 2;

}

@:enum abstract ExternalImageProviderType(String) from String to String {
/**
	 * @property INSTAGRAM
	 * @type String
	 * @static
	 * @readOnly
	 * @default "instagram"
	 */
    var INSTAGRAM   = "instagram";

/**
	 * @property FACEBOOK
	 * @type String
	 * @static
	 * @readOnly
	 * @default "FACEBOOK"
	 */
    var FACEBOOK    = "facebook";

}
