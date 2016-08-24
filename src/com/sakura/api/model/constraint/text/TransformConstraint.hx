package com.sakura.api.model.constraint.text;
class TransformConstraint extends Constraint{
    public function new(name:String) {
        super( ConstraintGroup.TEXT_TRANSFORM.name, name, Operator.DIFFERENT, name );
    }
}
