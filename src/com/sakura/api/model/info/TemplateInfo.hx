/*
* SakuraEditor
* Visit http://storage.sakuradesigner.microclimat.com/apps/api/ for documentation, updates and examples.
*
* Copyright (c) 2014 microclimat, inc.
*
* Permission is hereby granted, free of charge, to any person
* obtaining a copy of this software and associated documentation
* files (the "Software"), to deal in the Software without
* restriction, including without limitation the rights to use,
* copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the
* Software is furnished to do so, subject to the following
* conditions:
*
* The above copyright notice and this permission notice shall be
* included in all copies or substantial portions of the Software.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
* OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
* HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
* OTHER DEALINGS IN THE SOFTWARE.
*/
package com.sakura.api.model.info;

/**
* TemplateInfo
* <br/>Les informations sur un template
* @author d.mouton
* @class TemplateInfo
* @constructor
*/
import com.sakura.api.model.info.AreaInfo.IAreaInfo;
import com.sakura.api.model.geom.Rectangle;
class TemplateInfo implements ITemplateInfo{
    /**
	 * La hauteur en pixel
	 * @property height
	 * @type Int
	 */
    public var height:Float;
    /**
	 * L'id
	 * @property id
	 * @type Float
	 */
    public var id:Float;
    /**
	 * Le nom
	 * @property name
	 * @type String
	 */
    public var name:String = "";
    /**
	 * La largeur en pixel
	 * @property width
	 * @type Int
	 */
    public var width:Float;

    /**
	 * La liste des Zones
	 * @property areas
	 * @type Array<AreaInfo>
	 */
    public var areas:Array<IAreaInfo>;

    /**
	 * L'url vers l'image utilisée en fond
	 * @property backgroundUrl
	 * @type String
	 */
    public var backgroundUrl:String;

/**
	 * L'url vers l'image utilisée en premier plan
	 * @property foregroundUrl
	 * @type String
	 */
    public var foregroundUrl:String;

    /**
	 * L'url vers l'image utilisée comme masque
	 * @property maskUrl
	 * @type String
	 */
    public var maskUrl:String;


/**
	 * L'url vers l'image utilisée comme background imprimable
	 * @property templateBackgroundUrl
	 * @type String
	 */
    public var templateBackgroundUrl:String;

/**
	 * L'url vers l'image utilisée comme foreground imprimable
	 * @property templateForegroundUrl
	 * @type String
	 */
    public var templateForegroundUrl:String;

/**
	 * L'url vers l'image utilisée comme Preview du background imprimable
	 * @property templatePreviewBackgroundUrl
	 * @type String
	 */
    public var templatePreviewBackgroundUrl:String;

/**
	 * L'url vers l'image utilisée comme Preview du foreground imprimable
	 * @property templatePreviewForegroundUrl
	 * @type String
	 */
    public var templatePreviewForegroundUrl:String;

    /**
	 * Returns a rectangle representing this object's bounds in its local coordinate system
	 * @property boundingBox
	 * @type Rectangle
	 */
    public var boundingBox:Rectangle;

    public function new( ) {
        areas = new Array<IAreaInfo>();
    }
}

/**
* TemplateInfo
* <br/>Les informations sur un template
* @author d.mouton
* @class TemplateInfo
* @constructor
*/
interface ITemplateInfo {
/**
	 * La hauteur en pixel
	 * @property height
	 * @type Int
	 */
    public var height:Float;
/**
	 * L'id
	 * @property id
	 * @type Float
	 */
    public var id:Float;
/**
	 * Le nom
	 * @property name
	 * @type String
	 */
    public var name:String = "";
/**
	 * La largeur en pixel
	 * @property width
	 * @type Int
	 */
    public var width:Float;

/**
	 * La liste des Zones
	 * @property areas
	 * @type Array<AreaInfo>
	 */
    public var areas:Array<IAreaInfo>;

/**
	 * Returns a rectangle representing this object's bounds in its local coordinate system
	 * @property boundingBox
	 * @type Rectangle
	 */
    public var boundingBox:Rectangle;

/**
	 * L'url vers l'image utilisée en fond
	 * @property backgroundUrl
	 * @type String
	 */
    public var backgroundUrl:String;

/**
	 * L'url vers l'image utilisée en premier plan
	 * @property foregroundUrl
	 * @type String
	 */
    public var foregroundUrl:String;

/**
	 * L'url vers l'image utilisée comme masque
	 * @property maskUrl
	 * @type String
	 */
    public var maskUrl:String;


/**
	 * L'url vers l'image utilisée comme background imprimable
	 * @property templateBackgroundUrl
	 * @type String
	 */
    public var templateBackgroundUrl:String;

/**
	 * L'url vers l'image utilisée comme foreground imprimable
	 * @property templateForegroundUrl
	 * @type String
	 */
    public var templateForegroundUrl:String;

/**
	 * L'url vers l'image utilisée comme Preview du background imprimable
	 * @property templatePreviewBackgroundUrl
	 * @type String
	 */
    public var templatePreviewBackgroundUrl:String;

/**
	 * L'url vers l'image utilisée comme Preview du foreground imprimable
	 * @property templatePreviewForegroundUrl
	 * @type String
	 */
    public var templatePreviewForegroundUrl:String;

}
