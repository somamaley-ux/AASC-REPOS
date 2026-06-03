import MaleyLean.Papers.YangMills.Kernel.EndpointOperatorApplicationCertificates

namespace MaleyLean

/-- Explicit chosen-site endpoint inputs and outputs carried by the current operator layer. -/
structure YMEndpointChosenSiteExecutionTrace (R : YMEndpointCore) where
  certificates : YMEndpointOperatorApplicationCertificates R
  chosen_vacuum_vector := certificates.law_atoms.interface.chosen_vacuum_vector
  chosen_test_function := certificates.law_atoms.interface.chosen_test_function
  chosen_field := certificates.law_atoms.interface.chosen_field
  chosen_smeared_operator := certificates.law_atoms.interface.chosen_smeared_operator
  chosen_vacuum_correlation := certificates.law_atoms.interface.chosen_vacuum_correlation

def YangMillsEndpointChosenSiteExecutionTraceData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  YMEndpointChosenSiteExecutionTrace R := by
  exact
    { certificates := YangMillsEndpointOperatorApplicationCertificatesData R hE hP vac testFn field }

theorem YangMillsEndpointChosenSiteExecutionTraceExportStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  Nonempty (YMEndpointChosenSiteExecutionTrace R) /\
  ((YangMillsEndpointChosenSiteExecutionTraceData
      R hE hP vac testFn field).certificates.law_atoms.interface.bundle.smear_field
      (YangMillsEndpointChosenSiteExecutionTraceData
        R hE hP vac testFn field).chosen_test_function
      (YangMillsEndpointChosenSiteExecutionTraceData
        R hE hP vac testFn field).chosen_field =
    (YangMillsEndpointChosenSiteExecutionTraceData
      R hE hP vac testFn field).chosen_smeared_operator) /\
  ((YangMillsEndpointChosenSiteExecutionTraceData
      R hE hP vac testFn field).certificates.law_atoms.interface.bundle.evaluate_vacuum_correlation
      (YangMillsEndpointChosenSiteExecutionTraceData
        R hE hP vac testFn field).chosen_vacuum_vector
      (YangMillsEndpointChosenSiteExecutionTraceData
        R hE hP vac testFn field).chosen_smeared_operator =
    (YangMillsEndpointChosenSiteExecutionTraceData
      R hE hP vac testFn field).chosen_vacuum_correlation) /\
  ((YangMillsEndpointChosenSiteExecutionTraceData
      R hE hP vac testFn field).certificates.law_atoms.interface.bundle.evaluate_vacuum_correlation
      (YangMillsEndpointChosenSiteExecutionTraceData
        R hE hP vac testFn field).chosen_vacuum_vector
      ((YangMillsEndpointChosenSiteExecutionTraceData
        R hE hP vac testFn field).certificates.law_atoms.interface.bundle.smear_field
        (YangMillsEndpointChosenSiteExecutionTraceData
          R hE hP vac testFn field).chosen_test_function
        (YangMillsEndpointChosenSiteExecutionTraceData
          R hE hP vac testFn field).chosen_field) =
    (YangMillsEndpointChosenSiteExecutionTraceData
      R hE hP vac testFn field).chosen_vacuum_correlation) := by
  let T := YangMillsEndpointChosenSiteExecutionTraceData R hE hP vac testFn field
  exact
    And.intro (Nonempty.intro T) <|
      And.intro T.certificates.smearing_application <|
        And.intro T.certificates.correlation_application T.certificates.correlate_after_smear

end MaleyLean
