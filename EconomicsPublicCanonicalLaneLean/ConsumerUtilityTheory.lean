import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure UtilityFunction (X : Type u) where
  domain : X
  codomain : ℝ
  utilityValue : X → ℝ
  monotonicity : Prop
  continuity : Prop
  convexity : Prop
  monotonicityTerm : monotonicity
  continuityTerm : continuity
  convexityTerm : convexity

structure ConsumerPreferences (X : Type u) where
  consumptionSet : Set X
  preferenceRelation : X → X → Prop
  completeness : Prop
  transitivity : Prop
  continuity : Prop
  strictMonotonicity : Prop
  convexity : Prop
  completenessTerm : completeness
  transitivityTerm : transitivity
  continuityTerm : continuity
  strictMonotonicityTerm : strictMonotonicity
  convexityTerm : convexity

structure UtilityRepresentation (X : Type u) (P : ConsumerPreferences X) where
  utilityFunc : UtilityFunction X
  representationProperty : ∀ x y : X, P.preferenceRelation x y ↔ utilityFunc.utilityValue x ≥ utilityFunc.utilityValue y
  representationTerm : representationProperty

def UtilityRepresentationClosed {X : Type u} {P : ConsumerPreferences X}
    (U : UtilityRepresentation X P) : Prop :=
  U.representationProperty

theorem utility_representation_closed {X : Type u} {P : ConsumerPreferences X}
    (U : UtilityRepresentation X P) : UtilityRepresentationClosed U := by
  exact U.representationTerm

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse