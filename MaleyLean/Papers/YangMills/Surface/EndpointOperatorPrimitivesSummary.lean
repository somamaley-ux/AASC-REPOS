import MaleyLean.Papers.YangMills.Kernel.EndpointOperatorPrimitives

namespace MaleyLean

theorem YangMillsEndpointOperatorPrimitivesSummaryStatement :
  forall R : YMEndpointCore,
    forall hE : R.euclidean_dossier_ready,
      forall hP : R.endpoint_packet_ready,
        forall vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector,
          forall testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space,
            forall field : (YangMillsEndpointSemanticBundleData R hE hP).field_family,
              forall op : (YangMillsEndpointSemanticBundleData R hE hP).smeared_field_operator,
                Nonempty (YMEndpointOperatorPrimitives R) /\
                (YangMillsEndpointOperatorPrimitivesData R hE hP).smear_operator testFn field =
                  (YangMillsEndpointSemanticBundleData R hE hP).smear_field testFn field /\
                (YangMillsEndpointOperatorPrimitivesData R hE hP).correlate_operator vac op =
                  (YangMillsEndpointSemanticBundleData R hE hP).evaluate_vacuum_correlation vac op := by
  exact YangMillsEndpointOperatorPrimitivesExportStatement

end MaleyLean
