import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean

structure GroupPackage where
  carrier : Type u
  groupOp : carrier → carrier → carrier
  identity : carrier
  inverse : carrier → carrier
  associativity : ∀ a b c : carrier, groupOp (groupOp a b) c = groupOp a (groupOp b c)
  identityLeft : ∀ a : carrier, groupOp identity a = a
  identityRight : ∀ a : carrier, groupOp a identity = a
  inverseLeft : ∀ a : carrier, groupOp (inverse a) a = identity
  inverseRight : ∀ a : carrier, groupOp a (inverse a) = identity

structure GroupEvidence (G : GroupPackage) where
  associativityClosed : G.associativity
  identityLeftClosed : G.identityLeft
  identityRightClosed : G.identityRight
  inverseLeftClosed : G.inverseLeft
  inverseRightClosed : G.inverseRight

def GroupClosed (G : GroupPackage) : Prop :=
  G.associativity ∧ G.identityLeft ∧ G.identityRight ∧ G.inverseLeft ∧ G.inverseRight

theorem group_closed_from_evidence (G : GroupPackage) (E : GroupEvidence G) : GroupClosed G :=
  And.intro E.associativityClosed
    (And.intro E.identityLeftClosed
      (And.intro E.identityRightClosed (And.intro E.inverseLeftClosed E.inverseRightClosed)))

end AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean
end HautevilleHouse