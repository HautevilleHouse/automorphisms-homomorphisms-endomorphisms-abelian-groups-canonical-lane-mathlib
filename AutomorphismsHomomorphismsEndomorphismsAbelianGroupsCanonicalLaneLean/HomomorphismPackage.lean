import AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean.GroupTheory

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean

structure HomomorphismPackage (G H : GroupObject) where
  mapping : G.carrier → H.carrier
  respectsMul : Prop
  kernelImageRelation : Prop
  exactness : Prop

structure HomomorphismEvidence {G H : GroupObject} (P : HomomorphismPackage G H) where
  respectsMulClosed : P.respectsMul
  kernelImageRelationClosed : P.kernelImageRelation
  exactnessClosed : P.exactness

def HomomorphismClosed {G H : GroupObject} (P : HomomorphismPackage G H) : Prop :=
  P.respectsMul ∧ P.kernelImageRelation ∧ P.exactness

theorem homomorphism_closed_from_evidence
    {G H : GroupObject} (P : HomomorphismPackage G H) (E : HomomorphismEvidence P) :
    HomomorphismClosed P := by
  exact And.intro E.respectsMulClosed (And.intro E.kernelImageRelationClosed E.exactnessClosed)

end AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean
end HautevilleHouse