import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure UtilityFunction where
  consumptionSet : Type u
  preferenceRelation : consumptionSet -> consumptionSet -> Prop
  completeness : Prop
  transitivity : Prop
  continuity : Prop
  representability : Prop
  utilityRepresentation : consumptionSet -> Real

structure UtilityEvidence (U : UtilityFunction) where
  completenessClosed : U.completeness
  transitivityClosed : U.transitivity
  continuityClosed : U.continuity
  representabilityClosed : U.representability

def UtilityTheoryClosed (U : UtilityFunction) : Prop :=
  U.completeness ∧ U.transitivity ∧ U.continuity ∧ U.representability

theorem utility_theory_closed_from_evidence (U : UtilityFunction) (Ev : UtilityEvidence U) : UtilityTheoryClosed U :=
  And.intro Ev.completenessClosed (And.intro Ev.transitivityClosed (And.intro Ev.continuityClosed Ev.representabilityClosed))

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse