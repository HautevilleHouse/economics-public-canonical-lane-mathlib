import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure CapitalAssetPricingModelPackage where
  assets : Type u
  returns : assets -> ℝ
  riskFreeRate : ℝ
  marketPortfolio : ℝ
  marketReturn : ℝ
  beta : assets -> ℝ
  expectedReturn : assets -> ℝ
  securityMarketLine : Prop
  equilibriumCondition : Prop
  systematicRiskPricing : Prop

structure CapitalAssetPricingModelEvidence (C : CapitalAssetPricingModelPackage) where
  securityMarketLineClosed : C.securityMarketLine
  equilibriumConditionClosed : C.equilibriumCondition
  systematicRiskPricingClosed : C.systematicRiskPricing

def CapitalAssetPricingModelClosed (C : CapitalAssetPricingModelPackage) : Prop :=
  C.securityMarketLine ∧ C.equilibriumCondition ∧ C.systematicRiskPricing

theorem capm_closed_from_evidence
    (C : CapitalAssetPricingModelPackage) (Ev : CapitalAssetPricingModelEvidence C) :
    CapitalAssetPricingModelClosed C := by
  exact And.intro Ev.securityMarketLineClosed
    (And.intro Ev.equilibriumConditionClosed Ev.systematicRiskPricingClosed)

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse