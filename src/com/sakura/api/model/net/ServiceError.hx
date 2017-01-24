package com.sakura.api.model.net;

/**
 * @class ServiceError
 * @constructor
 **/
class ServiceError
{

    /**
     * @property ErrorCode
     * @type Int
     **/
    public var ErrorCode:Int;

    /**
     * @property Message
     * @type String
     **/
    public var Message:String;

    /**
     * @param code {Int}
     * @param message {String}
     **/
    public function new(code:Int = 0, message:String = '') {
        this.ErrorCode = code;
        this.Message = message;
    }
}
