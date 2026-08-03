import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean

abbrev Space2 := Fin 2 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space2 → ℝ
abbrev VectorField := Time → Space2 → Space2

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

structure FlowOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  convectiveDerivative : VectorField → VectorField

def primitiveOperators : FlowOperators := {
  divergence := fun _ => zeroScalarField
  gradient := fun _ => zeroVectorField
  laplacian := fun u => u
  timeDerivative := fun _ => zeroVectorField
  convectiveDerivative := fun _ => zeroVectorField
}

structure BaseFlow where
  velocity : VectorField
  density : ScalarField
  operators : FlowOperators

def primitiveBaseFlow : BaseFlow := {
  velocity := zeroVectorField
  density := zeroScalarField
  operators := primitiveOperators
}

structure Perturbation where
  velocityPerturbation : VectorField
  pressurePerturbation : ScalarField

def zeroPerturbation : Perturbation := {
  velocityPerturbation := zeroVectorField
  pressurePerturbation := zeroScalarField
}

structure LinearizedEquations where
  base : BaseFlow
  perturbation : Perturbation
  linearized : Prop

def LinearizedClosure (L : LinearizedEquations) : Prop :=
  L.linearized

theorem primitive_linearized_closure : LinearizedClosure ({
  base := primitiveBaseFlow
  perturbation := zeroPerturbation
  linearized := True
} : LinearizedEquations) := by
  trivial

end AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean
end HautevilleHouse