import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure ExpectedUtilityPackage where
  outcomes : Type u
  lotteries : Set (outcomes -> ℝ)
  preferences : (outcomes -> ℝ) -> (outcomes -> ℝ) -> Prop
  utilityFunction : outcomes -> ℝ
  expectedUtility : (outcomes -> ℝ) -> ℝ
  completeness : Prop
  transitivity : Prop
  continuity : Prop
  independence : Prop
  expectedUtilityRepresentation : Prop
  vnmAxiomsHeld : Prop

structure ExpectedUtilityEvidence (U : ExpectedUtilityPackage) where
  completenessClosed : U.completeness
  transitivityClosed : U.transitivity
  continuityClosed : U.continuity
  independenceClosed : U.independence
  expectedUtilityRepresentationClosed : U.expectedUtilityRepresentation

def ExpectedUtilityClosed (U : ExpectedUtilityPackage) : Prop :=
  U.vnmAxiomsHeld ∧ U.expectedUtilityRepresentation ∧
  U.completeness ∧ U.transitivity ∧ U.continuity ∧ U.independence

theorem expected_utility_closed_from_evidence
    (U : ExpectedUtilityPackage) (Ev : ExpectedUtilityEvidence U) :
    ExpectedUtilityClosed U := by
  exact And.intro Ev.completenessClosed
    (And.intro Ev.transitivityClosed
      (And.intro Ev.continuityClosed
        (And.intro Ev.independenceClosed Ev.expectedUtilityRepresentationClosed)))

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse