package com.sakura.api.model.constraint.image;
class TransformConstraint extends Constraint{
    public function new(name:String) {
        super( ConstraintGroup.IMAGE_TRANSFORM.name, name, Operator.DIFFERENT, name );
    }
}
