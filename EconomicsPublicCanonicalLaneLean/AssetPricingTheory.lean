import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure AssetPricingModel where
  stateSpace : Type u
  probabilityMeasure : Type v
  assetUniverse : Type w
  discountFactor : ℝ
  stochasticDiscountFactor : stateSpace → ℝ
  payoffMatrix : assetUniverse → stateSpace → ℝ
  noArbitrageCondition : Prop
  riskNeutralProbabilityExists : Prop
  fundamentalPricingEquation : Prop

structure AssetPricingEvidence (M : AssetPricingModel) where
  noArbitrageConditionClosed : M.noArbitrageCondition
  riskNeutralProbabilityExistsClosed : M.riskNeutralProbabilityExists
  fundamentalPricingEquationClosed : M.fundamentalPricingEquation

def AssetPricingClosed (M : AssetPricingModel) : Prop :=
  M.noArbitrageCondition ∧ M.riskNeutralProbabilityExists ∧ M.fundamentalPricingEquation

theorem asset_pricing_closed_from_evidence
    (M : AssetPricingModel) (E : AssetPricingEvidence M) :
    AssetPricingClosed M := by
  exact And.intro E.noArbitrageConditionClosed
    (And.intro E.riskNeutralProbabilityExistsClosed E.fundamentalPricingEquationClosed)

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse