import MaleyLean.Papers.YangMills.Kernel.EndpointTheoremObjects

namespace MaleyLean

/--
Explicit proof-home package for the reconstruction side of the endpoint heart.
-/
structure YMEndpointReconstructionProofHome (R : YMEndpointCore) where
  bundle : YMEndpointSemanticBundle R
  reconstruction_ready_certificate : R.reconstruction_ready
  wightman_fields_certificate : R.reconstruction_package.wightman_fields_present
  vacuum_vector_certificate : R.reconstruction_package.vacuum_vector_present
  smearing_certificate : R.reconstruction_package.smearing_defined
  vacuum_correlations_certificate : R.reconstruction_package.vacuum_correlations_defined

/--
Explicit proof-home package for one chosen smear/correlate site supporting the
endpoint exactness witness.
-/
structure YMEndpointCorrelationProofHome (R : YMEndpointCore) where
  law_package : YMEndpointCorrelationLawPackage R
  smearing_relation :
    law_package.interface.bundle.smear_field
      law_package.interface.chosen_test_function
      law_package.interface.chosen_field =
    law_package.interface.chosen_smeared_operator
  vacuum_correlation_relation :
    law_package.interface.bundle.evaluate_vacuum_correlation
      law_package.interface.chosen_vacuum_vector
      law_package.interface.chosen_smeared_operator =
    law_package.interface.chosen_vacuum_correlation
  chosen_correlation_law :
    law_package.correlate_smeared_field
      law_package.interface.chosen_vacuum_vector
      law_package.interface.chosen_test_function
      law_package.interface.chosen_field =
    law_package.interface.chosen_vacuum_correlation
  exact_endpoint_from_correlations :
    R.reconstruction_package.vacuum_correlations_defined ->
    R.endpoint_object.exact_local_net_endpoint
  exact_endpoint_witness : R.endpoint_object.exact_local_net_endpoint

/-- Explicit proof-home package for the endpoint universality exports. -/
structure YMEndpointUniversalityProofHome (R : YMEndpointCore) where
  theorem_content : YMEndpointTheoremContent R
  faithful_wilson_universality_hypotheses :
    ym_faithful_wilson_universality_hypotheses_statement R
  qualitative_faithful_wilson_universality :
    ym_qualitative_faithful_wilson_universality_of_continuum_local_theory_statement R
  exact_endpoint_exclusion_statement :
    ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement R

/-- Combined native proof-home package for the current endpoint heart. -/
structure YMEndpointNativeProofHomes (R : YMEndpointCore) where
  reconstruction_home : YMEndpointReconstructionProofHome R
  correlation_home : YMEndpointCorrelationProofHome R
  universality_home : YMEndpointUniversalityProofHome R

def YangMillsEndpointReconstructionProofHomeData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready) :
  YMEndpointReconstructionProofHome R := by
  let B := YangMillsEndpointSemanticBundleData R hE hP
  exact
    { bundle := B
      reconstruction_ready_certificate := B.reconstruction_ready
      wightman_fields_certificate := B.wightman_fields_present
      vacuum_vector_certificate := B.vacuum_vector_present
      smearing_certificate := B.smearing_defined
      vacuum_correlations_certificate := B.vacuum_correlations_defined }

def YangMillsEndpointCorrelationProofHomeData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  YMEndpointCorrelationProofHome R := by
  let P := YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field
  exact
    { law_package := P
      smearing_relation := P.interface.smearing_relation
      vacuum_correlation_relation := P.interface.vacuum_correlation_relation
      chosen_correlation_law := P.chosen_site_law
      exact_endpoint_from_correlations := P.exact_endpoint_from_correlations
      exact_endpoint_witness := P.exact_endpoint_witness }

def YangMillsEndpointUniversalityProofHomeData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready) :
  YMEndpointUniversalityProofHome R := by
  let hendpoint := YangMillsEndpointExplicitStatementFromReadinessStatement R hE hP
  let T := YangMillsEndpointTheoremContentData R hendpoint
  exact
    { theorem_content := T
      faithful_wilson_universality_hypotheses :=
        T.faithful_wilson_universality_hypotheses
      qualitative_faithful_wilson_universality :=
        T.qualitative_faithful_wilson_universality_of_continuum_local_theory
      exact_endpoint_exclusion_statement :=
        T.exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data }

def YangMillsEndpointNativeProofHomesData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  YMEndpointNativeProofHomes R := by
  exact
    { reconstruction_home :=
        YangMillsEndpointReconstructionProofHomeData R hE hP
      correlation_home :=
        YangMillsEndpointCorrelationProofHomeData R hE hP vac testFn field
      universality_home :=
        YangMillsEndpointUniversalityProofHomeData R hE hP }

theorem YangMillsEndpointNativeProofHomesExportStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  Nonempty (YMEndpointNativeProofHomes R) /\
  ym_source_labels .wightmanHaagKastlerReconstruction = ["M.3"] /\
  ym_source_labels .fieldCorrespondence = ["M.4"] /\
  ym_source_labels .faithfulWilsonUniversalityHypotheses = ["O.2"] /\
  ym_source_labels .qualitativeFaithfulWilsonUniversalityOfContinuumLocalTheory = ["O.3"] /\
  ym_source_labels .exactLocalNetEndpointAndExclusionOfExtendedSupportSectorData = ["O.5"] /\
  ym_endpoint_witness_source_labels .reconstructionReadinessWitness = ["M.3"] /\
  ym_endpoint_witness_source_labels .wightmanFieldsWitness = ["M.3", "M.4"] /\
  ym_endpoint_witness_source_labels .vacuumVectorWitness = ["M.4"] /\
  ym_endpoint_witness_source_labels .exactEndpointWitness = ["O.5"] /\
  R.reconstruction_ready /\
  R.reconstruction_package.wightman_fields_present /\
  R.reconstruction_package.vacuum_vector_present /\
  R.reconstruction_package.smearing_defined /\
  R.reconstruction_package.vacuum_correlations_defined /\
  R.endpoint_object.exact_local_net_endpoint /\
  ym_faithful_wilson_universality_hypotheses_statement R /\
  ym_qualitative_faithful_wilson_universality_of_continuum_local_theory_statement R /\
  ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement R /\
  ((YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).correlate_smeared_field
      (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_vacuum_vector
      (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_test_function
      (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_field =
    (YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field).interface.chosen_vacuum_correlation) := by
  let A := YangMillsEndpointNativeProofHomesData R hE hP vac testFn field
  exact
    And.intro (Nonempty.intro A) <|
      And.intro rfl <|
        And.intro rfl <|
          And.intro rfl <|
            And.intro rfl <|
              And.intro rfl <|
                And.intro rfl <|
                  And.intro rfl <|
                    And.intro rfl <|
                      And.intro rfl <|
                        And.intro A.reconstruction_home.reconstruction_ready_certificate <|
                          And.intro A.reconstruction_home.wightman_fields_certificate <|
                            And.intro A.reconstruction_home.vacuum_vector_certificate <|
                              And.intro A.reconstruction_home.smearing_certificate <|
                                And.intro A.reconstruction_home.vacuum_correlations_certificate <|
                                  And.intro A.correlation_home.exact_endpoint_witness <|
                                    And.intro
                                      A.universality_home.faithful_wilson_universality_hypotheses <|
                                      And.intro
                                        A.universality_home.qualitative_faithful_wilson_universality <|
                                        And.intro
                                          A.universality_home.exact_endpoint_exclusion_statement
                                          A.correlation_home.chosen_correlation_law

end MaleyLean
