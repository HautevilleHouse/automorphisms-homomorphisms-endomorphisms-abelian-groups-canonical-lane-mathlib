import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean

structure AbelianGroupPackage {G : AdmittedObject} where
  isAbelian : Prop
  center : Set G.G
  commutatorTrivial : Prop
  decompositionIntoCyclics : Prop

structure AbelianGroupEvidence {G : AdmittedObject} (P : AbelianGroupPackage (G := G)) where
  isAbelianClosed : P.isAbelian
  centerClosed : P.center = Set.univ
  commutatorTrivialClosed : P.commutatorTrivial
  decompositionIntoCyclicsClosed : P.decompositionIntoCyclics

def AbelianGroupWitnessClosed {G : AdmittedObject} (P : AbelianGroupPackage (G := G)) : Prop :=
  P.isAbelian ∧ P.commutatorTrivial ∧ P.decompositionIntoCyclics

theorem abelian_group_closed_from_evidence {G : AdmittedObject} (P : AbelianGroupPackage (G := G))
    (E : AbelianGroupEvidence P) : AbelianGroupWitnessClosed P := by
  exact And.intro E.isAbelianClosed (And.intro E.commutatorTrivialClosed E.decompositionIntoCyclicsClosed)

end AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean
end HautevilleHouse