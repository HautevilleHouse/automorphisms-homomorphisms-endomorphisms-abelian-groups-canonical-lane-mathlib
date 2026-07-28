import AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean.GroupTheory

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean

structure AbelianGroupPackage (G : GroupObject) where
  isAbelian : Prop
  commutatorSubgroupTrivial : Prop
  homomorphismsToZ : Prop

structure AbelianGroupEvidence {G : GroupObject} (A : AbelianGroupPackage G) where
  isAbelianClosed : A.isAbelian
  commutatorSubgroupTrivialClosed : A.commutatorSubgroupTrivial
  homomorphismsToZClosed : A.homomorphismsToZ

def AbelianGroupClosed {G : GroupObject} (A : AbelianGroupPackage G) : Prop :=
  A.isAbelian ∧ A.commutatorSubgroupTrivial ∧ A.homomorphismsToZ

theorem abelian_group_closed_from_evidence
    {G : GroupObject} (A : AbelianGroupPackage G) (E : AbelianGroupEvidence A) :
    AbelianGroupClosed A := by
  exact And.intro E.isAbelianClosed (And.intro E.commutatorSubgroupTrivialClosed E.homomorphismsToZClosed)

end AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean
end HautevilleHouse