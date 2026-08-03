import .FinalTheorem
import canonicalLaneMathlibCore
import Mathlib.Data.Set.Basic

namespace HautevilleHouse
namespace AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure TheoremSpecificObject where
  sourceKey : String
  theoremObject : String
  claimBoundary : String

deriving Repr, DecidableEq

structure AdmittedTheoremObject where
  object : TheoremSpecificObject
  localWitness : String
  bridgeEvidence : String
  sourceKeyChecked : object.sourceKey = sourceRepository
  theoremObjectChecked : object.theoremObject = sourceDescription

def theoremSpecificObject : TheoremSpecificObject := {
  sourceKey := sourceRepository,
  theoremObject := sourceDescription,
  claimBoundary := "Absolute and convective instability classification for parallel shear flows."
}

def NativeBridgeClosed (O : AdmittedTheoremObject) : Prop :=
  O.object.sourceKey = sourceRepository ∧ O.object.theoremObject = sourceDescription

end AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean
end HautevilleHouse