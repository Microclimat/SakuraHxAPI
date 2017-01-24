package com.sakura.api.model.design;

import com.sakura.api.model.constraint.Constraint;

/**
 * Base interface for elements that need constraints
 * @class IConstricted
 **/
interface IConstricted {

    /**
     * @property constraints
     * @type Array<Constraint>
     **/
    var constraints:Array<Constraint>;

}
