package com.sakura.api.model.net;
import org.tamina.net.URL;
import haxe.ds.StringMap;
import haxe.Scheme;
class Host {

    public static var scheme:Scheme = Scheme.HTTP;

    private static var _urls:StringMap<UrlPair>;
    private static var _apiUrls:StringMap<UrlPair>;

    public static function getURL(host:HostName):URL {
        var result = null;
        var pair = getURLList().get(host);
        if(pair != null){
            if(scheme == Scheme.HTTP){
                result = pair.http;
            } else {
                result = pair.https;
            }
        }
        return result;
    }

    public static function getApiURL(host:HostName):URL {
        var result = null;
        var pair = getApiURLList().get(host);
        if(pair != null){
            if(scheme == Scheme.HTTP){
                result = pair.http;
            } else {
                result = pair.https;
            }
        }
        return result;
    }

    private static function getURLList():StringMap<UrlPair> {
        if(_urls == null){
            _urls = new StringMap<UrlPair>();
            _urls.set(HostName.PROD,new UrlPair('http://storage.sakuradesigner.microclimat.com/apps','https://storage.sakuradesigner.microclimat.com/apps'));
            _urls.set(HostName.PREPROD,new UrlPair('http://preprod-cdn.heidi.tech:8084/apps','https://preprod-cdn.heidi.tech:8093/apps'));
            _urls.set(HostName.NEXT,new UrlPair('http://preprod-cdn.heidi.tech:8084/next','https://preprod-cdn.heidi.tech:8093/next'));
            _urls.set(HostName.REMOTE,new UrlPair('http://192.168.119.98:8686/sakuraHx/apps','https://192.168.119.98:8888/sakuraHx/apps'));
            _urls.set(HostName.DEV,new UrlPair('http://localhost:8686/sakuraHx/apps','http://localhost:8686/sakuraHx/apps'));
            _urls.set(HostName.LOCAL,new UrlPair('http://localhost:8686/sakuraHx/apps','http://localhost:8686/sakuraHx/apps'));
        }
        return _urls;
    }

    private static function getApiURLList():StringMap<UrlPair> {
        if(_apiUrls == null){
            _apiUrls = new StringMap<UrlPair>();
            _apiUrls.set(HostName.PROD,new UrlPair('http://api.heidi.tech/Api.svc','https://api.heidi.tech/Api.svc'));
            _apiUrls.set(HostName.PREPROD,new UrlPair('http://preprod-api.heidi.tech:8091/Api.svc','https://preprod-api.heidi.tech:8092/Api.svc'));
            _apiUrls.set(HostName.LOCAL,new UrlPair('http://localhost:2058/Api.svc','https://localhost:40300/Api.svc'));
        }
        return _apiUrls;
    }
}

class UrlPair {
    public var http:URL;
    public var https:URL;

    public function new(http:String,https:String){
        this.http = new URL(http);
        this.https = new URL(https);
    }

}

@:enum abstract HostName(String) from String to String  {

    var PREPROD = 'preprod';
    var NEXT = 'next';
    var PROD = 'prod';
    var REMOTE = 'remote';
    var DEV = 'dev';
    var LOCAL = 'local';

}
