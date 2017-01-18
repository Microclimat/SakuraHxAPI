package com.sakura.api.model.design;

import com.sakura.api.model.constraint.Constraint;

/**
 * @class IRestrictable
 **/
interface IRestrictable extends IConstricted {

    var content:Array<IDrawingElement>;

}
