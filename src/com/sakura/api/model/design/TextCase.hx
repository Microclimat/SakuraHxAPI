package com.sakura.api.model.design;

/**
 * @class TextCase
 * @static
 **/
@:enum abstract TextCase(String) from String to String {

    /**
     * @property NONE
     * @static
     * @readonly
     * @default "none"
     **/
    var NONE = "none";

    /**
     * @property UPPERCASE
     * @static
     * @readonly
     * @default "uppercase"
     **/
    var UPPERCASE = "uppercase";

    /**
     * @property LOWERCASE
     * @static
     * @readonly
     * @default "lowercase"
     **/
    var LOWERCASE = "lowercase";
}
