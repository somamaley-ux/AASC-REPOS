import MaleyLean.Papers.YangMills.Kernel.EndpointManuscriptCarrierBase

namespace MaleyLean

theorem YangMillsEndpointManuscriptCarrierBaseSummaryStatement
  (B : YMEndpointManuscriptCarrierBase) :
  B.Omega_loc = B.Omega_loc /\
  B.phi_star = B.phi_star /\
  B.E_ren = B.E_ren := by
  exact YangMillsEndpointManuscriptCarrierBaseStatement B

end MaleyLean
