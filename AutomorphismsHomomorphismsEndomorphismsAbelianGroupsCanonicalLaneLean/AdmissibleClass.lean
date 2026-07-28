import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroups

structure AdmittedGroupObject where
  carrier : Type
  group : Group carrier
  isAbelian : Prop
  abelianProof : isAbelian
  conclusion : isAbelian

structure AdmissibleClass where
  object : AdmittedGroupObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.isAbelian ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end AutomorphismsHomomorphismsEndomorphismsAbelianGroups
end HautevilleHouse
