import AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean.MathlibObjects
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean

abbrev SpaceDim := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → SpaceDim → ℝ
abbrev VectorField := Time → SpaceDim → SpaceDim

structure BaseFlow where
  velocity : VectorField
  pressure : ScalarField
  density : ScalarField
  viscosity : ℝ

def zeroVectorField : VectorField := fun _ _ _ => 0

def zeroScalarField : ScalarField := fun _ _ => 0

def primitiveBaseFlow : BaseFlow := {
  velocity := zeroVectorField
  pressure := zeroScalarField
  density := zeroScalarField
  viscosity := 1
}

structure Perturbation where
  velocityPert : VectorField
  pressurePert : ScalarField
  densityPert : ScalarField

def zeroPerturbation : Perturbation := {
  velocityPert := zeroVectorField
  pressurePert := zeroScalarField
  densityPert := zeroScalarField
}

structure DispersionRelation where
  omega : ℝ → ℝ → ℝ  -- ω(k) function
  k : ℝ
  growthRate : ℝ
  groupVelocity : ℝ

def trivialDispersion : DispersionRelation := {
  omega := fun _ _ => 0
  k := 0
  growthRate := 0
  groupVelocity := 0
}

end AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean
end HautevilleHouse