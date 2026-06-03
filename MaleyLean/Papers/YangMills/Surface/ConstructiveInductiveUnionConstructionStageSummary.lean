import MaleyLean.Papers.YangMills.Kernel.ConstructiveInductiveUnionConstructionStage

namespace MaleyLean

theorem YangMillsConstructiveInductiveUnionConstructionStageSummaryStatement :
  forall R : YMConstructiveRoute,
    forall htrunc : R.finite_truncation_ready,
      forall hext : R.finite_cap_extension_ready,
        forall hcompat : R.bounded_state_compatibility_ready,
          forall hunion : R.inductive_union_ready,
            forall win : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).finite_cap_window,
              forall bridge : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).positive_bridge_map,
                forall base : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_base_carrier,
                  forall state : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_state_data,
                    forall unionData : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).inductive_union_data,
                      Nonempty (YMConstructiveInductiveUnionConstructionStage R) /\
                      R.sharp_local_package.inductive_union_ready /\
                      R.sharp_local_package.sharp_local_state.extends_bounded_base := by
  exact YangMillsConstructiveInductiveUnionConstructionStageExportStatement

end MaleyLean
