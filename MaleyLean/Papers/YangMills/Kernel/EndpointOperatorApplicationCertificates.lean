import MaleyLean.Papers.YangMills.Kernel.EndpointOperatorPrimitives

namespace MaleyLean

/-- Chosen-site application certificates for the primitive endpoint operators. -/
structure YMEndpointOperatorApplicationCertificates (R : YMEndpointCore) where
  primitives_present : Nonempty (YMEndpointOperatorPrimitives R)
  law_atoms : YMEndpointChosenSiteLawAtoms R
  smearing_application :
    law_atoms.interface.bundle.smear_field
      law_atoms.interface.chosen_test_function
      law_atoms.interface.chosen_field =
    law_atoms.interface.chosen_smeared_operator
  correlation_application :
    law_atoms.interface.bundle.evaluate_vacuum_correlation
      law_atoms.interface.chosen_vacuum_vector
      law_atoms.interface.chosen_smeared_operator =
    law_atoms.interface.chosen_vacuum_correlation
  correlate_after_smear :
    law_atoms.interface.bundle.evaluate_vacuum_correlation
      law_atoms.interface.chosen_vacuum_vector
      (law_atoms.interface.bundle.smear_field
        law_atoms.interface.chosen_test_function
        law_atoms.interface.chosen_field) =
    law_atoms.interface.chosen_vacuum_correlation

def YangMillsEndpointOperatorApplicationCertificatesData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  YMEndpointOperatorApplicationCertificates R := by
  let P := YangMillsEndpointOperatorPrimitivesData R hE hP
  let A := YangMillsEndpointChosenSiteLawAtomsData R hE hP vac testFn field
  exact
    { primitives_present := Nonempty.intro P
      law_atoms := A
      smearing_application := by
        exact A.smearing_relation
      correlation_application := by
        exact A.vacuum_correlation_relation
      correlate_after_smear := by
        calc
          A.interface.bundle.evaluate_vacuum_correlation
              A.interface.chosen_vacuum_vector
              (A.interface.bundle.smear_field
                A.interface.chosen_test_function
                A.interface.chosen_field)
            =
          A.interface.bundle.evaluate_vacuum_correlation
              A.interface.chosen_vacuum_vector
              A.interface.chosen_smeared_operator := by
                simpa using congrArg
                  (fun op => A.interface.bundle.evaluate_vacuum_correlation
                    A.interface.chosen_vacuum_vector op)
                  A.smearing_relation
          _ = A.interface.chosen_vacuum_correlation := by
                exact A.vacuum_correlation_relation }

theorem YangMillsEndpointOperatorApplicationCertificatesExportStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  Nonempty (YMEndpointOperatorApplicationCertificates R) /\
  ((YangMillsEndpointOperatorPrimitivesData R hE hP).smear_operator
      (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_test_function
      (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_field =
    (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_smeared_operator) /\
  ((YangMillsEndpointOperatorPrimitivesData R hE hP).correlate_operator
      (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_vacuum_vector
      (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_smeared_operator =
    (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_vacuum_correlation) /\
  ((YangMillsEndpointOperatorPrimitivesData R hE hP).correlate_operator
      (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_vacuum_vector
      ((YangMillsEndpointOperatorPrimitivesData R hE hP).smear_operator
        (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_test_function
        (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_field) =
    (YangMillsEndpointRelationalInterfaceData R hE hP vac testFn field).chosen_vacuum_correlation) := by
  let C := YangMillsEndpointOperatorApplicationCertificatesData R hE hP vac testFn field
  exact
    And.intro (Nonempty.intro C) <|
      And.intro C.smearing_application <|
        And.intro C.correlation_application C.correlate_after_smear

end MaleyLean
