import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean

structure EndomorphismPackage {G : AdmittedObject} where
  map : G.G → G.G
  isHomomorphism : Prop
  isEndomorphism : Prop
  fixedPoints : Set G.G
  nilpotentCondition : Prop

structure EndomorphismEvidence {G : AdmittedObject} (P : EndomorphismPackage (G := G)) where
  isHomomorphismClosed : P.isHomomorphism
  isEndomorphismClosed : P.isEndomorphism
  fixedPointsClosed : P.fixedPoints = {x : G.G | P.map x = x}
  nilpotentConditionClosed : P.nilpotentCondition

def EndomorphismWitnessClosed {G : AdmittedObject} (P : EndomorphismPackage (G := G)) : Prop :=
  P.isHomomorphism ∧ P.isEndomorphism ∧ P.nilpotentCondition

theorem endomorphism_closed_from_evidence {G : AdmittedObject} (P : EndomorphismPackage (G := G))
    (E : EndomorphismEvidence P) : EndomorphismWitnessClosed P := by
  exact And.intro E.isHomomorphismClosed (And.intro E.isEndomorphismClosed E.nilpotentConditionClosed)

end AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean
end HautevilleHouse