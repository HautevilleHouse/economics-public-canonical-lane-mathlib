import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure UtilityConsumerPackage where
  consumptionSet : Type u
  preferenceRelation : consumptionSet → consumptionSet → Prop
  completeness : ∀ x y : consumptionSet, preferenceRelation x y ∨ preferenceRelation y x
  transitivity : ∀ x y z : consumptionSet, preferenceRelation x y → preferenceRelation y z → preferenceRelation x z
  continuity : Prop
  monotonicity : Prop

structure UtilityFunctionPackage (C : UtilityConsumerPackage) where
  utility : C.consumptionSet → ℝ
  representation : ∀ x y : C.consumptionSet, C.preferenceRelation x y ↔ utility x ≤ utility y
  continuous : Prop

def UtilityRepresentationClosed (C : UtilityConsumerPackage) (U : UtilityFunctionPackage C) : Prop :=
  U.representation ∧ U.continuous

theorem utility_representation_from_evidence (C : UtilityConsumerPackage) (U : UtilityFunctionPackage C) :
    UtilityRepresentationClosed C U := by
  exact And.intro U.representation U.continuous

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse