import Mathlib.GroupTheory.GroupAction.Basic

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean

structure GroupObject where
  carrier : Type
  group : Group carrier
  homomorphismToAutomorphism : Prop
  automorphismGroupClosed : Prop
  conclusion : automorphismGroupClosed

structure GroupEndgameState where
  object : GroupObject

def GroupWitnessClosed (O : GroupObject) : Prop :=
  O.automorphismGroupClosed

end AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean
end HautevilleHouse