import MaleyLean.Papers.YangMills.Kernel.ConstructiveTheoremObjects

namespace MaleyLean

/--
Surface-level summary exposing the native Lane A theorem-object package.
-/
theorem YangMillsConstructiveNativeTheoremObjectsSummaryStatement :
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
  exact YangMillsConstructiveNativeTheoremObjectsExportStatement

end MaleyLean
