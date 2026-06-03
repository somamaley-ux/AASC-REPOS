import MaleyLean.Papers.YangMills.Surface.EndpointRelationalSummary

namespace MaleyLean

theorem YangMillsEndpointRelationalSummaryExportStatement :
  forall R : YMEndpointCore,
    forall hE : R.euclidean_dossier_ready,
      forall hP : R.endpoint_packet_ready,
        forall _vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector,
        forall _testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space,
          forall _field : (YangMillsEndpointSemanticBundleData R hE hP).field_family,
            Nonempty (YMEndpointRelationalInterface R) /\
            R.reconstruction_package.smearing_defined /\
            R.reconstruction_package.vacuum_correlations_defined /\
            R.endpoint_object.exact_local_net_endpoint := by
  intro R hE hP _vac _testFn _field
  exact
    YangMillsEndpointRelationalSummaryStatement
      R hE hP _vac _testFn _field

end MaleyLean
