import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean.FlowAndPerturbation

namespace HautevilleHouse
namespace AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean

structure InstabilityCriteria where
  growthRatePositive : Prop
  groupVelocityNonzero : Prop
  absoluteInstability : Prop
  convectiveInstability : Prop

def defaultInstabilityCriteria : InstabilityCriteria := {
  growthRatePositive := False,
  groupVelocityNonzero := False,
  absoluteInstability := False,
  convectiveInstability := False
}

def AbsoluteInstability (pair : FlowPerturbationPair) : Prop :=
  InstabilityCriteria.absoluteInstability defaultInstabilityCriteria

def ConvectiveInstability (pair : FlowPerturbationPair) : Prop :=
  InstabilityCriteria.convectiveInstability defaultInstabilityCriteria

def Stability (pair : FlowPerturbationPair) : Prop :=
  ¬ (AbsoluteInstability pair ∨ ConvectiveInstability pair)

end AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean
end HautevilleHouse