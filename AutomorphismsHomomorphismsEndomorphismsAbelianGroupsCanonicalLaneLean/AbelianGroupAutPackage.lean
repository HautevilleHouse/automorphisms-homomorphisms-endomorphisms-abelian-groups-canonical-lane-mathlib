import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean

structure AbelianGroupAutPackage where
  G : Type u
  [instAddCommGroup : AddCommGroup G]
  automorphismGroup : Type v
  [instGroup : Group automorphismGroup]
  action : automorphismGroup → G → G
  actionIsAutomorphism : ∀ φ, AddEquiv G G
  compositionClosed : ∀ φ ψ, action (φ * ψ) = action φ ∘ action ψ
  identityAction : action 1 = id

structure AbelianGroupAutEvidence (A : AbelianGroupAutPackage) where
  actionIsAutomorphismClosed : ∀ φ : A.automorphismGroup, AddEquiv A.G A.G
  compositionClosedClosed : ∀ φ ψ : A.automorphismGroup, A.action (φ * ψ) = A.action φ ∘ A.action ψ
  identityActionClosed : A.action 1 = id

def AbelianGroupAutClosed (A : AbelianGroupAutPackage) : Prop :=
  (∀ φ : A.automorphismGroup, AddEquiv A.G A.G) ∧
  (∀ φ ψ : A.automorphismGroup, A.action (φ * ψ) = A.action φ ∘ A.action ψ) ∧
  (A.action 1 = id)

theorem abelian_group_aut_closed_from_evidence (A : AbelianGroupAutPackage) (E : AbelianGroupAutEvidence A) :
    AbelianGroupAutClosed A := by
  exact And.intro E.actionIsAutomorphismClosed
    (And.intro E.compositionClosedClosed E.identityActionClosed)

end AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean
end HautevilleHouse