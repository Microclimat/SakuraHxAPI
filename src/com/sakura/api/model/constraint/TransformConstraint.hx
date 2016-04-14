package com.sakura.api.model.constraint;
class TransformConstraint extends Constraint{
    public function new(name:String) {
        super( ConstraintGroup.TRANSFORM.name, name, Operator.DIFFERENT, name );
    }
}
