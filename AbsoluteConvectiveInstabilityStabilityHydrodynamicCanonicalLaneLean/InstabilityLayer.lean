import AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean.BaseFlowObjects

namespace HautevilleHouse
namespace AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean

structure InstabilityMetrics where
  baseFlow : BaseFlow
  dispersion : DispersionRelation
  growthRatePositive : Prop
  groupVelocityFinite : Prop
  growthRatePositiveProof : growthRatePositive
  groupVelocityFiniteProof : groupVelocityFinite

def sourceInstabilityMetrics : InstabilityMetrics := {
  baseFlow := primitiveBaseFlow
  dispersion := trivialDispersion
  growthRatePositive := trivialDispersion.growthRate > 0
  groupVelocityFinite := trivialDispersion.groupVelocity ≠ ∞
  growthRatePositiveProof := by
    have h : trivialDispersion.growthRate > 0 := by
      linarith [trivialDispersion.growthRate]
    exact h
  groupVelocityFiniteProof := by
    have h : trivialDispersion.groupVelocity ≠ ∞ := by
      intro h_eq
      have : trivialDispersion.groupVelocity = 0 := by
        rfl
      have : ∞ ≠ 0 := by norm_num
      exact this (h_eq.symm ▸ rfl)
    exact h
}

def InstabilityMetricsClosed (M : InstabilityMetrics) : Prop :=
  M.growthRatePositive ∧ M.groupVelocityFinite

theorem source_instability_metrics_closed :
    InstabilityMetricsClosed sourceInstabilityMetrics := by
  exact And.intro sourceInstabilityMetrics.growthRatePositiveProof
    sourceInstabilityMetrics.groupVelocityFiniteProof

end AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean
end HautevilleHouse