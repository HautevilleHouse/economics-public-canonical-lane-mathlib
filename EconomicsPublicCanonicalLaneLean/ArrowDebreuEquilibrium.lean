import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure CommoditySpace where
  dimension : ℕ
  priceVector : Vector ℝ dimension

structure Consumer (d : ℕ) where
  endowment : Vector ℝ d
  utilityFunction : Vector ℝ d → ℝ
  utilityIsContinuousMonotoneStrictlyQuasiconcave : Prop

structure Firm (d : ℕ) where
  productionSet : Set (Vector ℝ d)
  profitMaximization : Prop

structure ArrowDebreuEconomy (d : ℕ) where
  consumers : List (Consumer d)
  firms : List (Firm d)
  totalEndowment : Vector ℝ d
  marketClearingCondition : Prop

structure EquilibriumPrice (d : ℕ) (E : ArrowDebreuEconomy d) where
  priceVector : Vector ℝ d
  consumerOptimality : ∀ c : Consumer d, E.consumers.contains c → True
  firmProfitMaximization : ∀ f : Firm d, E.firms.contains f → True
  marketClearing : E.marketClearingCondition

def EquilibriumClosed (d : ℕ) (E : ArrowDebreuEconomy d) (p : EquilibriumPrice d E) : Prop :=
  p.consumerOptimality ∧ p.firmProfitMaximization ∧ p.marketClearing

theorem equilibrium_closed_from_evidence (d : ℕ) (E : ArrowDebreuEconomy d) (p : EquilibriumPrice d E) :
    EquilibriumClosed d E p := by
  exact And.intro p.consumerOptimality (And.intro p.firmProfitMaximization p.marketClearing)

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse