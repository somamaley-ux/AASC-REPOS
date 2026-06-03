import MaleyLean.Papers.YangMills.Kernel.EndpointOperatorApplicationCertificates

namespace MaleyLean

theorem YangMillsEndpointOperatorApplicationCertificatesSummaryStatement :
  forall R : YMEndpointCore,
    forall hE : R.euclidean_dossier_ready,
      forall hP : R.endpoint_packet_ready,
        forall vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector,
          forall testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space,
            forall field : (YangMillsEndpointSemanticBundleData R hE hP).field_family,
              Nonempty (YMEndpointOperatorApplicationCertificates R) /\
              ((YangMillsEndpointOperatorPrimitivesData R hE hP).smear_operator
                  (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_test_function
                  (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_field =
                (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_smeared_operator) /\
              ((YangMillsEndpointOperatorPrimitivesData R hE hP).correlate_operator
                  (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_vacuum_vector
                  (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_smeared_operator =
                (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_vacuum_correlation) /\
              ((YangMillsEndpointOperatorPrimitivesData R hE hP).correlate_operator
                  (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_vacuum_vector
                  ((YangMillsEndpointOperatorPrimitivesData R hE hP).smear_operator
                    (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_test_function
                    (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_field) =
                (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_vacuum_correlation) := by
  exact YangMillsEndpointOperatorApplicationCertificatesExportStatement

end MaleyLean
