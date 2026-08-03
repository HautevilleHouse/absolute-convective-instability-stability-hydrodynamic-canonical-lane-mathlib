import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean.InstabilityCriteria

namespace HautevilleHouse
namespace AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean

structure StabilityBoundary where
  marginalStabilityCondition : Prop
  transitionWavenumber : ℝ
  transitionFrequency : ℂ

def defaultStabilityBoundary : StabilityBoundary := {
  marginalStabilityCondition := False,
  transitionWavenumber := 0,
  transitionFrequency := (0 : ℂ)
}

def MarginalStability (criteria : InstabilityCriteria) : Prop :=
  criteria.growthRatePositive ∧ criteria.groupVelocityNonzero

def AbsoluteConvectiveBoundary (criteria : InstabilityCriteria) : Prop :=
  criteria.absoluteInstability ∨ criteria.convectiveInstability

end AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean
end HautevilleHouse