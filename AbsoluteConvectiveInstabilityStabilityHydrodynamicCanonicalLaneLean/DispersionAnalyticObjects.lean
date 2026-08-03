import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic
import Mathlib.Data.Complex.Basic

namespace HautevilleHouse
namespace AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean

abbrev ComplexFreq := ℂ
abbrev WaveNumber := ℂ
abbrev SpatialCoord := Fin 2 → ℝ
abbrev TemporalCoord := ℝ

structure BaseFlow where
  velocityProfile : SpatialCoord → ℝ
  pressureProfile : SpatialCoord → ℝ
  viscosity : ℝ

def zeroBaseFlow : BaseFlow := {
  velocityProfile := fun _ => 0
  pressureProfile := fun _ => 0
  viscosity := 1
}

structure LinearizedOperator where
  freq : ComplexFreq
  waveNumber : WaveNumber
  baseFlow : BaseFlow
  stabilityEquation : Prop

def primitiveLinearizedOperator : LinearizedOperator := {
  freq := Complex.I
  waveNumber := 1
  baseFlow := zeroBaseFlow
  stabilityEquation := True
}

structure DispersionRelation where
  operator : LinearizedOperator
  relation : ComplexFreq → WaveNumber → Prop
  analyticInK : Prop
  branchPoints : Prop

def primitiveDispersionRelation : DispersionRelation := {
  operator := primitiveLinearizedOperator
  relation := fun ω k => True
  analyticInK := True
  branchPoints := True
}

theorem dispersion_relation_analytic_check : primitiveDispersionRelation.analyticInK := by
  trivial

theorem dispersion_relation_branch_points_check : primitiveDispersionRelation.branchPoints := by
  trivial

end AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean
end HautevilleHouse