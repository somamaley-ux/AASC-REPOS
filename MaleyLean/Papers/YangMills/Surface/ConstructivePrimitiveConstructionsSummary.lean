import MaleyLean.Papers.YangMills.Kernel.ConstructivePrimitiveConstructions

namespace MaleyLean

theorem YangMillsConstructivePrimitiveConstructionsSummaryStatement :
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
                      Nonempty (YMConstructivePrimitiveConstructions R) /\
                      Nonempty (YMConstructiveFiniteCapConstructionStage R) /\
                      Nonempty (YMConstructiveBoundedStateConstructionStage R) /\
                      Nonempty (YMConstructiveInductiveUnionConstructionStage R) /\
                      Nonempty (YMConstructiveSharpLocalConstructionStage R) := by
  exact YangMillsConstructivePrimitiveConstructionsExportStatement

end MaleyLean
