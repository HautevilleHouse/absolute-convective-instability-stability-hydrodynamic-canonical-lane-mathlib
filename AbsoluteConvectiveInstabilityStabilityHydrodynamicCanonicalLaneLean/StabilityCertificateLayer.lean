/-
All Rights Reserved - No License Granted

Copyright (c) 2026 HautevilleHouse. All rights reserved.

This repository is published for academic review, citation, priority, public
notice, and research-reference purposes only.

No license is granted to use, copy, reproduce, redistribute, modify, merge,
publish, distribute, sublicense, sell, fork, mirror, scrape, use for training or
fine-tuning, include in a dataset or benchmark, use to create, evaluate, or
benchmark a derivative system, incorporate into another system, or create
derivative works from this repository or any substantial portion of it without
prior written permission from the rights holder.

Viewing this repository on GitHub for academic review and citation is permitted
with all rights reserved by the rights holder.

Any discussion, review, comparison, implementation, derivative research use, or
public reference to this repository must cite the repository and preserve this
notice.

Unauthorized reproduction or redistribution of this repository, including public
GitHub forks containing the repository contents, constitutes copyright
infringement and may be subject to DMCA.
-/
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
    constructor
    · simp
    · simp
  classificationClosedProof := source_absolute_convective_instability_closed
  certificateCarriedProof := by simp
}

def StabilityCertificateClosed (C : StabilityCertificate) : Prop :=
  C.dispersionClosed ∧ C.classificationClosed ∧ C.certificateCarried

theorem source_stability_certificate_closed :
  StabilityCertificateClosed sourceStabilityCertificate := by
  unfold StabilityCertificateClosed
  exact ⟨sourceStabilityCertificate.dispersionClosedProof,
    ⟨sourceStabilityCertificate.classificationClosedProof,
      sourceStabilityCertificate.certificateCarriedProof⟩⟩

end AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean
end HautevilleHouse