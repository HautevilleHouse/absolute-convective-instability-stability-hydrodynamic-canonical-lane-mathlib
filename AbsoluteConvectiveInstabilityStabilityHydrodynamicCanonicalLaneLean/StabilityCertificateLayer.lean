import canonicalLaneMathlib.AdmissibleClass
import AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean.AbsoluteConvectiveLayer

namespace HautevilleHouse
namespace AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean

structure StabilityCertificate where
  threshold : StabilityThreshold
  dispersionClosed : Prop
  classificationClosed : Prop
  certificateCarried : Prop
  dispersionClosedProof : dispersionClosed
  classificationClosedProof : classificationClosed
  certificateCarriedProof : certificateCarried

def sourceStabilityCertificate : StabilityCertificate := {
  threshold := sourceStabilityThreshold
  dispersionClosed := primitiveDispersionRelation.analyticInK ∧ primitiveDispersionRelation.branchPoints
  classificationClosed := AbsoluteConvectiveInstabilityClosed sourceStabilityThreshold
  certificateCarried := True
  dispersionClosedProof := by
    exact And.intro (by trivial) (by trivial)
  classificationClosedProof := source_absolute_convective_instability_closed
  certificateCarriedProof := trivial
}

def StabilityCertificateClosed (C : StabilityCertificate) : Prop :=
  C.dispersionClosed ∧ C.classificationClosed ∧ C.certificateCarried

theorem source_stability_certificate_closed :
  StabilityCertificateClosed sourceStabilityCertificate := by
  unfold StabilityCertificateClosed
  exact And.intro sourceStabilityCertificate.dispersionClosedProof
    (And.intro sourceStabilityCertificate.classificationClosedProof
      sourceStabilityCertificate.certificateCarriedProof)

end AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean
end HautevilleHouse