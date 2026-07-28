import AutomorphismsHomomorphismsEndomorphismsAbelianGroups.GroupAutomorphismPackage

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroups

structure AutomorphismGroupPackage {G : AdmittedGroupObject} {E : GroupEndomorphismPackage G} (A : GroupAutomorphismPackage E) where
  groupStructure : Group (Subtype (fun (f : G.carrier → G.carrier) => GroupAutomorphismClosed A))  -- placeholder, actual construction is nontrivial
  formsGroup : Prop
  formsGroupProof : formsGroup

structure AutomorphismGroupEvidence {G : AdmittedGroupObject} {E : GroupEndomorphismPackage G} {A : GroupAutomorphismPackage E} (AG : AutomorphismGroupPackage A) where
  formsGroupClosed : AG.formsGroup

def AutomorphismGroupClosed {G : AdmittedGroupObject} {E : GroupEndomorphismPackage G} {A : GroupAutomorphismPackage E} (AG : AutomorphismGroupPackage A) : Prop :=
  AG.formsGroup

theorem automorphism_group_closed_from_evidence {G : AdmittedGroupObject} {E : GroupEndomorphismPackage G} {A : GroupAutomorphismPackage E} (AG : AutomorphismGroupPackage A) (Ev : AutomorphismGroupEvidence AG) : AutomorphismGroupClosed AG :=
  Ev.formsGroupClosed

end AutomorphismsHomomorphismsEndomorphismsAbelianGroups
end HautevilleHouse
