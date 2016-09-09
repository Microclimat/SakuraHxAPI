package ;
import com.sakura.api.model.design.Text;
import com.sakura.api.model.design.CustomerDesign;
import com.sakura.api.preview.Sakura3DPreview;
import com.sakura.api.io.SakuraIO;
import com.sakura.api.editor.SakuraEditor;
class TestSakuraApi {
    public function new() {
    }

    public static function main():Void{
        trace('TestSakuraApi');
        SakuraEditor.getInstance();
        SakuraIO.closeInstagramAuth();
        var preview = new Sakura3DPreview("kjhkj","hkjhkj");
        var a = new CustomerDesign();
        var t = new Text();
    }
}
