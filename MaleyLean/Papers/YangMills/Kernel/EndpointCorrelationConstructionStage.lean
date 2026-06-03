import MaleyLean.Papers.YangMills.Kernel.EndpointSmearingConstructionStage

namespace MaleyLean

/-- Primitive correlation construction stage for the endpoint heart. -/
structure YMEndpointCorrelationConstructionStage (R : YMEndpointCore) where
  smearing_stage : YMEndpointSmearingConstructionStage R
  chosen_vacuum_vector := smearing_stage.trace.chosen_vacuum_vector
  chosen_smeared_operator := smearing_stage.constructed_smeared_operator
  constructed_vacuum_correlation := smearing_stage.trace.chosen_vacuum_correlation
  correlation_construction :
    smearing_stage.trace.certificates.law_atoms.interface.bundle.evaluate_vacuum_correlation
      chosen_vacuum_vector
      chosen_smeared_operator =
    constructed_vacuum_correlation

def YangMillsEndpointCorrelationConstructionStageData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  YMEndpointCorrelationConstructionStage R := by
  let S := YangMillsEndpointSmearingConstructionStageData R hE hP vac testFn field
  exact
    { smearing_stage := S
      correlation_construction := S.trace.certificates.correlation_application }

theorem YangMillsEndpointCorrelationConstructionStageExportStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  Nonempty (YMEndpointCorrelationConstructionStage R) /\
  ((YangMillsEndpointCorrelationConstructionStageData
      R hE hP vac testFn field).smearing_stage.trace.certificates.law_atoms.interface.bundle.evaluate_vacuum_correlation
      (YangMillsEndpointCorrelationConstructionStageData
        R hE hP vac testFn field).chosen_vacuum_vector
      (YangMillsEndpointCorrelationConstructionStageData
        R hE hP vac testFn field).chosen_smeared_operator =
    (YangMillsEndpointCorrelationConstructionStageData
      R hE hP vac testFn field).constructed_vacuum_correlation) := by
  let T := YangMillsEndpointCorrelationConstructionStageData R hE hP vac testFn field
  exact And.intro (Nonempty.intro T) T.correlation_construction

end MaleyLean
