import MaleyLean.Papers.YangMills.Kernel.EndpointNativeProofHomes

namespace MaleyLean

/-- Atomic chosen-site law support object for the endpoint heart. -/
structure YMEndpointChosenSiteLawAtoms (R : YMEndpointCore) where
  interface : YMEndpointRelationalInterface R
  smearing_relation :
    interface.bundle.smear_field
      interface.chosen_test_function
      interface.chosen_field =
    interface.chosen_smeared_operator
  vacuum_correlation_relation :
    interface.bundle.evaluate_vacuum_correlation
      interface.chosen_vacuum_vector
      interface.chosen_smeared_operator =
    interface.chosen_vacuum_correlation
  chosen_correlation_law :
    interface.bundle.evaluate_vacuum_correlation
      interface.chosen_vacuum_vector
      (interface.bundle.smear_field
        interface.chosen_test_function
        interface.chosen_field) =
    interface.bundle.evaluate_vacuum_correlation
      interface.chosen_vacuum_vector
      interface.chosen_smeared_operator

def YangMillsEndpointChosenSiteLawAtomsData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  YMEndpointChosenSiteLawAtoms R := by
  let I := YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field
  exact
    { interface := I
      smearing_relation := I.smearing_relation
      vacuum_correlation_relation := I.vacuum_correlation_relation
      chosen_correlation_law := by
        rw [I.smearing_relation] }

theorem YangMillsEndpointChosenSiteLawAtomsExportStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  Nonempty (YMEndpointChosenSiteLawAtoms R) /\
  ((YangMillsEndpointRelationalInterfaceData
      R hE hP vac testFn field).bundle.smear_field
      (YangMillsEndpointRelationalInterfaceData
        R hE hP vac testFn field).chosen_test_function
      (YangMillsEndpointRelationalInterfaceData
        R hE hP vac testFn field).chosen_field =
    (YangMillsEndpointRelationalInterfaceData
      R hE hP vac testFn field).chosen_smeared_operator) /\
  ((YangMillsEndpointRelationalInterfaceData
      R hE hP vac testFn field).bundle.evaluate_vacuum_correlation
      (YangMillsEndpointRelationalInterfaceData
        R hE hP vac testFn field).chosen_vacuum_vector
      (YangMillsEndpointRelationalInterfaceData
        R hE hP vac testFn field).chosen_smeared_operator =
    (YangMillsEndpointRelationalInterfaceData
      R hE hP vac testFn field).chosen_vacuum_correlation) /\
  ((YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).correlate_smeared_field
      (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_vacuum_vector
      (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_test_function
      (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_field =
    (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_vacuum_correlation) := by
  let A := YangMillsEndpointChosenSiteLawAtomsData R hE hP vac testFn field
  exact
    And.intro (Nonempty.intro A) <|
      And.intro A.smearing_relation <|
        And.intro A.vacuum_correlation_relation <|
          calc
            (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).correlate_smeared_field
                (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_vacuum_vector
                (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_test_function
                (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_field
              =
            (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).bundle.evaluate_vacuum_correlation
                (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_vacuum_vector
                ((YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).bundle.smear_field
                  (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_test_function
                  (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_field) := by
                  rfl
            _ =
            (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).bundle.evaluate_vacuum_correlation
                (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_vacuum_vector
                (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_smeared_operator := by
                  exact A.chosen_correlation_law
            _ =
            (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_vacuum_correlation := by
                  exact A.vacuum_correlation_relation

end MaleyLean
