import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure PublicFinanceModel where
  governmentBudget : Type u
  taxSystem : Type v
  publicGoods : Type w
  lumpSumTaxesAvailable : Prop
  proportionalTaxesDefined : Prop
  publicGoodProvisionEfficient : Prop
  budgetBalanceCondition : Prop
  distortionaryEffectDefined : Prop
  optimalTaxFormulaDerived : Prop

structure PublicFinanceEvidence (P : PublicFinanceModel) where
  lumpSumTaxesAvailableClosed : P.lumpSumTaxesAvailable
  proportionalTaxesDefinedClosed : P.proportionalTaxesDefined
  publicGoodProvisionEfficientClosed : P.publicGoodProvisionEfficient
  budgetBalanceConditionClosed : P.budgetBalanceCondition
  distortionaryEffectDefinedClosed : P.distortionaryEffectDefined
  optimalTaxFormulaDerivedClosed : P.optimalTaxFormulaDerived

def PublicFinanceClosed (P : PublicFinanceModel) : Prop :=
  P.lumpSumTaxesAvailable ∧ P.proportionalTaxesDefined ∧
  P.publicGoodProvisionEfficient ∧ P.budgetBalanceCondition ∧
  P.distortionaryEffectDefined ∧ P.optimalTaxFormulaDerived

theorem public_finance_closed_from_evidence
    (P : PublicFinanceModel) (E : PublicFinanceEvidence P) :
    PublicFinanceClosed P := by
  exact And.intro E.lumpSumTaxesAvailableClosed
    (And.intro E.proportionalTaxesDefinedClosed
      (And.intro E.publicGoodProvisionEfficientClosed
        (And.intro E.budgetBalanceConditionClosed
          (And.intro E.distortionaryEffectDefinedClosed
            E.optimalTaxFormulaDerivedClosed))))

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse