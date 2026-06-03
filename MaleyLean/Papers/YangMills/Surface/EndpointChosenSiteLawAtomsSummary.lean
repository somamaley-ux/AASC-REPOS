import MaleyLean.Papers.YangMills.Kernel.EndpointChosenSiteLawAtoms

namespace MaleyLean

theorem YangMillsEndpointChosenSiteLawAtomsSummaryStatement :
  forall R : YMEndpointCore,
    forall hE : R.euclidean_dossier_ready,
      forall hP : R.endpoint_packet_ready,
        forall vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector,
          forall testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space,
            forall field : (YangMillsEndpointSemanticBundleData R hE hP).field_family,
              Nonempty (YMEndpointChosenSiteLawAtoms R) /\
              ((YangMillsEndpointRelationalInterfaceData
                  R hE hP vac testFn field).bundle.smear_field
                  (YangMillsEndpointRelationalInterfaceData
                    R hE hP vac testFn field).chosen_test_function
                  (YangMillsEndpointRelationalInterfaceData
                    R hE hP vac testFn field).chosen_field =
                (YangMillsEndpointRelationalInterfaceData
                  R hE hP vac testFn field).chosen_smeared_operator) /\
              ((YangMillsEndpointRelationalInterfaceData
                  R hE hP vac testFn field).bundle.evaluate_vacuum_correlation
                  (YangMillsEndpointRelationalInterfaceData
                    R hE hP vac testFn field).chosen_vacuum_vector
                  (YangMillsEndpointRelationalInterfaceData
                    R hE hP vac testFn field).chosen_smeared_operator =
                (YangMillsEndpointRelationalInterfaceData
                  R hE hP vac testFn field).chosen_vacuum_correlation) /\
              ((YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).correlate_smeared_field
                  (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_vacuum_vector
                  (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_test_function
                  (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_field =
                (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_vacuum_correlation) := by
  exact YangMillsEndpointChosenSiteLawAtomsExportStatement

end MaleyLean
