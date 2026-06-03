import MaleyLean.Papers.YangMills.Surface.ConstructiveRelationalSummary

namespace MaleyLean

theorem YangMillsConstructiveRelationalSummaryExportStatement :
  forall R : YMConstructiveRoute,
    forall htrunc : R.finite_truncation_ready,
      forall hext : R.finite_cap_extension_ready,
        forall hcompat : R.bounded_state_compatibility_ready,
          forall hunion : R.inductive_union_ready,
            forall _win : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).finite_cap_window,
              forall _bridge : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).positive_bridge_map,
                forall _base : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_base_carrier,
                  forall _state : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_state_data,
                    forall _unionData :
                      (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).inductive_union_data,
                      Nonempty (YMConstructiveRelationalInterface R) /\
                      R.finite_cap_package.finite_cap_extension_ready /\
                      R.finite_cap_package.positive_bridge_ready /\
                      R.sharp_local_package.sharp_local_state.extends_bounded_base := by
  intro R htrunc hext hcompat hunion _win _bridge _base _state _unionData
  exact
    YangMillsConstructiveRelationalSummaryStatement
      R htrunc hext hcompat hunion _win _bridge _base _state _unionData

end MaleyLean
