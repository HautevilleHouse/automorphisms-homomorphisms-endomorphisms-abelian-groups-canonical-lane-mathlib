import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean

structure EndomorphismPackage (G : GroupPackage) extends HomomorphismStructure G G

structure EndomorphismEvidence {G : GroupPackage} (E : EndomorphismPackage G) where
  preservesMulClosed : E.preservesMul

def EndomorphismClosed {G : GroupPackage} (E : EndomorphismPackage G) : Prop :=
  HomomorphismClosed E.toHomomorphismStructure

theorem endomorphism_closed_from_evidence {G : GroupPackage} (E : EndomorphismPackage G) (Ev : EndomorphismEvidence E) : EndomorphismClosed E :=
  homomorphism_closed_from_evidence E.toHomomorphismStructure (HomomorphismEvidence.mk Ev.preservesMulClosed)

end AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean
end HautevilleHouse