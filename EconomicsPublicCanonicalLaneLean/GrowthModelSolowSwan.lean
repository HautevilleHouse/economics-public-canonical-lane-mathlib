import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace EconomicsPublicCanonicalLaneLean

structure SolowSwanGrowthModel where
  capitalStock : Nat -> Real
  laborForce : Nat -> Real
  technology : Real
  savingsRate : Real
  depreciationRate : Real
  productionFunction : Real -> Real -> Real
  capitalAccumulation : Prop
  steadyState : Prop
  convergence : Prop

structure GrowthModelEvidence (G : SolowSwanGrowthModel) where
  capitalAccumulationClosed : G.capitalAccumulation
  steadyStateClosed : G.steadyState
  convergenceClosed : G.convergence

def GrowthModelClosed (G : SolowSwanGrowthModel) : Prop :=
  G.capitalAccumulation ∧ G.steadyState ∧ G.convergence

theorem growth_model_closed_from_evidence (G : SolowSwanGrowthModel) (Ev : GrowthModelEvidence G) : GrowthModelClosed G :=
  And.intro Ev.capitalAccumulationClosed (And.intro Ev.steadyStateClosed Ev.convergenceClosed)

end EconomicsPublicCanonicalLaneLean
end HautevilleHouse