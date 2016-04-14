package com.sakura.api.model.design;
import com.sakura.api.model.constraint.Constraint;
interface IRestrictable {

    var constraints:Array<Constraint>;
    var content:Array<IDrawingElement>;

}
