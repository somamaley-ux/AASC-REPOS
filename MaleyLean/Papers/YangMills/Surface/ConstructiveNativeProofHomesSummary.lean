import MaleyLean.Papers.YangMills.Kernel.ConstructiveNativeProofHomes

namespace MaleyLean

/-- Surface-level summary exposing the constructive native proof-home package. -/
theorem YangMillsConstructiveNativeProofHomesSummaryStatement :
  forall R : YMConstructiveRoute,
    forall htrunc : R.finite_truncation_ready,
      forall hext : R.finite_cap_extension_ready,
        forall hcompat : R.bounded_state_compatibility_ready,
          forall hunion : R.inductive_union_ready,
            forall win :
              (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).finite_cap_window,
              forall bridge :
                (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).positive_bridge_map,
                forall base :
                  (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_base_carrier,
                  forall state :
                    (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_state_data,
                    forall unionData :
                      (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).inductive_union_data,
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
  exact YangMillsConstructiveNativeProofHomesExportStatement

end MaleyLean
