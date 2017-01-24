package com.sakura.api.model.design;

import com.sakura.api.model.info.PatternInfo;
import com.sakura.api.model.constraint.Constraint;

/**
 * A Pattern is a container for Templates
 * @class Pattern
 * @extends IConstricted
 * @constructor
 **/
class Pattern implements IConstricted {

    /**
     * @property DEFAULT_RESOLUTION
     * @type Int
     * @readonly
     * @static
     **/
    public static var DEFAULT_RESOLUTION(get, null):Int;

    private static function get_DEFAULT_RESOLUTION():Int { return 150; }

    /**
     * @property id
     * @type Float
     **/
    public var id:Float;

    /**
     * @property name
     * @type String
     **/
    public var name:String;

    /**
     * @property constraints
     * @type Array<Contraint>
     **/
    public var constraints:Array<Constraint>;

    /**
     * @property description
     * @type String
     **/
    public var description:String;

    /**
     * @property enabled
     * @type Bool
     * @default true
     **/
    public var enabled:Bool = true;

    /**
     * @property resolution
     * @type Int
     * @default DEFAULT_RESOLUTION
     **/
    public var resolution:Int = DEFAULT_RESOLUTION;

    /**
     * @property templates
     * @type Array<Template>
     **/
    public var templates:Array<Template>;

    /**
     * @property view
     * @type ProductView
     **/
    public var view:ProductView;

    /**
     * @property outputType
     * @type String
     **/
    public var outputType:String;

    /**
     * @property margin
     * @type Int
     * @default 0
     **/
    public var margin:Int = 0;

    /**
     * @property mergeOutput
     * @type Bool
     * @default false
     **/
    public var mergeOutput:Bool = false;

    /**
     * Constructor
     * @param id {Float} Default : 0
     * @param name {String} Default : ""
     * @param description {String} Default : ""
     * @param enabled {Bool} Default : true
     **/
    public function new(id:Float = 0, name:String = "", description:String = "", enabled:Bool = true) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.templates = new Array<Template>();
        this.constraints = new Array<Constraint>();
        this.enabled = enabled;
    }

    /**
     * Fuse two patterns
     * @method merge
     * @param source {Pattern}
     * @param mergeOptions {MergeOptions}
     **/
    public function merge(source:Pattern, mergeOptions:MergeOptions):Void {
        if (source != null && mergeOptions != None) {
            for (i in 0...this.templates.length) {
                var mergeTemplate:Bool = switch (mergeOptions) {
                    case All:
                    true;

                    case None:
                    // ... we have already checked that it is not "None"... x_x
                    false;

                    case Whitelist(indexes):
                    Lambda.has(indexes, i);

                    case Blacklist(indexes):
                    !Lambda.has(indexes, i);
                }

                if (mergeTemplate) {
                    this.templates[ i ].merge(source.templates[ i ]);
                }
            }
        }
    }

    /**
     * Creates a clone of this, and returns it. The result will have the same id than the source.
     * @method clone
     * @param copy {Bool} used to determine the attributes' ids (constraints, templates...). See Constraint.clone
     * @return result {Pattern}
     **/
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

    /**
     * Generates a {PatternInfo} from current pattern data
     * @method toInfo
     * @return info {PatternInfo}
     **/
    public function toInfo():PatternInfo {
        var result = new PatternInfo();
        result.id = id;
        result.name = name;
        result.templateWidth = templates[0].width;
        result.templateHeight = templates[0].height;
        result.asPreview = this.view != null;

        for (i in 0...templates[0].content.length) {
           result.areas.push(templates[0].content[i].toInfo());
        }

        for (i in 0...templates.length) {
            result.templates.push(templates[i].toInfo());
        }

        for (i in 0...constraints.length) {
            result.constraints.push(constraints[i].clone());
        }

        return result;
    }
}
