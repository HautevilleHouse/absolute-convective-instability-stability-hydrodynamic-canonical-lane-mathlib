import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean.DispersionRelation

namespace HautevilleHouse
namespace AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean

structure BasicFlow where
  velocity : ℝ → ℝ  -- base velocity profile
  density : ℝ
  viscosity : ℝ
  lengthScale : ℝ

def defaultBasicFlow : BasicFlow := {
  velocity := λ _ => 0,
  density := 1,
  viscosity := 1,
  lengthScale := 1
}

structure Perturbation where
  amplitude : ℝ → ℝ → ℝ  -- (t,x) -> amplitude
  wavenumber : ℝ
  frequency : ℂ

def defaultPerturbation : Perturbation := {
  amplitude := λ _ _ => 0,
  wavenumber := 0,
  frequency := (0 : ℂ)
}

structure FlowPerturbationPair where
  flow : BasicFlow
  perturbation : Perturbation
  dispersionRelation : DispersionRelation

def defaultPair : FlowPerturbationPair := {
  flow := defaultBasicFlow,
  perturbation := defaultPerturbation,
  dispersionRelation := defaultDispersionRelation
}

end AbsoluteConvectiveInstabilityStabilityHydrodynamicCanonicalLaneLean
end HautevilleHouse