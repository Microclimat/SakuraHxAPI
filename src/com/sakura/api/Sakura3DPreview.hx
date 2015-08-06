package com.sakura.api;

@:native("Sakura3DPreview")
extern class Sakura3DPreview {
    public function new(targetDivId:String, host:String):Void;
    public function rotate(value:Float):Void;
}
