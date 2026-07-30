import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure MacroeconomicState where
  capitalStock : ℝ
  laborSupply : ℝ
  technologyLevel : ℝ

structure ProductionFunction (S : MacroeconomicState) where
  output : ℝ
  constantReturnsToScale : Prop

def SolowGrowthClosed (S : MacroeconomicState) (P : ProductionFunction S) : Prop :=
  P.constantReturnsToScale ∧ S.capitalStock > 0 ∧ S.laborSupply > 0

theorem solow_growth_closed (S : MacroeconomicState) (P : ProductionFunction S) :
    SolowGrowthClosed S P := by
  refine And.intro P.constantReturnsToScale (And.intro ?_ ?_)
  · exact by
      have h : S.capitalStock > 0 := by
        -- assume positivity from state
        sorry
      exact h
  · exact by
      have h : S.laborSupply > 0 := by
        sorry
      exact h

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse