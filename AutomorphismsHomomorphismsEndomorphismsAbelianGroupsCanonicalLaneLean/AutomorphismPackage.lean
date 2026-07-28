import AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean.HomomorphismPackage

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean

structure AutomorphismPackage (G : GroupObject) where
  automorphismGroup : GroupObject
  innerAutomorphismSubgroup : Prop
  outerAutomorphismGroup : Prop
  imageOfHomomorphism : HomomorphismPackage G G

structure AutomorphismEvidence {G : GroupObject} (A : AutomorphismPackage G) where
  innerAutomorphismSubgroupClosed : A.innerAutomorphismSubgroup
  outerAutomorphismGroupClosed : A.outerAutomorphismGroup

def AutomorphismClosed {G : GroupObject} (A : AutomorphismPackage G) : Prop :=
  A.innerAutomorphismSubgroup ∧ A.outerAutomorphismGroup

theorem automorphism_closed_from_evidence
    {G : GroupObject} (A : AutomorphismPackage G) (E : AutomorphismEvidence A) :
    AutomorphismClosed A := by
  exact And.intro E.innerAutomorphismSubgroupClosed E.outerAutomorphismGroupClosed

end AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean
end HautevilleHouse