import MaleyLean.Papers.YangMills.Kernel.EndpointCorrelationLawPackage

namespace MaleyLean

/--
Surface-level summary exposing the structured endpoint correlation law package.
-/
theorem YangMillsEndpointCorrelationLawPackageSummaryStatement :
  forall R : YMEndpointCore,
    forall hE : R.euclidean_dossier_ready,
      forall hP : R.endpoint_packet_ready,
        forall vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector,
          forall testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space,
            forall field : (YangMillsEndpointSemanticBundleData R hE hP).field_family,
              let P := YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field
              Nonempty (YMEndpointCorrelationLawPackage R) /\
              P.correlate_smeared_field vac testFn field =
                P.interface.chosen_vacuum_correlation /\
              R.endpoint_object.exact_local_net_endpoint := by
  intro R hE hP vac testFn field
  exact YangMillsEndpointCorrelationLawPackageWitnessStatement R hE hP vac testFn field

end MaleyLean
