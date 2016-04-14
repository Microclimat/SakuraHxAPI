package com.sakura.api.model.design;
import js.html.Image;

/**
 * ...
 * @author David Mouton
 */

class SDPicture 
{

    public var displayScale:Float = 1.0;
    public var width:Float = 1;
    public var height:Float = 1;
    public var source:Image;

	public function new( displayScale:Float = 1.0,width:Float=1.0,height:Float = 1.0, source:Image = null)
	{
		this.displayScale = displayScale;
        this.width = width;
        this.height = height;
        this.source = source;
	}
	
	public function clone():SDPicture
	{
		var result:SDPicture = new SDPicture(this.displayScale,this.width,this.height, this.source);
		return result;
	}
}