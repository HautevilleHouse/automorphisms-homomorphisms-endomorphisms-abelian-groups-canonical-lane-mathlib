import AutomorphismsHomomorphismsEndomorphismsAbelianGroups.GroupHomomorphismPackage

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroups

structure GroupEndomorphismPackage (G : AdmittedGroupObject) where
  map : G.carrier → G.carrier
  respectsMul : ∀ a b : G.carrier, map (a * b) = map a * map b
  sendsOne : map 1 = 1

structure GroupEndomorphismEvidence {G : AdmittedGroupObject} (E : GroupEndomorphismPackage G) where
  respectsMulClosed : E.respectsMul
  sendsOneClosed : E.sendsOne

def GroupEndomorphismClosed {G : AdmittedGroupObject} (E : GroupEndomorphismPackage G) : Prop :=
  E.respectsMul ∧ E.sendsOne

theorem group_endomorphism_closed_from_evidence {G : AdmittedGroupObject} (E : GroupEndomorphismPackage G) (Ev : GroupEndomorphismEvidence E) : GroupEndomorphismClosed E :=
  And.intro Ev.respectsMulClosed Ev.sendsOneClosed

end AutomorphismsHomomorphismsEndomorphismsAbelianGroups
end HautevilleHouse
