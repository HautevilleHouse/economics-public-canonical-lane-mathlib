import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.EconomicsPublicCanonicalLaneLean.UtilityTheory
import HautevilleHouse.EconomicsPublicCanonicalLaneLean.ArrowDebreuEquilibrium
import HautevilleHouse.EconomicsPublicCanonicalLaneLean.GrowthModel
import HautevilleHouse.EconomicsPublicCanonicalLaneLean.AssetPricing

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

def ConstrainedEconomicsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_economics_endgame (A : AdmissibleClass) :
    ConstrainedEconomicsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse