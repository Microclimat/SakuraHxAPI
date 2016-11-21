package com.sakura.api.model.design;

enum MergeOptions {
	// Default
	All;

	// Do not merge
	None;

	// Merge these templates
	Whitelist(indexes:Array<Int>);

	// Merge all but these templates
	Blacklist(indexes:Array<Int>);
}
