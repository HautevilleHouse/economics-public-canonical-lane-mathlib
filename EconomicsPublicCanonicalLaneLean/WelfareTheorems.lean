import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure WelfareTheorems where
  economyArrowDebreu : ArrowDebreuEquilibrium
  paretoOptimality : Prop
  firstWelfareTheorem : Prop
  secondWelfareTheorem : Prop
  equilibriumImpliesPareto : Prop
  paretoImpliesEquilibriumWithTransfers : Prop

structure WelfareEvidence (W : WelfareTheorems) where
  firstWelfareTheoremClosed : W.firstWelfareTheorem
  secondWelfareTheoremClosed : W.secondWelfareTheorem
  equilibriumImpliesParetoClosed : W.equilibriumImpliesPareto
  paretoImpliesEquilibriumWithTransfersClosed : W.paretoImpliesEquilibriumWithTransfers

def WelfareTheoremsClosed (W : WelfareTheorems) : Prop :=
  W.firstWelfareTheorem ∧ W.secondWelfareTheorem ∧ W.equilibriumImpliesPareto ∧ W.paretoImpliesEquilibriumWithTransfers

theorem welfare_theorems_closed_from_evidence (W : WelfareTheorems) (Ev : WelfareEvidence W) : WelfareTheoremsClosed W :=
  And.intro Ev.firstWelfareTheoremClosed (And.intro Ev.secondWelfareTheoremClosed (And.intro Ev.equilibriumImpliesParetoClosed Ev.paretoImpliesEquilibriumWithTransfersClosed))

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse