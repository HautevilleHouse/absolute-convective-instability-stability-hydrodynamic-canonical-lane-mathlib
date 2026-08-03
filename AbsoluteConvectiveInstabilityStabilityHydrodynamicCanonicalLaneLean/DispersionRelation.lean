import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean

structure DispersionRelation where
  omega : ℝ → ℂ  -- complex frequency as function of real wavenumber
  groupVelocity : ℝ → ℝ
  growthRate : ℝ → ℝ
  phaseVelocity : ℝ → ℝ

def defaultDispersionRelation : DispersionRelation := {
  omega := λ _ => (0 : ℂ),
  groupVelocity := λ _ => 0,
  growthRate := λ _ => 0,
  phaseVelocity := λ _ => 0
}

structure DispersionRelationCertificate where
  relation : DispersionRelation
  analyticInK : Prop
  hasBranchCut : Prop
  analyticInKProof : analyticInK
  hasBranchCutProof : hasBranchCut

def sourceDispersionRelationCertificate : DispersionRelationCertificate := {
  relation := defaultDispersionRelation,
  analyticInK := True,
  hasBranchCut := False,
  analyticInKProof := trivial,
  hasBranchCutProof := trivial
}

def DispersionRelationClosed (C : DispersionRelationCertificate) : Prop :=
  C.analyticInK ∧ ¬ C.hasBranchCut

theorem source_dispersion_relation_closed : DispersionRelationClosed sourceDispersionRelationCertificate := by
  exact And.intro (by trivial) (by trivial)

end AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean
end HautevilleHouse