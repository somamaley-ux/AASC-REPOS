import MaleyLean.Papers.YangMills.Kernel.EndpointPrimitiveConstructions

namespace MaleyLean

theorem YangMillsEndpointPrimitiveConstructionsSummaryStatement :
  forall R : YMEndpointCore,
    forall hE : R.euclidean_dossier_ready,
      forall hP : R.endpoint_packet_ready,
        forall _vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector,
          forall _testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space,
            forall _field : (YangMillsEndpointSemanticBundleData R hE hP).field_family,
              Nonempty (YMEndpointPrimitiveConstructions R) /\
              Nonempty (YMEndpointReconstructionCarrierConstructionStage R) /\
              Nonempty (YMEndpointReconstructionOperationsConstructionStage R) /\
              Nonempty (YMEndpointSmearingConstructionStage R) /\
              Nonempty (YMEndpointCorrelationConstructionStage R) := by
  exact YangMillsEndpointPrimitiveConstructionsExportStatement

end MaleyLean
