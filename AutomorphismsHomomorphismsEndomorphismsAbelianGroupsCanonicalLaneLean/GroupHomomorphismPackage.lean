import AutomorphismsHomomorphismsEndomorphismsAbelianGroups.AdmissibleClass

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroups

structure GroupHomomorphismPackage where
  source : Type
  target : Type
  sourceGroup : Group source
  targetGroup : Group target
  map : source → target
  respectsMul : ∀ a b : source, map (a * b) = map a * map b
  sendsOne : map 1 = 1

structure GroupHomomorphismEvidence (H : GroupHomomorphismPackage) where
  respectsMulClosed : H.respectsMul
  sendsOneClosed : H.sendsOne

def GroupHomomorphismClosed (H : GroupHomomorphismPackage) : Prop :=
  H.respectsMul ∧ H.sendsOne

theorem group_homomorphism_closed_from_evidence (H : GroupHomomorphismPackage) (E : GroupHomomorphismEvidence H) : GroupHomomorphismClosed H :=
  And.intro E.respectsMulClosed E.sendsOneClosed

end AutomorphismsHomomorphismsEndomorphismsAbelianGroups
end HautevilleHouse
