import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure SolowGrowthModelPackage where
  capital : Type u
  labor : Type v
  output : Type w
  productionFunction : capital -> labor -> output
  savingsRate : ℝ
  depreciationRate : ℝ
  populationGrowthRate : ℝ
  steadyStateCapital : capital -> Prop
  convergenceDynamics : Prop
  balancedGrowthPath : Prop

structure SolowGrowthModelEvidence (S : SolowGrowthModelPackage) where
  steadyStateExistence : S.steadyStateCapital
  convergenceDynamicsClosed : S.convergenceDynamics
  balancedGrowthPathClosed : S.balancedGrowthPath

def SolowGrowthModelClosed (S : SolowGrowthModelPackage) : Prop :=
  S.steadyStateCapital ∧ S.convergenceDynamics ∧ S.balancedGrowthPath

theorem solow_growth_model_closed_from_evidence
    (S : SolowGrowthModelPackage) (Ev : SolowGrowthModelEvidence S) :
    SolowGrowthModelClosed S := by
  exact And.intro Ev.steadyStateExistence
    (And.intro Ev.convergenceDynamicsClosed Ev.balancedGrowthPathClosed)

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse