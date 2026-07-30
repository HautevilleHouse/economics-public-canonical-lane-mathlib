import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure CapitalAssetPricingModel where
  riskFreeRate : Real
  marketReturn : Real
  beta : Real
  expectedReturn : Real
  securityMarketLine : Prop
  efficiency : Prop
  pricingFormula : Prop

struct ASSETPricingEvidence (C : CapitalAssetPricingModel) where
  securityMarketLineClosed : C.securityMarketLine
  efficiencyClosed : C.efficiency
  pricingFormulaClosed : C.pricingFormula

def AssetPricingClosed (C : CapitalAssetPricingModel) : Prop :=
  C.securityMarketLine ∧ C.efficiency ∧ C.pricingFormula

theorem asset_pricing_closed_from_evidence (C : CapitalAssetPricingModel) (Ev : ASSETPricingEvidence C) : AssetPricingClosed C :=
  And.intro Ev.securityMarketLineClosed (And.intro Ev.efficiencyClosed Ev.pricingFormulaClosed)

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse