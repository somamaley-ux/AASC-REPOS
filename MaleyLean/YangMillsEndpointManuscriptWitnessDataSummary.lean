import MaleyLean.Papers.YangMills.Surface.EndpointManuscriptWitnessDataSummary

namespace MaleyLean

theorem YangMillsEndpointManuscriptWitnessDataSummaryTopExportStatement
  {B : YMEndpointManuscriptCarrierBase}
  (W : YMEndpointManuscriptWitnessData B) :
  let P := W.toCarrierPackage
  let O := W.toEndpointManuscriptObject
  P.Omega_loc = B.Omega_loc /\
  P.phi_star = B.phi_star /\
  P.E_ren = B.E_ren /\
  O.Omega_loc = B.Omega_loc /\
  O.phi_star = B.phi_star /\
  O.E_ren = B.E_ren := by
  exact YangMillsEndpointManuscriptWitnessDataSummaryStatement W

end MaleyLean
