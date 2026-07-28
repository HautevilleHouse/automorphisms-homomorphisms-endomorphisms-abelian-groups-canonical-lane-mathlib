import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean

structure AutomorphismPackage {G : AdmittedObject} where
  map : G.G → G.G
  isAutomorphism : Prop
  invertible : Prop
  preservesGroupStructure : Prop
  kernelTrivial : Prop
  imageFull : Prop

structure AutomorphismEvidence {G : AdmittedObject} (P : AutomorphismPackage (G := G)) where
  isAutomorphismClosed : P.isAutomorphism
  invertibleClosed : P.invertible
  preservesGroupStructureClosed : P.preservesGroupStructure
  kernelTrivialClosed : P.kernelTrivial
  imageFullClosed : P.imageFull

def AutomorphismWitnessClosed {G : AdmittedObject} (P : AutomorphismPackage (G := G)) : Prop :=
  P.isAutomorphism ∧ P.invertible ∧ P.preservesGroupStructure

theorem automorphism_closed_from_evidence {G : AdmittedObject} (P : AutomorphismPackage (G := G))
    (E : AutomorphismEvidence P) : AutomorphismWitnessClosed P := by
  exact And.intro E.isAutomorphismClosed (And.intro E.invertibleClosed E.preservesGroupStructureClosed)

end AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean
end HautevilleHouse