import MaleyLean.Papers.YangMills.Kernel.EndpointNativeProofHomes

namespace MaleyLean

/-- Surface-level summary exposing the endpoint native proof-home package. -/
theorem YangMillsEndpointNativeProofHomesSummaryStatement :
  forall R : YMEndpointCore,
    forall hE : R.euclidean_dossier_ready,
      forall hP : R.endpoint_packet_ready,
        forall vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector,
          forall testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space,
            forall field : (YangMillsEndpointSemanticBundleData R hE hP).field_family,
              Nonempty (YMEndpointNativeProofHomes R) /\
              ym_source_labels .wightmanHaagKastlerReconstruction = ["M.3"] /\
              ym_source_labels .fieldCorrespondence = ["M.4"] /\
              ym_source_labels .faithfulWilsonUniversalityHypotheses = ["O.2"] /\
              ym_source_labels .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory = ["O.3"] /\
              ym_source_labels .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData = ["O.5"] /\
              ym_endpoint_witness_source_labels .reconstructionReadinessWitness = ["M.3"] /\
              ym_endpoint_witness_source_labels .wightmanFieldsWitness = ["M.3", "M.4"] /\
              ym_endpoint_witness_source_labels .vacuumVectorWitness = ["M.4"] /\
              ym_endpoint_witness_source_labels .exactEndpointWitness = ["O.5"] /\
              R.reconstruction_ready /\
              R.reconstruction_package.wightman_fields_present /\
              R.reconstruction_package.vacuum_vector_present /\
              R.reconstruction_package.smearing_defined /\
              R.reconstruction_package.vacuum_correlations_defined /\
              R.endpoint_object.exact_local_net_endpoint /\
              ym_faithful_wilson_universality_hypotheses_statement R /\
              ym_qualitative_faithful_wilson_universality_of_continuum_local_theory_statement R /\
              ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement R /\
              ((YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).correlate_smeared_field
                  (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_vacuum_vector
                  (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_test_function
                  (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_field =
                (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_vacuum_correlation) := by
  exact YangMillsEndpointNativeProofHomesExportStatement

end MaleyLean
