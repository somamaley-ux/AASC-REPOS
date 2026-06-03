import MaleyLean.Papers.YangMills.Kernel.EndpointChosenSiteLawAtoms

namespace MaleyLean

/-- Primitive endpoint operators underlying the current semantic bundle. -/
structure YMEndpointOperatorPrimitives (R : YMEndpointCore) where
  bundle : YMEndpointSemanticBundle R
  smear_operator :
    bundle.test_function_space -> bundle.field_family -> bundle.smeared_field_operator
  correlate_operator :
    bundle.vacuum_vector -> bundle.smeared_field_operator -> bundle.vacuum_correlation_family

def YangMillsEndpointOperatorPrimitivesData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready) :
  YMEndpointOperatorPrimitives R := by
  let B := YangMillsEndpointSemanticBundleData R hE hP
  exact
    { bundle := B
      smear_operator := B.smear_field
      correlate_operator := B.evaluate_vacuum_correlation }

theorem YangMillsEndpointOperatorPrimitivesExportStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family)
  (op : (YangMillsEndpointSemanticBundleData R hE hP).smeared_field_operator) :
  Nonempty (YMEndpointOperatorPrimitives R) /\
  (YangMillsEndpointOperatorPrimitivesData R hE hP).smear_operator testFn field =
    (YangMillsEndpointSemanticBundleData R hE hP).smear_field testFn field /\
  (YangMillsEndpointOperatorPrimitivesData R hE hP).correlate_operator vac op =
    (YangMillsEndpointSemanticBundleData R hE hP).evaluate_vacuum_correlation vac op := by
  let P := YangMillsEndpointOperatorPrimitivesData R hE hP
  exact And.intro (Nonempty.intro P) <| And.intro rfl rfl

end MaleyLean
