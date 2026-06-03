import MaleyLean.Papers.YangMills.Surface.EndpointManuscriptCarriersSummary

namespace MaleyLean

theorem YangMillsEndpointManuscriptCarriersSummaryTopExportStatement
  (P : YMEndpointManuscriptCarrierPackage) :
  P.toDossier.reflection_positive = P.reflection_positive /\
  P.toDossier.os_data_complete = P.os_data_complete /\
  P.toReconstructionPackage.vacuum_vector_present = P.vacuum_vector_present /\
  P.toReconstructionPackage.wightman_fields_present = P.wightman_fields_present /\
  P.toEndpointObject.faithful_wilson_universality = P.faithful_wilson_universality /\
  P.toEndpointObject.exact_local_net_endpoint = P.exact_local_net_endpoint := by
  exact YangMillsEndpointManuscriptCarriersSummaryStatement P

end MaleyLean
