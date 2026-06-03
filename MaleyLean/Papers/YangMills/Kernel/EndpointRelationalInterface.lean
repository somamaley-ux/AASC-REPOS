import MaleyLean.Papers.YangMills.Kernel.EndpointSemanticBundle

namespace MaleyLean

/--
Endpoint-side relational interface expressing that the reconstructed smearing
and vacuum-correlation operations are organized around one chosen field test
site and one chosen vacuum-correlation evaluation site.
-/
structure YMEndpointRelationalInterface (R : YMEndpointCore) where
  bundle : YMEndpointSemanticBundle R
  chosen_vacuum_vector : bundle.vacuum_vector
  chosen_test_function : bundle.test_function_space
  chosen_field : bundle.field_family
  chosen_smeared_operator : bundle.smeared_field_operator
  chosen_vacuum_correlation : bundle.vacuum_correlation_family
  smearing_relation :
    bundle.smear_field chosen_test_function chosen_field = chosen_smeared_operator
  vacuum_correlation_relation :
    bundle.evaluate_vacuum_correlation chosen_vacuum_vector chosen_smeared_operator =
      chosen_vacuum_correlation

def YangMillsEndpointRelationalInterfaceData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  YMEndpointRelationalInterface R := by
  let B := YangMillsEndpointSemanticBundleData R hE hP
  refine
    { bundle := B
      chosen_vacuum_vector := vac
      chosen_test_function := testFn
      chosen_field := field
      chosen_smeared_operator := B.smear_field testFn field
      chosen_vacuum_correlation := B.evaluate_vacuum_correlation
        vac
        (B.smear_field testFn field)
      smearing_relation := rfl
      vacuum_correlation_relation := rfl }

theorem YangMillsEndpointRelationalInterfaceExistsStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  Nonempty (YMEndpointRelationalInterface R) := by
  exact ⟨YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field⟩

theorem YangMillsEndpointRelationalCompatibilityStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  Nonempty (YMEndpointRelationalInterface R) /\
  R.reconstruction_package.smearing_defined /\
  R.reconstruction_package.vacuum_correlations_defined /\
  R.endpoint_object.exact_local_net_endpoint := by
  have hI := YangMillsEndpointRelationalInterfaceExistsStatement R hE hP vac testFn field
  have hB := YangMillsEndpointCoreExhibitsNamedOutputsStatement R hE hP
  exact And.intro hI <| And.intro hB.2.2.2.1 <| And.intro hB.2.2.2.2.1 hB.2.2.2.2.2

end MaleyLean
