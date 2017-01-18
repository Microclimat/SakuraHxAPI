package com.sakura.api.model.io;

import haxe.Json;

import org.tamina.display.Align;
import org.tamina.display.FillMode;
import org.tamina.display.ScaleMode;
import org.tamina.log.QuickLogger;

/**
 * @class AddImageOptions
 **/
class AddImageOptions {

    public var fill:FillMode;
    public var scale:ScaleMode;
    public var align:Align;

    /**
     * Constructor
     * @param fill {FillMode}
     * @param scale {ScaleMode}
     * @param align {Align}
     **/
    public function new(fill:FillMode, scale:ScaleMode, align:Align) {
        this.fill = fill;
        this.scale = scale;
        this.align = align;
    }

    /**
     * @method toString
     * @return json {String}
     **/
    public function toString():String {
        try {
            return Json.stringify({
                fill: fill,
                scale: scale,
                align: align
            });
        } catch(e:Dynamic) {
            QuickLogger.error(e);

            return null;
        }
    }

    /**
     * Builds a AddImageOptions from a json string
     * @method fromString
     * @param optionsStr {String}
     * @return options {AddImageOptions}
     **/
    public static function fromString(optionsStr:String):AddImageOptions {
        try {
            var options:AddImageOptions = cast Json.parse(optionsStr);

            return new AddImageOptions(options.fill, options.scale, options.align);
        } catch(e:Dynamic) {
            QuickLogger.error(e);

            return null;
        }
    }

}

