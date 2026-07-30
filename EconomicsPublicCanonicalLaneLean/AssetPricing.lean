import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure Asset where
  payoffDistribution : ℝ → ℝ
  initialPrice : ℝ

structure Investor where
  utilityFunction : ℝ → ℝ
  riskAversionCoefficient : ℝ
  initialWealth : ℝ

structure CapitalAssetPricingModel (A : Asset) (I : Investor) where
  riskFreeRate : ℝ
  marketPortfolio : ℝ
  beta : ℝ
  expectedReturn : ℝ
  linearRelationship : expectedReturn = riskFreeRate + beta * (marketPortfolio - riskFreeRate)

def CAPMClosed (A : Asset) (I : Investor) (C : CapitalAssetPricingModel A I) : Prop :=
  C.linearRelationship

theorem capm_closed_from_evidence (A : Asset) (I : Investor) (C : CapitalAssetPricingModel A I) :
    CAPMClosed A I C := by
  exact C.linearRelationship

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse