import MaleyLean.Papers.YangMills.Kernel.EndpointReconstructionOperationsConstructionStage

namespace MaleyLean

theorem YangMillsEndpointReconstructionOperationsConstructionStageSummaryStatement :
  forall R : YMEndpointCore,
    forall hE : R.euclidean_dossier_ready,
      forall hP : R.endpoint_packet_ready,
        Nonempty (YMEndpointReconstructionOperationsConstructionStage R) /\
        ((YangMillsEndpointReconstructionOperationsConstructionStageData R hE hP).constructed_test_function_space =
          R.reconstruction_package.test_function_space) /\
        ((YangMillsEndpointReconstructionOperationsConstructionStageData R hE hP).constructed_smeared_field_operator =
          R.reconstruction_package.smeared_field_operator) /\
        ((YangMillsEndpointReconstructionOperationsConstructionStageData R hE hP).constructed_vacuum_correlation_family =
          R.reconstruction_package.vacuum_correlation_family) /\
        R.reconstruction_package.smearing_defined /\
        R.reconstruction_package.vacuum_correlations_defined := by
  exact YangMillsEndpointReconstructionOperationsConstructionStageExportStatement

end MaleyLean
