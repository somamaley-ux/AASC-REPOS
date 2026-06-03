import MaleyLean.Papers.YangMills.Surface.EndpointManuscriptObjectSummary

namespace MaleyLean

theorem YangMillsEndpointManuscriptObjectSummaryTopExportStatement
  (P : YMEndpointManuscriptObject) :
  let RE := P.toEndpointCore
  let C := P.toChoices
  RE.dossier = P.dossier /\
  RE.reconstruction_package = P.reconstruction_package /\
  RE.endpoint_object = P.endpoint_object /\
  ym_endpoint_Omega_loc_of C = P.Omega_loc /\
  ym_endpoint_phi_star_of C = P.phi_star /\
  ym_endpoint_E_ren_of C = P.E_ren := by
  exact YangMillsEndpointManuscriptObjectSummaryStatement P

end MaleyLean
