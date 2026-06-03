import MaleyLean.Papers.YangMills.Kernel.EndpointCoreBuilder

namespace MaleyLean

theorem YangMillsEndpointCoreBuilderSummaryStatement
  (euclidean_dossier_ready : Prop)
  (reconstruction_ready : Prop)
  (endpoint_packet_ready : Prop)
  (endpoint_part : Prop)
  (dossier : YMEndpointDossier)
  (reconstruction_package : YMEndpointReconstructionPackage)
  (endpoint_object : YMEndpointObject)
  (build_endpoint_part :
    euclidean_dossier_ready ->
    reconstruction_ready ->
    endpoint_packet_ready ->
    endpoint_part)
  (dossier_yields_reconstruction :
    euclidean_dossier_ready -> reconstruction_ready)
  (reconstruction_exhibits_fields :
    reconstruction_ready -> reconstruction_package.wightman_fields_present)
  (reconstruction_exhibits_vacuum :
    reconstruction_ready -> reconstruction_package.vacuum_vector_present)
  (reconstruction_exhibits_smearing :
    reconstruction_ready -> reconstruction_package.smearing_defined)
  (reconstruction_exhibits_vacuum_correlations :
    reconstruction_ready -> reconstruction_package.vacuum_correlations_defined)
  (endpoint_packet_exhibits_exact_endpoint :
    endpoint_packet_ready -> endpoint_object.exact_local_net_endpoint)
  (hE : euclidean_dossier_ready)
  (hP : endpoint_packet_ready) :
  let RE :=
    YangMillsEndpointCoreData
      euclidean_dossier_ready reconstruction_ready endpoint_packet_ready endpoint_part
      dossier reconstruction_package endpoint_object
      build_endpoint_part dossier_yields_reconstruction
      reconstruction_exhibits_fields reconstruction_exhibits_vacuum
      reconstruction_exhibits_smearing reconstruction_exhibits_vacuum_correlations
      endpoint_packet_exhibits_exact_endpoint
  RE.reconstruction_ready /\
  RE.reconstruction_package.wightman_fields_present /\
  RE.reconstruction_package.vacuum_vector_present /\
  RE.reconstruction_package.smearing_defined /\
  RE.reconstruction_package.vacuum_correlations_defined /\
  RE.endpoint_object.exact_local_net_endpoint := by
  exact
    YangMillsEndpointCoreBuilderStatement
      euclidean_dossier_ready reconstruction_ready endpoint_packet_ready endpoint_part
      dossier reconstruction_package endpoint_object
      build_endpoint_part dossier_yields_reconstruction
      reconstruction_exhibits_fields reconstruction_exhibits_vacuum
      reconstruction_exhibits_smearing reconstruction_exhibits_vacuum_correlations
      endpoint_packet_exhibits_exact_endpoint
      hE hP

end MaleyLean
