package com.sakura.api.model.net;
class ServiceError
{

    public var ErrorCode:Int;
    public var Message:String;

    public function new(Code:Int = 0, Message:String = '')
    {
        this.ErrorCode = Code;
        this.Message = Message;
    }

}
