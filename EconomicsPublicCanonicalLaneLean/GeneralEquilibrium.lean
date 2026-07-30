import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure ArrowDebreuCommoditySpace where
  goodTypes : Type u
  priceSystem : GoodTypes → ℝ
  allocation : GoodTypes → ℝ
  equilibriumCondition : Prop

structure GeneralEquilibriumPackage where
  commoditySpace : ArrowDebreuCommoditySpace
  preferences : Prop
  endowments : Prop
  marketClearing : Prop
  utilityMaximization : Prop
  profitMaximization : Prop

structure GeneralEquilibriumEvidence (G : GeneralEquilibriumPackage) where
  equilibriumConditionClosed : G.marketClearing
  utilityMaximizationClosed : G.utilityMaximization
  profitMaximizationClosed : G.profitMaximization

def GeneralEquilibriumClosed (G : GeneralEquilibriumPackage) : Prop :=
  G.marketClearing ∧ G.utilityMaximization ∧ G.profitMaximization

theorem general_equilibrium_closed_from_evidence (G : GeneralEquilibriumPackage) (E : GeneralEquilibriumEvidence G) : GeneralEquilibriumClosed G := by
  exact And.intro E.equilibriumConditionClosed (And.intro E.utilityMaximizationClosed E.profitMaximizationClosed)

end HautevilleHouse
end EconomicsPublicCanonicalLaneLean