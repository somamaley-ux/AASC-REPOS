import MaleyLean.Papers.YangMills.Kernel.ConstructiveOperatorPrimitives

namespace MaleyLean

theorem YangMillsConstructiveOperatorPrimitivesSummaryStatement :
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
                      Nonempty (YMConstructiveOperatorPrimitives R) /\
                      (YangMillsConstructiveOperatorPrimitivesData R htrunc hext hcompat hunion).extend_operator win bridge =
                        (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).extend_finite_cap win bridge /\
                      (YangMillsConstructiveOperatorPrimitivesData R htrunc hext hcompat hunion).assemble_operator base state unionData =
                        (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).assemble_sharp_local_state base state unionData := by
  exact YangMillsConstructiveOperatorPrimitivesExportStatement

end MaleyLean
