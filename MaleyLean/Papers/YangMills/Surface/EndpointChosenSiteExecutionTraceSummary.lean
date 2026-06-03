import MaleyLean.Papers.YangMills.Kernel.EndpointChosenSiteExecutionTrace

namespace MaleyLean

theorem YangMillsEndpointChosenSiteExecutionTraceSummaryStatement :
  forall R : YMEndpointCore,
    forall hE : R.euclidean_dossier_ready,
      forall hP : R.endpoint_packet_ready,
        forall vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector,
          forall testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space,
            forall field : (YangMillsEndpointSemanticBundleData R hE hP).field_family,
              Nonempty (YMEndpointChosenSiteExecutionTrace R) /\
              ((YangMillsEndpointChosenSiteExecutionTraceData
                  R hE hP vac testFn field).certificates.law_atoms.interface.bundle.smear_field
                  (YangMillsEndpointChosenSiteExecutionTraceData
                    R hE hP vac testFn field).chosen_test_function
                  (YangMillsEndpointChosenSiteExecutionTraceData
                    R hE hP vac testFn field).chosen_field =
                (YangMillsEndpointChosenSiteExecutionTraceData
                  R hE hP vac testFn field).chosen_smeared_operator) /\
              ((YangMillsEndpointChosenSiteExecutionTraceData
                  R hE hP vac testFn field).certificates.law_atoms.interface.bundle.evaluate_vacuum_correlation
                  (YangMillsEndpointChosenSiteExecutionTraceData
                    R hE hP vac testFn field).chosen_vacuum_vector
                  (YangMillsEndpointChosenSiteExecutionTraceData
                    R hE hP vac testFn field).chosen_smeared_operator =
                (YangMillsEndpointChosenSiteExecutionTraceData
                  R hE hP vac testFn field).chosen_vacuum_correlation) /\
              ((YangMillsEndpointChosenSiteExecutionTraceData
                  R hE hP vac testFn field).certificates.law_atoms.interface.bundle.evaluate_vacuum_correlation
                  (YangMillsEndpointChosenSiteExecutionTraceData
                    R hE hP vac testFn field).chosen_vacuum_vector
                  ((YangMillsEndpointChosenSiteExecutionTraceData
                    R hE hP vac testFn field).certificates.law_atoms.interface.bundle.smear_field
                    (YangMillsEndpointChosenSiteExecutionTraceData
                      R hE hP vac testFn field).chosen_test_function
                    (YangMillsEndpointChosenSiteExecutionTraceData
                      R hE hP vac testFn field).chosen_field) =
                (YangMillsEndpointChosenSiteExecutionTraceData
                  R hE hP vac testFn field).chosen_vacuum_correlation) := by
  exact YangMillsEndpointChosenSiteExecutionTraceExportStatement

end MaleyLean
