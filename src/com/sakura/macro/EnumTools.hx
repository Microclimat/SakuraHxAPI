package com.sakura.macro;
import haxe.macro.Expr;

class EnumTools {

    public static function valuesToJson(path:String):Array<Field> {
        var pos = haxe.macro.Context.currentPos();
        var fields = haxe.macro.Context.getBuildFields();
        var versions:Array<String> = new Array<String>();

        for (f in fields) {
            versions.push(EnumTools.extractValue(f));
        }

        EnumTools.toJsonFile(versions, path);

        return fields;
    }

    private static function extractValue(f:Field):String {
        switch (f.kind) {
            case FVar(t, fieldExpr):
                switch (fieldExpr.expr) {
                    case ECast(valueExpr, t):
                        switch (valueExpr.expr) {
                            case EConst(CString(value)):
                                return value;

                            default:
                        }

                    default:
                }

            default:
        }

        return null;
    }

    public static function toJsonFile(data:Dynamic, path:String):Void {
        sys.io.File.saveContent(path, haxe.Json.stringify(data));
    }

}