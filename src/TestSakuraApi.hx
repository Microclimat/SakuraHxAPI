package ;
import com.sakura.api.Sakura3DPreview;
import com.sakura.api.SakuraIO;
import com.sakura.api.SakuraEditor;
class TestSakuraApi {
    public function new() {
    }

    public static function main():Void{
        trace('TestSakuraApi');
        SakuraEditor.getInstance();
        SakuraIO.closeInstagramAuth();
        var preview = new Sakura3DPreview("kjhkj","hkjhkj");
    }
}
