import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean.AbelianGroupAutPackage

namespace HautevilleHouse
namespace AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop := AbelianGroupAutClosed (A.object.autPackage)

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.autPackage.closedEvidence

end AutomorphismsHomomorphismsEndomorphismsAbelianGroupsCanonicalLaneLean
end HautevilleHouse