package com.sakura.api.model.design;

import org.tamina.utils.UID;

/**
 * ...
 * @author David Mouton
 */

class IdentifableObject 
{
	public var id:Float;
	public var name:String;

	public function new(id:Float = 0, name:String = "") 
	{
		if ( id != 0 )
		{
			this.id = id;
		}
		else
		{
			this.id = UID.getUID();
		}
		this.name = name;
	}
	
}