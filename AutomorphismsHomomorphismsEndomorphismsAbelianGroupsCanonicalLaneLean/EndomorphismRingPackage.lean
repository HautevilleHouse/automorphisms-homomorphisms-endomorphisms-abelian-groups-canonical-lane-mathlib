import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean.HomEndPackage

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean

structure EndomorphismRingPackage {A : AbelianGroupAutPackage} (H : HomomorphismPackage A) where
  endRing : Type v
  [instRing : Ring endRing]
  multiplicationIsComposition : ∀ f g : endRing, f * g = g ∘ f
  ringActionConsistent : ∀ f : endRing, H.application f = (f : H.homGroup).application

structure EndomorphismRingEvidence {A : AbelianGroupAutPackage} {H : HomomorphismPackage A} (E : EndomorphismRingPackage H) where
  multiplicationIsCompositionClosed : ∀ f g : E.endRing, f * g = g ∘ f
  ringActionConsistentClosed : ∀ f : E.endRing, H.application f = (f : H.homGroup).application

def EndomorphismRingClosed {A : AbelianGroupAutPackage} {H : HomomorphismPackage A} (E : EndomorphismRingPackage H) : Prop :=
  (∀ f g : E.endRing, f * g = g ∘ f) ∧
  (∀ f : E.endRing, H.application f = (f : H.homGroup).application)

theorem endomorphism_ring_closed_from_evidence {A : AbelianGroupAutPackage} {H : HomomorphismPackage A}
    (E : EndomorphismRingPackage H) (Ev : EndomorphismRingEvidence E) : EndomorphismRingClosed E := by
  exact And.intro Ev.multiplicationIsCompositionClosed Ev.ringActionConsistentClosed

end AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean
end HautevilleHouse