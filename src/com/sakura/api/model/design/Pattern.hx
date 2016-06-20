package com.sakura.api.model.design;
import com.sakura.api.model.info.PatternInfo;
import com.sakura.api.model.constraint.Constraint;
class Pattern {

    public static var DEFAULT_RESOLUTION(get, null):Int;

    private static function get_DEFAULT_RESOLUTION():Int { return 150; }

    public var id:Float;
    public var name:String;

    public var constraints:Array<Constraint>;
    public var description:String;
    public var enabled:Bool = true;
    public var resolution:Int = DEFAULT_RESOLUTION;
    public var templates:Array<Template>;
    public var view:ProductView;
    public var outputType:String;
    public var margin:Int=0;
    public var mergeOutput:Bool = false;

    public function new(id:Float = 0, name:String = "", description:String = "", enabled:Bool = true) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.templates = new Array<Template>();
        this.constraints = new Array<Constraint>();
        this.enabled = enabled;
    }

    public function merge(source:Pattern):Void {
        if (source != null) {
            for (i in 0...this.templates.length) {
                this.templates[ i ].merge(source.templates[ i ]);
            }
        }
    }

    public function clone(copy:Bool = false):Pattern {
        var result = new Pattern(this.id, this.name, this.description, this.enabled);
        result.resolution = this.resolution;
        result.margin = this.margin;
        result.mergeOutput = this.mergeOutput;

        for (constraint in this.constraints) {
            result.constraints.push( constraint.clone(copy));

        }
        for (template in this.templates) {
            var clonedTemplate = template.clone(copy);
            clonedTemplate.root = this;
            result.templates.push(clonedTemplate);

        }
        if (this.view != null) {
            result.view = this.view.clone(copy);
        }

        result.outputType = this.outputType;
        return result;
    }

    public function toInfo():PatternInfo{
        var result = new PatternInfo();
        result.id = id;
        result.name = name;
        result.templateWidth = templates[0].width;
        result.templateHeight = templates[0].height;
        result.asPreview = this.view != null;
        for(i in 0...templates[0].content.length){
           result.areas.push( templates[0].content[i].toInfo());
        }
        for(i in 0...templates.length){
            result.templates.push( templates[i].toInfo());
        }
        for(i in 0...constraints.length){
            result.constraints.push(constraints[i].clone());
        }
        return result;
    }
}
