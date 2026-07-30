import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let eq : ArrowDebreuEquilibrium := A.object  -- assume object is an equilibrium
  ArrowDebreuEquilibriumClosed eq

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  -- proof that A.object yields closed equilibrium
  sorry

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse