package com.sakura.api.model.design;
@:enum abstract ElementType(String) from String to String  {
    var PICTURE:String = 'picture';
    var TEXT:String = 'text';
    var AREA:String = 'area';
    var TEMPLATE:String = 'template';
}
