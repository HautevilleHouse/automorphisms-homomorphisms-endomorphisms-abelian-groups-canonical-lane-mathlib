import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean.AbelianGroupAutPackage

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean

structure HomomorphismPackage (A : AbelianGroupAutPackage) where
  source : A.G
  target : Type u
  [instAddCommGroupTarget : AddCommGroup target]
  homGroup : Type v
  [instAddCommGroupHom : AddCommGroup homGroup]
  application : homGroup → A.G → target
  additivity : ∀ f g x, application (f + g) x = application f x + application g x
  preservesZero : ∀ f, application f 0 = 0
  preservesAdd : ∀ f x y, application f (x + y) = application f x + application f y

structure HomomorphismEvidence {A : AbelianGroupAutPackage} (H : HomomorphismPackage A) where
  additivityClosed : ∀ f g : H.homGroup, ∀ x : A.G, H.application (f + g) x = H.application f x + H.application g x
  preservesZeroClosed : ∀ f : H.homGroup, H.application f 0 = 0
  preservesAddClosed : ∀ f : H.homGroup, ∀ x y : A.G, H.application f (x + y) = H.application f x + H.application f y

def HomomorphismClosed {A : AbelianGroupAutPackage} (H : HomomorphismPackage A) : Prop :=
  (∀ f g : H.homGroup, ∀ x : A.G, H.application (f + g) x = H.application f x + H.application g x) ∧
  (∀ f : H.homGroup, H.application f 0 = 0) ∧
  (∀ f : H.homGroup, ∀ x y : A.G, H.application f (x + y) = H.application f x + H.application f y)

theorem homomorphism_closed_from_evidence {A : AbelianGroupAutPackage} (H : HomomorphismPackage A) (E : HomomorphismEvidence H) :
    HomomorphismClosed H := by
  exact And.intro E.additivityClosed
    (And.intro E.preservesZeroClosed E.preservesAddClosed)

end AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean
end HautevilleHouse