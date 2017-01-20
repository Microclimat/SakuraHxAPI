package com.sakura.api.model.design;

import com.sakura.api.model.constraint.Constraint;

/**
 * Base interface for objects which must accept content (Text, Images...)
 * @class IRestrictable
 **/
interface IRestrictable extends IConstricted {

    /**
     * @property content
     * @type Array<IDrawingElement>
     **/
    var content:Array<IDrawingElement>;

}
