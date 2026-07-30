import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure AuctionDesignPackage where
  bidders : Type u
  valuations : bidders -> ℝ
  bids : Set (bidders -> ℝ)
  allocationRule : (bidders -> ℝ) -> bidders -> ℝ
  paymentRule : (bidders -> ℝ) -> bidders -> ℝ
  revenueMaximization : Prop
  efficiencyProperty : Prop
  incentiveCompatibility : Prop
  individualRationality : Prop
  revelationPrinciple : Prop
  optimalAuctionRevenue : Prop

structure AuctionDesignEvidence (A : AuctionDesignPackage) where
  revenueMaximizationClosed : A.revenueMaximization
  efficiencyPropertyClosed : A.efficiencyProperty
  incentiveCompatibilityClosed : A.incentiveCompatibility
  individualRationalityClosed : A.individualRationality
  revelationPrincipleClosed : A.revelationPrinciple
  optimalAuctionRevenueClosed : A.optimalAuctionRevenue

def AuctionDesignClosed (A : AuctionDesignPackage) : Prop :=
  A.revenueMaximization ∧ A.efficiencyProperty ∧
  A.incentiveCompatibility ∧ A.individualRationality ∧
  A.revelationPrinciple ∧ A.optimalAuctionRevenue

theorem auction_design_closed_from_evidence
    (A : AuctionDesignPackage) (Ev : AuctionDesignEvidence A) :
    AuctionDesignClosed A := by
  exact And.intro Ev.revenueMaximizationClosed
    (And.intro Ev.efficiencyPropertyClosed
      (And.intro Ev.incentiveCompatibilityClosed
        (And.intro Ev.individualRationalityClosed
          (And.intro Ev.revelationPrincipleClosed Ev.optimalAuctionRevenueClosed))))

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse