import MaleyLean.Papers.YangMills.Kernel.NamedEndpointTheoremContent
import MaleyLean.Papers.YangMills.Kernel.EndpointCorrelationLawPackage
import MaleyLean.Papers.YangMills.SourceCrosswalk.Register
import MaleyLean.Papers.YangMills.SourceCrosswalk.EndpointWitnessRegister

namespace MaleyLean

/--
Explicit theorem-facing payload for the reconstruction-side endpoint exports
(`M.3` / `M.4` as reflected in the current endpoint kernel).
-/
structure YMEndpointReconstructionTheoremObject (R : YMEndpointCore) where
  bundle : YMEndpointSemanticBundle R
  reconstruction_ready : R.reconstruction_ready
  wightman_fields_present : R.reconstruction_package.wightman_fields_present
  vacuum_vector_present : R.reconstruction_package.vacuum_vector_present
  smearing_defined : R.reconstruction_package.smearing_defined
  vacuum_correlations_defined : R.reconstruction_package.vacuum_correlations_defined

/--
Explicit theorem-facing payload for the endpoint-side universality cluster
(`O.2` / `O.3` / `O.5` in the current manuscript-facing kernel).
-/
structure YMEndpointUniversalityTheoremObject (R : YMEndpointCore) where
  theorem_content : YMEndpointTheoremContent R
  faithful_wilson_universality_hypotheses :
    ym_faithful_wilson_universality_hypotheses_statement R
  qualitative_faithful_wilson_universality :
    ym_qualitative_faithful_wilson_universality_of_continuum_local_theory_statement R
  exact_endpoint_exclusion_statement :
    ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement R

/--
Chosen-site bridge object for the endpoint heart. This packages one selected
smear/correlate site together with the exact-endpoint consequence it supports.
-/
structure YMEndpointChosenSiteBridgeObject (R : YMEndpointCore) where
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
  exact_endpoint_from_chosen_correlations :
    R.reconstruction_package.vacuum_correlations_defined ->
    R.endpoint_object.exact_local_net_endpoint
  exact_endpoint_witness : R.endpoint_object.exact_local_net_endpoint

/--
Bundled native theorem-facing endpoint payloads collecting the current
reconstruction, universality, and chosen-site exactness layers.
-/
structure YMEndpointNativeTheoremObjects (R : YMEndpointCore) where
  reconstruction_object : YMEndpointReconstructionTheoremObject R
  universality_object : YMEndpointUniversalityTheoremObject R
  chosen_site_object : YMEndpointChosenSiteBridgeObject R

def YangMillsEndpointReconstructionTheoremObjectData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready) :
  YMEndpointReconstructionTheoremObject R := by
  let B := YangMillsEndpointSemanticBundleData R hE hP
  exact
    { bundle := B
      reconstruction_ready := B.reconstruction_ready
      wightman_fields_present := B.wightman_fields_present
      vacuum_vector_present := B.vacuum_vector_present
      smearing_defined := B.smearing_defined
      vacuum_correlations_defined := B.vacuum_correlations_defined }

def YangMillsEndpointUniversalityTheoremObjectData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready) :
  YMEndpointUniversalityTheoremObject R := by
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

def YangMillsEndpointChosenSiteBridgeObjectData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  YMEndpointChosenSiteBridgeObject R := by
  let P := YangMillsEndpointCorrelationLawPackageData R hE hP vac testFn field
  exact
    { law_package := P
      smearing_relation := P.interface.smearing_relation
      vacuum_correlation_relation := P.interface.vacuum_correlation_relation
      exact_endpoint_from_chosen_correlations := P.exact_endpoint_from_correlations
      exact_endpoint_witness := P.exact_endpoint_witness }

def YangMillsEndpointNativeTheoremObjectsData
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  YMEndpointNativeTheoremObjects R := by
  exact
    { reconstruction_object :=
        YangMillsEndpointReconstructionTheoremObjectData R hE hP
      universality_object :=
        YangMillsEndpointUniversalityTheoremObjectData R hE hP
      chosen_site_object :=
        YangMillsEndpointChosenSiteBridgeObjectData R hE hP vac testFn field }

theorem YangMillsEndpointNativeTheoremObjectsExportStatement
  (R : YMEndpointCore)
  (hE : R.euclidean_dossier_ready)
  (hP : R.endpoint_packet_ready)
  (vac : (YangMillsEndpointSemanticBundleData R hE hP).vacuum_vector)
  (testFn : (YangMillsEndpointSemanticBundleData R hE hP).test_function_space)
  (field : (YangMillsEndpointSemanticBundleData R hE hP).field_family) :
  Nonempty (YMEndpointNativeTheoremObjects R) /\
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
  ym_exact_local_net_endpoint_and_exclusion_of_extended_support_sector_data_statement R := by
  let A := YangMillsEndpointNativeTheoremObjectsData R hE hP vac testFn field
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
                        And.intro A.reconstruction_object.reconstruction_ready <|
                          And.intro A.reconstruction_object.wightman_fields_present <|
                            And.intro A.reconstruction_object.vacuum_vector_present <|
                              And.intro A.reconstruction_object.smearing_defined <|
                                And.intro
                                  A.reconstruction_object.vacuum_correlations_defined <|
                                  And.intro
                                    A.chosen_site_object.exact_endpoint_witness <|
                                    And.intro
                                      A.universality_object.faithful_wilson_universality_hypotheses <|
                                      And.intro
                                        A.universality_object.qualitative_faithful_wilson_universality <|
                                        A.universality_object.exact_endpoint_exclusion_statement

end MaleyLean
