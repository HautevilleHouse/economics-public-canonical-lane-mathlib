import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure PublicGoodsProvisionPackage where
  individuals : Type u
  publicGood : Type v
  contribution : individuals -> ℝ
  totalProvision : ℝ
  utilityFunctions : individuals -> ℝ -> ℝ
  socialWelfareFunction : ℝ -> Prop
  paretoEfficiencyCondition : Prop
  freeRiderProblem : Prop
  optimalProvision : Prop
  lindahlEquilibrium : Prop
  samuelsonCondition : Prop

structure PublicGoodsProvisionEvidence (P : PublicGoodsProvisionPackage) where
  paretoEfficiencyClosed : P.paretoEfficiencyCondition
  freeRiderProblemClosed : P.freeRiderProblem
  optimalProvisionClosed : P.optimalProvision
  lindahlEquilibriumClosed : P.lindahlEquilibrium
  samuelsonConditionClosed : P.samuelsonCondition

def PublicGoodsProvisionClosed (P : PublicGoodsProvisionPackage) : Prop :=
  P.paretoEfficiencyCondition ∧ P.freeRiderProblem ∧
  P.optimalProvision ∧ P.lindahlEquilibrium ∧ P.samuelsonCondition

theorem public_goods_provision_closed_from_evidence
    (P : PublicGoodsProvisionPackage) (Ev : PublicGoodsProvisionEvidence P) :
    PublicGoodsProvisionClosed P := by
  exact And.intro Ev.paretoEfficiencyClosed
    (And.intro Ev.freeRiderProblemClosed
      (And.intro Ev.optimalProvisionClosed
        (And.intro Ev.lindahlEquilibriumClosed Ev.samuelsonConditionClosed)))

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse