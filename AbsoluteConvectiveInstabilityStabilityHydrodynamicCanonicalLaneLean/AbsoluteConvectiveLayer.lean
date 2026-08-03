import canonicalLaneMathlib.AdmissibleClass
import AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean.DispersionAnalyticObjects

namespace HautevilleHouse
namespace AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean

structure InstabilityClassification where
  dispersion : DispersionRelation
  groupVelocity : ℝ
  temporalGrowthRate : ℝ
  spatialGrowthRate : ℝ
  isAbsolute : Prop
  isConvective : Prop
  absoluteCondition : (groupVelocity = 0) ∧ (temporalGrowthRate > 0)
  convectiveCondition : (groupVelocity ≠ 0) ∧ (spatialGrowthRate > 0)

def sourceInstabilityClassification : InstabilityClassification := {
  dispersion := primitiveDispersionRelation
  groupVelocity := 0
  temporalGrowthRate := 0.5
  spatialGrowthRate := 0
  isAbsolute := True
  isConvective := False
  absoluteCondition := by
    refine And.intro ?_ ?_
    · rfl
    · linarith
  convectiveCondition := by
    refine And.intro ?_ ?_
    · norm_num
    · linarith
}

structure StabilityThreshold where
  classification : InstabilityClassification
  criticalWavenumber : ℝ
  criticalFrequency : ℝ
  thresholdSatisfied : Prop

def sourceStabilityThreshold : StabilityThreshold := {
  classification := sourceInstabilityClassification
  criticalWavenumber := 1.0
  criticalFrequency := 0.0
  thresholdSatisfied := sourceInstabilityClassification.isAbsolute
}

def AbsoluteConvectiveInstabilityClosed (S : StabilityThreshold) : Prop :=
  S.classification.isAbsolute ∨ S.classification.isConvective

theorem source_absolute_convective_instability_closed :
  AbsoluteConvectiveInstabilityClosed sourceStabilityThreshold := by
  unfold AbsoluteConvectiveInstabilityClosed
  apply Or.inl
  exact sourceInstabilityClassification.absoluteCondition.2

end AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean
end HautevilleHouse