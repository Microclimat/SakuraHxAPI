package com.sakura.api.model.net;

/**
 * @class ServiceError
 * @constructor
 **/
class ServiceError {

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
     * @property Name
     * @type String
     **/
    public var Name:String;

    /**
     * @property Stack
     * @type String
     **/
    public var Stack:String;

    /**
     * @property RequestContent
     * @type String
     **/
    public var RequestContent:String;

    /**
     * @property RequestUrl
     * @type String
     **/
    public var RequestUrl:String;

    /**
     * @param code {Int}
     * @param message {String}
     **/
    public function new(code:Int = 0, message:String = '', name:String = '', stack:String = '', requestContent:String = '', requestUrl:String = '') {
        this.ErrorCode = code;
        this.Message = message;
        this.Name = name;
        this.Stack = stack;
        this.RequestContent = requestContent;
        this.RequestUrl = requestUrl;
    }
}
