package com.sakura.api.io;

import org.tamina.log.LogLevel;
import haxe.ExifData;
import com.sakura.api.model.net.ServiceError;
import com.sakura.api.model.design.CustomerDesign;
import com.sakura.api.model.design.Pattern;
import com.sakura.api.model.io.DocumentType;
import com.sakura.api.model.design.Picture;
import js.html.ProgressEvent;
import js.Error;
import msignal.Signal;
import org.tamina.net.URL;
import org.tamina.events.Event;
import js.html.InputElement;
import js.html.AnchorElement;
import js.html.Event;
import js.html.Image;
import js.html.Blob;
import js.html.CanvasElement;
import haxe.MimeType;

@:native("SakuraIO")
extern class SakuraIO {
    public static function dispatchEvent(event:org.tamina.events.Event<IOEventType>):Void;
    public static function handleFileSelect(input:InputElement, callBack:Image -> IOError -> Void, maxFileSize:Int = -1, cleanInputValue:Bool = true, ?startLoadingCallBack : String->Void):Void;
    public static function fileChangeHandler(evt:Event):Void;
    public static function initExternalAuth(link:AnchorElement, provider:ExternalImageProviderType):Void;
    public static function closeInstagramAuth():Void;
    public static function sendLocal(key:String, value:String):Void;
    public static function watchLocal(key:String):Void;
    public static function addEventListener(type:String,listener:org.tamina.events.Event<String>->Void):Void;
    public static function setConfig(config:SakuraIOConfig):Void;
    public static function createPatternProxyInstance():PatternProxy;
    public static function createIOProxyInstance():IOProxy;
    public static function createAlbumProxyInstance():AlbumProxy;
    public static function setSakuraApiURL(apiUrl:URL):Void;
    public static function handleBlobFileSelect(input:InputElement, callBack:FileLoadResponse -> Void, maxFileSize:Int = -1, cleanInputValue:Bool = true):Void;

}

interface AlbumProxy {
    public var albumNameChangeSignal:Signal0;
    public var addAlbumCompleteSignal:Signal1<Int>;
    public var pictureAddedToAlbumSignal:Signal1<IPicture>;
    public var imageRemovedFromAlbumSignal:Signal1<Float>;
    public var clientAlbumsCompleteSignal:Signal1<Array<Album>>;
    public var errorSignal:Signal1<ServiceError>;
    public var progressSignal:Signal1<ProgressEvent>;
    public function addPictureToAlbum(picture:IPicture, albumId:Int):Void;
    public function removeImageFromAlbum(imageId:Float, albumId:Int,clientId:String):Void;
    public function addAlbum(albumName:String, clientId:String):Void;
    public function renameAlbum(albumId:Int, name:String):Void;
    public function getAlbumsByClientId(clientId:String):Void;
}

interface IOProxy {
    public var getTokenCompleteSignal:Signal2<String,ExternalAuthType>;
    public var uploadImageCompleteSignal:Signal1<String>;
    public var getImageDataCompleteSignal:Signal1<String>;
    public var errorSignal:Signal1<ServiceError>;
    public var progressSignal:Signal1<ProgressEvent>;
    public function getToken(requestOrigin:String,type:ExternalAuthType):Void;
    public function uploadImage( imageData:String, type:DocumentType, extension:String ):Float;
    public function uploadBlob(blob:Blob, type:DocumentType, extension:String):Float;
    public function getImageData( url:URL ):Void;
    public function stop( targetCommandId:Float ):Void;
}

interface PatternProxy {
    public var getPatternCompleteSignal:Signal1<Pattern>;
    public var addCustomerDesignCompleteSignal:Signal1<AddCustomerDesignResult>;
    public var getFontsCompleteSignal:Signal1<Array<Font>>;
    public var errorSignal:Signal1<ServiceError>;
    public var progressSignal:Signal1<ProgressEvent>;
    public function getFonts():Void;
    public function addCustomerDesign(design:CustomerDesign):Void;
    public function getPatternByID(patternID:Int):Void;
    public function getCustomerDesignByID(designID:Int):Void;
    public function getCustomerDesignByHash(hash:String):Void;
}

typedef Font = {
    var Id:Int;
    var Name:String;
    var FileName:String;
    var IsPublic:String;

}

typedef IOError = {
    var code:IOErrorCode;
    var message:String;
}

typedef AddCustomerDesignResult = {
    var customerDesignID:Int;
    var previewUrl:URL;
}

interface Album {
    var id:Int;
    var name:String;
    var clientId:String;
    var content:Array<IPicture>;
}

interface ProxyEventBus {
    var serviceError:Signal1<Error>;
}

typedef SakuraIOConfig = {
    public var sakuraApiUrl:URL;
    public var apiToken:String;
    public var proxyEventBus:ProxyEventBus;
    public var logLevel:LogLevel;
}

typedef FileLoadResponse = {
    public var mimeType:MimeType;
    public var error:IOError;
    public var exif:ExifData;
    public var canvas:CanvasElement;
    public var src:String;
    public var name:String;
    public var file:Blob;
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
    var INSTAGRAM = "instagram";

    /**
	 * @property FACEBOOK
	 * @type String
	 * @static
	 * @readOnly
	 * @default "facebook"
	 */
    var FACEBOOK = "facebook";

    /**
	 * @property GOOGLE_PHOTOS
	 * @type String
	 * @static
	 * @readOnly
	 * @default "google-photos"
	 */
    var GOOGLE_PHOTOS = "google-photos";

    /**
	 * @property GENERIC
	 * @type String
	 * @static
	 * @readOnly
	 * @default "generic"
	 */
    var GENERIC = "generic";

}

@:enum abstract ExternalAuthType(String) from String to String {

    /**
	 * @property FACEBOOK
	 * @type String
	 * @static
	 * @readOnly
	 * @default "facebook"
	 */
    var FACEBOOK = 'facebook';

    /**
	 * @property INSTAGRAM
	 * @type String
	 * @static
	 * @readOnly
	 * @default "instagram"
	 */
    var INSTAGRAM = 'instagram';

    /**
	 * @property FLICKR
	 * @type String
	 * @static
	 * @readOnly
	 * @default "flickr"
	 */
    var FLICKR = 'flickr';

}

@:enum abstract IOEventType(String) from String to String {
    /**
     * @property LOCAL_DATA_UPDATE
     * @type String
     * @static
     * @readOnly
     * @default "localDataUpdate"
     */
    var LOCAL_DATA_UPDATE = "localDataUpdate";

    /**
     * @property TOKEN_UPDATE
     * @type String
     * @static
     * @readOnly
     * @default "tokenUpdate"
     */
    var TOKEN_UPDATE = "tokenUpdate";
}
