package com.sakura.api.model.io;
import org.tamina.display.Align;
import org.tamina.display.ScaleMode;
import org.tamina.display.FillMode;
class AddImageOptions {

    public var fill:FillMode;
    public var scale:ScaleMode;
    public var align:Align;

    public function new(fill:FillMode, scale:ScaleMode, align:Align) {
        this.fill = fill;
        this.scale = scale;
        this.align = align;
    }

}

