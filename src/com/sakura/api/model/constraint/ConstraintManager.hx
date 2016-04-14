package com.sakura.api.model.constraint;
import com.sakura.api.model.design.Picture;
import com.sakura.api.model.design.Text;
import com.sakura.config.PropertyValue;
import com.sakura.config.SkinProperty;
import com.sakura.config.Config;
import js.Error;
import com.sakura.api.model.design.Pattern;
import com.sakura.api.model.constraint.ConstraintValidationResult;
import com.sakura.api.model.design.Area;

/**
 * Manager de constrainte
 * @class ConstraintManager
 */
@:keep class ConstraintManager {

    public static var instance(get, null):ConstraintManager;
    private static var _instance:ConstraintManager;

    public var pattern:Pattern;

    private function new() {
    }

    private static function get_instance():ConstraintManager {
        if (_instance == null) {
            _instance = new ConstraintManager();
        }
        return _instance;
    }


/**
	 * Indique si une zone peut recevoir une image
	 * @method canAddPictureToArea
	 * @param	target {Area} la zone cible
	 * @return result {Bool}
	 */

    public function canAddPictureToArea(target:Area):Bool {
        var result = true;
        var currentImageNumber = 0;
        if (target.content != null) {
            for (element in target.content) {
                var image:Picture = cast element;
                if (image.quality != null) {
                    currentImageNumber++;
                }
            }
        }
        if (target.constraints != null) {
            for (i in 0...target.constraints.length) {
                var c = target.constraints[i];
                if (c.name == ImageNumberConstraint.NAME && c.operator == Operator.LESS && currentImageNumber >= Std.parseInt(c.value)) {
                    result = false;
                }
                if (c.name == ImageNumberConstraint.NAME && c.operator == Operator.EQUAL && c.value == '0') {
                    result = false;
                }
                if (c.name == AllImageConstraint.NAME && c.operator == Operator.DIFFERENT) {
                    result = false;
                }
            }
        }
        return result;
    }

/**
	 * Indique si une zone peut recevoir du texte
	 * @method canAddTextToArea
	 * @param	target {Area} la zone cible
	 * @return result {Bool}
	 */

    public function canAddTextToArea(target:Area):Bool {
        var result = true;
        var currentTextNumber = 0;
        if (target.content != null) {
            for (element in target.content) {
                var txt:Text = cast element;
                if (txt.label != null) {
                    currentTextNumber++;
                }
            }
        }
        if (target.constraints != null) {
            for (i in 0...target.constraints.length) {
                var c = target.constraints[i];
                if (c.name == TextNumberConstraint.NAME && c.operator == Operator.LESS && currentTextNumber >= Std.parseInt(c.value)) {
                    result = false;
                }
                if (c.name == TextNumberConstraint.NAME && c.operator == Operator.EQUAL && c.value == '0') {
                    result = false;
                }
                if (c.name == TextConstraint.NAME && c.operator == Operator.DIFFERENT) {
                    result = false;
                }
            }
        }
        return result;
    }

/**
	 * Indique un Text peut etre mis à jour avec un label
	 * @method canUpdateTextLabel
	 * @param	text {Text} le Text
	 * @param	label {String} le label
	 * @return result {Bool}
	 */

    public function canUpdateTextLabel(text:Text, label:String):Bool {
        var result = true;
        var charLimit = getTextMaxSize(text);
        if (charLimit >= 0) {
            result = label.length < charLimit;
        }
        return result;
    }

/**
	 * Indique si il est possible d'appliquer des filtres aux images d'une zone
	 * @method canApplyFilters
	 * @param	target {Area} la zone ciblée
	 * @return result {Bool}
	 */

    public function canApplyFilters(target:Area):Bool {
        var result = true;
        if (target.constraints != null) {
            for (i in 0...target.constraints.length) {
                var c = target.constraints[i];
                if (c.name == ImageFilterConstraint.NAME && c.operator == Operator.DIFFERENT) {
                    result = false;
                }
            }
        }
        return result;
    }

/**
	 * Retourne la liste des Fonts utilisables dans la zone
	 * @method getAvailableFonts
	 * @param	target {Area} la zone ciblée
	 * @param	fonts {Array<String>} la liste des Fonts souhaitées
	 * @return result {Array<String>}
	 */

    public function getAvailableFonts(target:Area, fonts:Array<String>):Array<String> {
        var result:Array<String> = fonts;
        if (target.constraints != null) {
            for (i in 0...target.constraints.length) {
                var c = target.constraints[i];
                if (c.name == FontConstraint.NAME && c.operator == Operator.EQUAL) {
                    result = [c.value];
                }
            }
        }
        return result;
    }

/**
	 * Retourne la liste des couleurs utilisables dans la zone
	 * @method getAvailableColors
	 * @param	target {Area} la zone ciblée
	 * @param	colors {Array<String>} la liste des couleurs souhaitées
	 * @return result {Array<String>}
	 */

    public function getAvailableColors(target:Area, colors:Array<String>):Array<String> {
        var result:Array<String> = colors;
        if (target.constraints != null) {
            for (i in 0...target.constraints.length) {
                var c = target.constraints[i];
                if (c.name == FontColorConstraint.NAME && c.operator == Operator.EQUAL) {
                    result = [c.value];
                }
            }
        }
        return result;
    }

/**
	 * Retourne la liste des tailles de texte disponibles
	 * @method getAvailableSizes
	 * @param	target {Area} la zone ciblée
	 * @return result {Array<Int>}
	 */

    public function getAvailableSizes(target:Area):Array<Int> {
        var result:Array<Int> = [];
        if (target.constraints != null) {
            for (i in 0...target.constraints.length) {
                var c = target.constraints[i];
                if (c.name == FontSizeConstraint.NAME && c.operator == Operator.EQUAL) {
                    result = [Std.parseInt(c.value)];
                }
                if (c.name == FontSizeConstraint.NAME && c.operator == Operator.INCLUDE) {
                    result.push(Std.parseInt(c.value));
                }
            }
        }
        return result;
    }

    public function getTextMaxSize(text:Text):Int {
        var result = -1;
        if (text.parent.constraints != null) {
            for (i in 0...text.parent.constraints.length) {
                var c = text.parent.constraints[i];
                if (c.name == CharNumberConstraint.NAME && c.operator == Operator.LESS) {
                    var charLimit = Std.parseInt(c.value);
                    result = charLimit;
                }

            }
        }
        return result;
    }

/**
	 * Valide le patron courant
	 * @method validatePattern
	 * @return result {ConstraintGroupValidationResult}
	 */

    public function validatePattern():ConstraintGroupValidationResult {
        var result:ConstraintGroupValidationResult = new ConstraintGroupValidationResult();

        if (pattern == null) {
            throw new ReferenceError("Pattern vide");
        } else {
            var areas = getAllArea();
            for (i in 0...areas.length) {
                var areaConstraintValidationResult = areas[i].validateConstraints();
                if (!areaConstraintValidationResult.result) {
                    result.result = false;
                }
                result.constraints = result.constraints.concat(areaConstraintValidationResult.constraints);
            }
        }
        return result;
    }

/**
	 * Indique si il est possible de déplacer les élements d'une zone
	 * @method canMoveAreaElements
	 * @param	target {Area} la zone cible
	 * @return result {Bool}
	 */

    public function canMoveAreaElements(target:Area):Bool {
        var result = Config.instance.skin.getProperty(SkinProperty.MOVE) != PropertyValue.FALSE;
        if (target.constraints != null) {
            for (i in 0...target.constraints.length) {
                var c = target.constraints[i];
                if (c.name == MoveConstraint.NAME && c.operator == Operator.DIFFERENT) {
                    result = false;
                }
                if (c.name == MoveConstraint.NAME && c.operator == Operator.EQUAL) {
                    result = true;
                }
            }
        }
        return result;
    }

/**
	 * Indique si il est possible d'étirer les élements d'une zone
	 * @method canScaleAreaElements
	 * @param	target {Area} la zone cible
	 * @return result {Bool}
	 */

    public function canScaleAreaElements(target:Area):Bool {
        var result = Config.instance.skin.getProperty(SkinProperty.SCALE) != PropertyValue.FALSE;
        if (target.constraints != null) {
            for (i in 0...target.constraints.length) {
                var c = target.constraints[i];
                if (c.name == ScaleConstraint.NAME && c.operator == Operator.DIFFERENT) {
                    result = false;
                }
                if (c.name == ScaleConstraint.NAME && c.operator == Operator.EQUAL) {
                    result = true;
                }
            }
        }
        return result;
    }

/**
	 * Indique si il est possible de retirer des élements d'une zone
	 * @method canRemoveAreaElements
	 * @param	target {Area} la zone cible
	 * @return result {Bool}
	 */

    public function canRemoveAreaElements(target:Area):Bool {
        var result = Config.instance.skin.getProperty(SkinProperty.DELETE) != PropertyValue.FALSE;
        return result;
    }

/**
	 * Indique si il est possible de pivoter les élements d'une zone
	 * @method canRotateAreaElements
	 * @param	target {Area} la zone cible
	 * @return result {Bool}
	 */

    public function canRotateAreaElements(target:Area):Bool {
        var result = Config.instance.skin.getProperty(SkinProperty.ROTATE) != PropertyValue.FALSE;
        if (target.constraints != null) {
            for (i in 0...target.constraints.length) {
                var c = target.constraints[i];
                if (c.name == RotationConstraint.NAME && c.operator == Operator.DIFFERENT) {
                    result = false;
                }
                if (c.name == RotationConstraint.NAME && c.operator == Operator.EQUAL) {
                    result = true;
                }
            }
        }
        return result;
    }

    private function getAllArea():Array<Area> {
        var result = new Array<Area>();
        for (i in 0...pattern.templates.length) {
            var template = pattern.templates[i];
            for (j in 0...template.content.length) {
                result.push(template.content[j]);
            }
        }
        return result;
    }
}
