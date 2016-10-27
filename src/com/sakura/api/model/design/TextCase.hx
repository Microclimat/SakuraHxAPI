package com.sakura.api.model.design;

@:enum
abstract TextCase(String) from String to String {
    var NONE = "none";
    var UPPERCASE = "uppercase";
    var LOWERCASE = "lowercase";
}
