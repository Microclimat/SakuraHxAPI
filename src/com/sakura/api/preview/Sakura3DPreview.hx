package com.sakura.api.preview;

@:native("Sakura3DPreview")
extern class Sakura3DPreview {
    public function new(targetDivId:String, host:String):Void;
    public function rotate(value:Float):Void;
    public function resizeTo(contentWidth:Int, contentHeight:Int):Void;
}
