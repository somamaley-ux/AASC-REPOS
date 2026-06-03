import MaleyLean.Papers.YangMills.Kernel.EndpointSmearingConstructionStage

namespace MaleyLean

theorem YangMillsEndpointSmearingConstructionStageSummaryStatement :
  forall R : YMEndpointCore,
    forall hE : R.euclidean_dossier_ready,
      forall hP : R.endpoint_packet_ready,
        forall vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector,
          forall testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space,
            forall field : (YangMillsEndpointSemanticBundleData R hE hP).field_family,
              Nonempty (YMEndpointSmearingConstructionStage R) /\
              ((YangMillsEndpointSmearingConstructionStageData
                  R hE hP vac testFn field).trace.certificates.law_atoms.interface.bundle.smear_field
                  (YangMillsEndpointSmearingConstructionStageData
                    R hE hP vac testFn field).chosen_test_function
                  (YangMillsEndpointSmearingConstructionStageData
                    R hE hP vac testFn field).chosen_field =
                (YangMillsEndpointSmearingConstructionStageData
                  R hE hP vac testFn field).constructed_smeared_operator) := by
  exact YangMillsEndpointSmearingConstructionStageExportStatement

end MaleyLean
