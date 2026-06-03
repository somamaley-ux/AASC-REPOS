import MaleyLean.Papers.YangMills.Kernel.EndpointCorrelationConstructionStage

namespace MaleyLean

theorem YangMillsEndpointCorrelationConstructionStageSummaryStatement :
  forall R : YMEndpointCore,
    forall hE : R.euclidean_dossier_ready,
      forall hP : R.endpoint_packet_ready,
        forall vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector,
          forall testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space,
            forall field : (YangMillsEndpointSemanticBundleData R hE hP).field_family,
              Nonempty (YMEndpointCorrelationConstructionStage R) /\
              ((YangMillsEndpointCorrelationConstructionStageData
                  R hE hP vac testFn field).smearing_stage.trace.certificates.law_atoms.interface.bundle.evaluate_vacuum_correlation
                  (YangMillsEndpointCorrelationConstructionStageData
                    R hE hP vac testFn field).chosen_vacuum_vector
                  (YangMillsEndpointCorrelationConstructionStageData
                    R hE hP vac testFn field).chosen_smeared_operator =
                (YangMillsEndpointCorrelationConstructionStageData
                  R hE hP vac testFn field).constructed_vacuum_correlation) := by
  exact YangMillsEndpointCorrelationConstructionStageExportStatement

end MaleyLean
