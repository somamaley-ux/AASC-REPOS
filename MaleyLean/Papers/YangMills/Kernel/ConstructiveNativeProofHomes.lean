import MaleyLean.Papers.YangMills.Kernel.ConstructiveTheoremObjects

namespace MaleyLean

/-- Explicit proof-home package for the finite-cap side of the constructive heart. -/
structure YMConstructiveFiniteCapProofHome (R : YMConstructiveRoute) where
  bundle : YMConstructiveSemanticBundle R
  truncation_window_certificate : R.finite_cap_package.truncation_window_ready
  finite_cap_extension_certificate : R.finite_cap_package.finite_cap_extension_ready
  positive_bridge_certificate : R.finite_cap_package.positive_bridge_ready

/-- Explicit proof-home package for the sharp-local side of the constructive heart. -/
structure YMConstructiveSharpLocalProofHome (R : YMConstructiveRoute) where
  bundle : YMConstructiveSemanticBundle R
  bounded_state_compatibility_certificate :
    R.sharp_local_package.bounded_state_compatibility_ready
  inductive_union_certificate : R.sharp_local_package.inductive_union_ready
  bounded_base_extension_certificate :
    R.sharp_local_package.sharp_local_state.extends_bounded_base

/--
Explicit proof-home package for one chosen constructive assembly site.
-/
structure YMConstructiveChosenSiteProofHome (R : YMConstructiveRoute) where
  law_package : YMConstructiveExtendAssembleLawPackage R
  extension_relation :
    law_package.interface.bundle.extend_finite_cap
      law_package.interface.chosen_window
      law_package.interface.chosen_bridge_map =
    law_package.interface.chosen_extension_data
  sharp_local_relation :
    law_package.interface.bundle.assemble_sharp_local_state
      law_package.interface.chosen_bounded_base
      law_package.interface.chosen_bounded_state
      law_package.interface.chosen_inductive_union =
    law_package.interface.chosen_sharp_local_state
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

/-- Combined native proof-home package for the current constructive heart. -/
structure YMConstructiveNativeProofHomes (R : YMConstructiveRoute) where
  theorem_content : YMLaneATheoremContent R
  finite_cap_home : YMConstructiveFiniteCapProofHome R
  sharp_local_home : YMConstructiveSharpLocalProofHome R
  chosen_site_home : YMConstructiveChosenSiteProofHome R

def YangMillsConstructiveFiniteCapProofHomeData
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready) :
  YMConstructiveFiniteCapProofHome R := by
  let B := YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion
  exact
    { bundle := B
      truncation_window_certificate := B.truncation_window_ready
      finite_cap_extension_certificate := B.finite_cap_extension_ready
      positive_bridge_certificate := B.positive_bridge_ready }

def YangMillsConstructiveSharpLocalProofHomeData
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready) :
  YMConstructiveSharpLocalProofHome R := by
  let B := YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion
  exact
    { bundle := B
      bounded_state_compatibility_certificate := B.bounded_state_compatibility_ready
      inductive_union_certificate := B.inductive_union_ready
      bounded_base_extension_certificate := B.bounded_base_extension }

def YangMillsConstructiveChosenSiteProofHomeData
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
  YMConstructiveChosenSiteProofHome R := by
  let P :=
    YangMillsConstructiveExtendAssembleLawPackageData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact
    { law_package := P
      extension_relation := P.interface.extension_relation
      sharp_local_relation := P.interface.sharp_local_relation
      chosen_site_relation := P.chosen_site_law
      bounded_base_from_chosen_site := by
        exact
          YangMillsConstructiveChosenSharpLocalFeedsBoundedBaseStatement
            R htrunc hext hcompat hunion win bridge base state unionData
      bounded_base_witness := P.bounded_base_witness }

def YangMillsConstructiveNativeProofHomesData
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
  YMConstructiveNativeProofHomes R := by
  have hpartC : ym_paper_partC_statement R :=
    YangMillsLaneAExplicitStatementFromReadinessStatement
      R htrunc hext hcompat hunion
  exact
    { theorem_content := YangMillsLaneATheoremContentData R hpartC
      finite_cap_home :=
        YangMillsConstructiveFiniteCapProofHomeData
          R htrunc hext hcompat hunion
      sharp_local_home :=
        YangMillsConstructiveSharpLocalProofHomeData
          R htrunc hext hcompat hunion
      chosen_site_home :=
        YangMillsConstructiveChosenSiteProofHomeData
          R htrunc hext hcompat hunion win bridge base state unionData }

theorem YangMillsConstructiveNativeProofHomesExportStatement
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
  Nonempty (YMConstructiveNativeProofHomes R) /\
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
      R htrunc hext hcompat hunion win bridge base state unionData).interface.bundle.extend_finite_cap
      (YangMillsConstructiveExtendAssembleLawPackageData
        R htrunc hext hcompat hunion win bridge base state unionData).interface.chosen_window
      (YangMillsConstructiveExtendAssembleLawPackageData
        R htrunc hext hcompat hunion win bridge base state unionData).interface.chosen_bridge_map =
    (YangMillsConstructiveExtendAssembleLawPackageData
      R htrunc hext hcompat hunion win bridge base state unionData).interface.chosen_extension_data) /\
  ((YangMillsConstructiveExtendAssembleLawPackageData
      R htrunc hext hcompat hunion win bridge base state unionData).extend_then_assemble
      win bridge base state unionData =
    (YangMillsConstructiveExtendAssembleLawPackageData
      R htrunc hext hcompat hunion win bridge base state unionData).interface.chosen_sharp_local_state) := by
  let A :=
    YangMillsConstructiveNativeProofHomesData
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
                        And.intro hpartC <|
                          And.intro A.finite_cap_home.truncation_window_certificate <|
                            And.intro A.finite_cap_home.finite_cap_extension_certificate <|
                              And.intro A.finite_cap_home.positive_bridge_certificate <|
                                And.intro
                                  A.sharp_local_home.bounded_state_compatibility_certificate <|
                                  And.intro
                                    A.sharp_local_home.inductive_union_certificate <|
                                    And.intro
                                      A.sharp_local_home.bounded_base_extension_certificate <|
                                      And.intro
                                        A.chosen_site_home.extension_relation
                                        A.chosen_site_home.chosen_site_relation

end MaleyLean
