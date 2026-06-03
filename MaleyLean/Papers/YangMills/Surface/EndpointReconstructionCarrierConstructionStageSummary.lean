import MaleyLean.Papers.YangMills.Kernel.EndpointReconstructionCarrierConstructionStage

namespace MaleyLean

theorem YangMillsEndpointReconstructionCarrierConstructionStageSummaryStatement :
  forall R : YMEndpointCore,
    forall hE : R.euclidean_dossier_ready,
      forall hP : R.endpoint_packet_ready,
        Nonempty (YMEndpointReconstructionCarrierConstructionStage R) /\
        ((YangMillsEndpointReconstructionCarrierConstructionStageData R hE hP).source_dossier =
          R.reconstruction_package.from_dossier) /\
        ((YangMillsEndpointReconstructionCarrierConstructionStageData R hE hP).constructed_reconstructed_hilbert =
          R.reconstruction_package.reconstructed_hilbert) /\
        ((YangMillsEndpointReconstructionCarrierConstructionStageData R hE hP).constructed_field_family =
          R.reconstruction_package.field_family) /\
        ((YangMillsEndpointReconstructionCarrierConstructionStageData R hE hP).constructed_vacuum_vector =
          R.reconstruction_package.vacuum_vector) := by
  exact YangMillsEndpointReconstructionCarrierConstructionStageExportStatement

end MaleyLean
