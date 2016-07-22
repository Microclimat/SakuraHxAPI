package com.sakura.api.model.net;
import org.tamina.net.URL;
import haxe.ds.StringMap;
import haxe.Scheme;
class Host {

    public static var scheme:Scheme = Scheme.HTTP;
    public static var version:Version =Version.LATEST;

    private static var _urls:StringMap<UrlPair>;
    private static var _apiUrls:StringMap<UrlPair>;

    public static function getURL(host:HostName):URL {
        var result:URL = null;
        var pair = getURLList().get(host);
        if (pair != null) {
            if (scheme == Scheme.HTTP) {
                result = pair.http;
            } else {
                result = pair.https;
            }
            result = new URL(result.path+'/'+version);
        }
        return result;
    }

    public static function getVersion(version:Version):Version {
        var result = version;
        if(version == Version.LATEST){
            result = Version.V4;
        } else if(version == Version.NEXT){
            result = Version.V5;
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
            _urls.set(HostName.PROD,new UrlPair('http://cdn.heidi.tech','https://cdn.heidi.tech'));
            _urls.set(HostName.PREPROD,new UrlPair('http://preprod-cdn.heidi.tech:8084','https://preprod-cdn.heidi.tech:8093'));
            _urls.set(HostName.STAGING,new UrlPair('http://staging-cdn.heidi.tech','https://staging-cdn.heidi.tech'));
            _urls.set(HostName.QUALIF,new UrlPair('http://qualif-cdn.heidi.tech:8084','https://qualif-cdn.heidi.tech:8093'));
            _urls.set(HostName.DEV,new UrlPair('http://local.heidi.tech:8686','https://local.heidi.tech:8888'));
            _urls.set(HostName.LOCAL,new UrlPair('http://local.heidi.tech:8686','https://local.heidi.tech:8888'));
        }
        return _urls;
    }

    private static function getApiURLList():StringMap<UrlPair> {
        if(_apiUrls == null){
            _apiUrls = new StringMap<UrlPair>();
            _apiUrls.set(HostName.PROD, new UrlPair('http://api.heidi.tech/Api.svc', 'https://api.heidi.tech/Api.svc'));
            _apiUrls.set(HostName.STAGING, new UrlPair('http://staging-api.heidi.tech/Api.svc', 'https://staging-api.heidi.tech/Api.svc'));
            _apiUrls.set(HostName.PREPROD, new UrlPair('http://preprod-api.heidi.tech:8091/Api.svc', 'https://preprod-api.heidi.tech:8092/Api.svc'));
            _apiUrls.set(HostName.QUALIF, new UrlPair('http://qualif-api.heidi.tech:8091/Api.svc', 'https://qualif-api.heidi.tech:8092/Api.svc'));
            _apiUrls.set(HostName.LOCAL, new UrlPair('http://localhost:2058/Api.svc', 'https://localhost:40300/Api.svc'));
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

    var PROD = 'prod';
    var PREPROD = 'preprod';
    var STAGING = 'staging';
    var QUALIF = 'qualif';
    var DEV = 'dev';
    var LOCAL = 'local';

}

#if !macro
@:build(com.sakura.macro.EnumTools.valuesToJson("./versions.json"))
@:enum abstract Version(String) from String to String  {

    var LATEST = 'latest';
    var NEXT = 'next';
    var V3 = 'v3';
    var V4 = 'v4';
    var V5 = 'v5';

}
#end
