package com.sakura.api.model.design;

/**
 * @class MergeOptions
 **/
enum MergeOptions {

	/**
	 * Default
	 * @property All literal
	 **/
	All;

	/**
	 * Do not merge
	 * @property None literal
	 **/
	None;

	/**
	 * Merge these templates
	 * @property Whitelist literal
	 * @param indexes Array<Int>
	 **/
	Whitelist(indexes:Array<Int>);

	/**
	 * Merge all but these templates
	 * @property Blacklist literal
	 * @param indexes Array<Int>
	 **/
	Blacklist(indexes:Array<Int>);
}
