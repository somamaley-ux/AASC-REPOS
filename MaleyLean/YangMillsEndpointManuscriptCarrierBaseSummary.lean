import MaleyLean.Papers.YangMills.Surface.EndpointManuscriptCarrierBaseSummary

namespace MaleyLean

theorem YangMillsEndpointManuscriptCarrierBaseSummaryTopExportStatement
  (B : YMEndpointManuscriptCarrierBase) :
  B.Omega_loc = B.Omega_loc /\
  B.phi_star = B.phi_star /\
  B.E_ren = B.E_ren := by
  exact YangMillsEndpointManuscriptCarrierBaseSummaryStatement B

end MaleyLean
