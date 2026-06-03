import MaleyLean.Papers.YangMills.Kernel.NamedLaneATheoremContent
import MaleyLean.Papers.YangMills.Kernel.ConstructiveExtendAssembleLawPackage
import MaleyLean.Papers.YangMills.SourceCrosswalk.Register
import MaleyLean.Papers.YangMills.SourceCrosswalk.ConstructiveWitnessRegister

namespace MaleyLean

/--
Explicit theorem-facing payload for the finite-cap side of the Lane A heart.
-/
structure YMConstructiveFiniteCapTheoremObject (R : YMConstructiveRoute) where
  bundle : YMConstructiveSemanticBundle R
  truncation_window_ready : R.finite_cap_package.truncation_window_ready
  finite_cap_extension_ready : R.finite_cap_package.finite_cap_extension_ready
  positive_bridge_ready : R.finite_cap_package.positive_bridge_ready

/--
Explicit theorem-facing payload for the sharp-local side of the Lane A heart.
-/
structure YMConstructiveSharpLocalTheoremObject (R : YMConstructiveRoute) where
  bundle : YMConstructiveSemanticBundle R
  bounded_state_compatibility_ready :
    R.sharp_local_package.bounded_state_compatibility_ready
  inductive_union_ready : R.sharp_local_package.inductive_union_ready
  bounded_base_extension :
    R.sharp_local_package.sharp_local_state.extends_bounded_base

/--
Chosen-site bridge object for the constructive heart. This packages one
selected finite-cap/sharp-local site together with the assembled bounded-base
consequence it supports.
-/
structure YMConstructiveChosenSiteBridgeObject (R : YMConstructiveRoute) where
  law_package : YMConstructiveExtendAssembleLawPackage R
  chosen_site_relation :
    law_package.extend_then_assemble
      law_package.interface.chosen_window
      law_package.interface.chosen_bridge_map
      law_package.interface.chosen_bounded_base
      law_package.interface.chosen_bounded_state
      law_package.interface.chosen_inductive_union =
    law_package.interface.chosen_sharp_local_state
  bounded_base_from_chosen_site :
    law_package.bounded_base_from_assembly law_package.interface.chosen_sharp_local_state =
    law_package.bounded_base_witness
  bounded_base_witness :
    R.sharp_local_package.sharp_local_state.extends_bounded_base

/--
Bundled native theorem-facing payloads for the current Lane A constructive
heart.
-/
structure YMConstructiveNativeTheoremObjects (R : YMConstructiveRoute) where
  theorem_content : YMLaneATheoremContent R
  finite_cap_object : YMConstructiveFiniteCapTheoremObject R
  sharp_local_object : YMConstructiveSharpLocalTheoremObject R
  chosen_site_object : YMConstructiveChosenSiteBridgeObject R

def YangMillsConstructiveFiniteCapTheoremObjectData
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready) :
  YMConstructiveFiniteCapTheoremObject R := by
  let B := YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion
  exact
    { bundle := B
      truncation_window_ready := B.truncation_window_ready
      finite_cap_extension_ready := B.finite_cap_extension_ready
      positive_bridge_ready := B.positive_bridge_ready }

def YangMillsConstructiveSharpLocalTheoremObjectData
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready) :
  YMConstructiveSharpLocalTheoremObject R := by
  let B := YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion
  exact
    { bundle := B
      bounded_state_compatibility_ready := B.bounded_state_compatibility_ready
      inductive_union_ready := B.inductive_union_ready
      bounded_base_extension := B.bounded_base_extension }

def YangMillsConstructiveChosenSiteBridgeObjectData
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready)
  (win : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).finite_cap_window)
  (bridge : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).positive_bridge_map)
  (base : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_base_carrier)
  (state : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_state_data)
  (unionData :
    (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).inductive_union_data) :
  YMConstructiveChosenSiteBridgeObject R := by
  let P :=
    YangMillsConstructiveExtendAssembleLawPackageData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact
    { law_package := P
      chosen_site_relation := P.chosen_site_law
      bounded_base_from_chosen_site := by
        exact
          YangMillsConstructiveChosenSharpLocalFeedsBoundedBaseStatement
            R htrunc hext hcompat hunion win bridge base state unionData
      bounded_base_witness := P.bounded_base_witness }

def YangMillsConstructiveNativeTheoremObjectsData
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready)
  (win : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).finite_cap_window)
  (bridge : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).positive_bridge_map)
  (base : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_base_carrier)
  (state : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_state_data)
  (unionData :
    (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).inductive_union_data) :
  YMConstructiveNativeTheoremObjects R := by
  have hpartC : ym_paper_partC_statement R :=
    YangMillsLaneAExplicitStatementFromReadinessStatement
      R htrunc hext hcompat hunion
  exact
    { theorem_content := YangMillsLaneATheoremContentData R hpartC
      finite_cap_object :=
        YangMillsConstructiveFiniteCapTheoremObjectData
          R htrunc hext hcompat hunion
      sharp_local_object :=
        YangMillsConstructiveSharpLocalTheoremObjectData
          R htrunc hext hcompat hunion
      chosen_site_object :=
        YangMillsConstructiveChosenSiteBridgeObjectData
          R htrunc hext hcompat hunion win bridge base state unionData }

theorem YangMillsConstructiveNativeTheoremObjectsExportStatement
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready)
  (win : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).finite_cap_window)
  (bridge : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).positive_bridge_map)
  (base : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_base_carrier)
  (state : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_state_data)
  (unionData :
    (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).inductive_union_data) :
  Nonempty (YMConstructiveNativeTheoremObjects R) /\
  ym_source_labels .uniqueFlowedContinuumState = ["4.92", "4.93"] /\
  ym_source_labels .tunedBoundedPositiveTimeBaseState = ["4.94"] /\
  ym_source_labels .exactDimensionQuotientIdentity = ["L.8"] /\
  ym_source_labels .coefficientExtractionOnArbitraryQuotientBlocks = ["L.11"] /\
  ym_source_labels .oneShellTransportOnFiniteTruncations = ["5.39"] /\
  ym_source_labels .finiteTruncationInverseControl = ["5.69"] /\
  ym_source_labels .finiteTruncationSFTERemainderPackage = ["F.245"] /\
  ym_source_labels .finiteMixedBoundedFamilyPackaging = ["F.330A"] /\
  ym_source_labels .firstMixedCorrelatorClosureAtFiniteCap = ["F.331"] /\
  ym_source_labels .finiteCapSharpLocalExtension = ["5.74A", "5.74", "5.75"] /\
  ym_source_labels .passageToFullSharpLocalInductiveUnion = ["5.76"] /\
  ym_source_labels
      .boundedBaseCyclicityInReconstructedSharpLocalHilbertSpace = ["5.77"] /\
  ym_constructive_witness_source_labels .finiteCapWindowWitness = ["5.74"] /\
  ym_constructive_witness_source_labels .finiteCapExtensionWitness = ["5.74A"] /\
  ym_constructive_witness_source_labels .finiteCapPositiveBridgeWitness = ["5.74A"] /\
  ym_constructive_witness_source_labels .boundedStateCompatibilityWitness = ["5.75"] /\
  ym_constructive_witness_source_labels .inductiveUnionWitness = ["5.76"] /\
  ym_constructive_witness_source_labels .boundedBaseExtensionWitness = ["5.76"] /\
  ym_paper_partC_statement R /\
  R.finite_cap_package.truncation_window_ready /\
  R.finite_cap_package.finite_cap_extension_ready /\
  R.finite_cap_package.positive_bridge_ready /\
  R.sharp_local_package.bounded_state_compatibility_ready /\
  R.sharp_local_package.inductive_union_ready /\
  R.sharp_local_package.sharp_local_state.extends_bounded_base /\
  ((YangMillsConstructiveExtendAssembleLawPackageData
      R htrunc hext hcompat hunion win bridge base state unionData).extend_then_assemble
      win bridge base state unionData =
    (YangMillsConstructiveExtendAssembleLawPackageData
      R htrunc hext hcompat hunion win bridge base state unionData).interface.chosen_sharp_local_state) := by
  let A :=
    YangMillsConstructiveNativeTheoremObjectsData
      R htrunc hext hcompat hunion win bridge base state unionData
  have hpartC : ym_paper_partC_statement R :=
    YangMillsLaneAExplicitStatementFromReadinessStatement
      R htrunc hext hcompat hunion
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
                        And.intro rfl <|
                          And.intro rfl <|
                            And.intro rfl <|
                              And.intro rfl <|
                                And.intro rfl <|
                                  And.intro rfl <|
                                    And.intro rfl <|
                                      And.intro rfl <|
                                        And.intro rfl <|
                                          And.intro hpartC <|
                                            And.intro A.finite_cap_object.truncation_window_ready <|
                                              And.intro A.finite_cap_object.finite_cap_extension_ready <|
                                                And.intro A.finite_cap_object.positive_bridge_ready <|
                                                  And.intro
                                                    A.sharp_local_object.bounded_state_compatibility_ready <|
                                                    And.intro
                                                      A.sharp_local_object.inductive_union_ready <|
                                                      And.intro
                                                        A.sharp_local_object.bounded_base_extension
                                                        A.chosen_site_object.chosen_site_relation

end MaleyLean
