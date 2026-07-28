import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean

structure HomomorphismPackage {G : AdmittedObject} where
  source : G.G → G.G
  target : G.G → G.G
  isHomomorphism : Prop
  kernel : Set G.G
  image : Set G.G
  respectsComposition : Prop
  respectsIdentity : Prop

structure HomomorphismEvidence {G : AdmittedObject} (P : HomomorphismPackage (G := G)) where
  isHomomorphismClosed : P.isHomomorphism
  kernelClosed : P.kernel = {x : G.G | P.source x = 1}
  imageClosed : P.image = {y : G.G | ∃ x : G.G, P.source x = y}
  respectsCompositionClosed : P.respectsComposition
  respectsIdentityClosed : P.respectsIdentity

def HomomorphismWitnessClosed {G : AdmittedObject} (P : HomomorphismPackage (G := G)) : Prop :=
  P.isHomomorphism ∧ P.respectsComposition ∧ P.respectsIdentity

theorem homomorphism_closed_from_evidence {G : AdmittedObject} (P : HomomorphismPackage (G := G))
    (E : HomomorphismEvidence P) : HomomorphismWitnessClosed P := by
  exact And.intro E.isHomomorphismClosed (And.intro E.respectsCompositionClosed E.respectsIdentityClosed)

end AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean
end HautevilleHouse