package com.sakura.api.model.io;

@:enum abstract DocumentType(Int) from Int to Int {
    var ALBUM_PICTURE = 1;
    var HD_RENDERING = 4;
    var MULTIPLE = 9;
    var PATTERN_PICTURE = 6;
    var PRODUCT_VIEW = 5;
    var CUSTOMER_DESIGN_THUMB = 8;
    var USER_PICTURE = 7;
}