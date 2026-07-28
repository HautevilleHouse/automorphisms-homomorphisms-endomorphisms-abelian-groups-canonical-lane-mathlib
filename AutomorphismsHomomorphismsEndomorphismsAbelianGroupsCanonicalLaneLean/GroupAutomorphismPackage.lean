import AutomorphismsHomomorphismsEndomorphismsAbelianGroups.GroupEndomorphismPackage

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroups

structure GroupAutomorphismPackage {G : AdmittedGroupObject} (E : GroupEndomorphismPackage G) where
  isBijective : Prop
  bijectiveProof : isBijective

structure GroupAutomorphismEvidence {G : AdmittedGroupObject} {E : GroupEndomorphismPackage G} (A : GroupAutomorphismPackage E) where
  isBijectiveClosed : A.isBijective

def GroupAutomorphismClosed {G : AdmittedGroupObject} {E : GroupEndomorphismPackage G} (A : GroupAutomorphismPackage E) : Prop :=
  A.isBijective

theorem group_automorphism_closed_from_evidence {G : AdmittedGroupObject} {E : GroupEndomorphismPackage G} (A : GroupAutomorphismPackage E) (Ev : GroupAutomorphismEvidence A) : GroupAutomorphismClosed A :=
  Ev.isBijectiveClosed

end AutomorphismsHomomorphismsEndomorphismsAbelianGroups
end HautevilleHouse
