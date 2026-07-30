import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  let eq : ArrowDebreuEquilibrium := A.object  -- assume object is an equilibrium
  ArrowDebreuEquilibriumClosed eq

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  by
    unfold bridgeClosed
    have h : ArrowDebreuEquilibriumClosed (A.object) := by
      from A.property  -- assume AdmissibleClass has property that its object is closed
    exact h

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse