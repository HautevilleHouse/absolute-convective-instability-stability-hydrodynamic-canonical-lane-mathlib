import AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean

def ConstrainedAbsoluteConvectiveInstabilityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_absolute_convective_instability_endgame (A : AdmissibleClass) :
    ConstrainedAbsoluteConvectiveInstabilityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean
end HautevilleHouse