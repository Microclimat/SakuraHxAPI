package com.sakura.api.model.design;

import org.tamina.utils.UID;

/**
 * @class IdentifableObject
 * @constructor
 * @author David Mouton
 */
class IdentifableObject {

    /**
	 * @property id
	 * @type Float
     **/
	public var id:Float;

    /**
	 * @property name
	 * @type String
     **/
	public var name:String;

    /**
     * @param id {Float}
     * @param name {String}
     **/
	public function new(id:Float = 0, name:String = "") {
		if (id != 0) {
			this.id = id;
		} else {
			this.id = UID.getUID();
		}

		this.name = name;
	}
}