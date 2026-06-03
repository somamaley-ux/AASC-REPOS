import MaleyLean.Papers.YangMills.Kernel.EndpointChosenSiteExecutionTrace

namespace MaleyLean

/-- Primitive smearing construction stage for the endpoint heart. -/
structure YMEndpointSmearingConstructionStage (R : YMEndpointCore) where
  trace : YMEndpointChosenSiteExecutionTrace R
  chosen_test_function := trace.chosen_test_function
  chosen_field := trace.chosen_field
  constructed_smeared_operator := trace.chosen_smeared_operator
  smearing_construction :
    trace.certificates.law_atoms.interface.bundle.smear_field
      chosen_test_function
      chosen_field =
    constructed_smeared_operator

def YangMillsEndpointSmearingConstructionStageData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  YMEndpointSmearingConstructionStage R := by
  let T := YangMillsEndpointChosenSiteExecutionTraceData R hE hP vac testFn field
  exact
    { trace := T
      smearing_construction := T.certificates.smearing_application }

theorem YangMillsEndpointSmearingConstructionStageExportStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  Nonempty (YMEndpointSmearingConstructionStage R) /\
  ((YangMillsEndpointSmearingConstructionStageData
      R hE hP vac testFn field).trace.certificates.law_atoms.interface.bundle.smear_field
      (YangMillsEndpointSmearingConstructionStageData
        R hE hP vac testFn field).chosen_test_function
      (YangMillsEndpointSmearingConstructionStageData
        R hE hP vac testFn field).chosen_field =
    (YangMillsEndpointSmearingConstructionStageData
      R hE hP vac testFn field).constructed_smeared_operator) := by
  let T := YangMillsEndpointSmearingConstructionStageData R hE hP vac testFn field
  exact And.intro (Nonempty.intro T) T.smearing_construction

end MaleyLean
