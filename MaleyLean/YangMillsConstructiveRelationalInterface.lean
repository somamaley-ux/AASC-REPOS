import MaleyLean.Papers.YangMills.Kernel.ConstructiveRelationalInterface

namespace MaleyLean

theorem YangMillsConstructiveRelationalInterfaceExportStatement :
  forall R : YMConstructiveRoute,
    forall htrunc : R.finite_truncation_ready,
      forall hext : R.finite_cap_extension_ready,
        forall hcompat : R.bounded_state_compatibility_ready,
          forall hunion : R.inductive_union_ready,
            forall win : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).finite_cap_window,
              forall bridge : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).positive_bridge_map,
                forall base : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_base_carrier,
                  forall state : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_state_data,
                    forall unionData :
                      (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).inductive_union_data,
                      Nonempty (YMConstructiveRelationalInterface R) /\
                      R.finite_cap_package.finite_cap_extension_ready /\
                      R.finite_cap_package.positive_bridge_ready /\
                      R.sharp_local_package.sharp_local_state.extends_bounded_base := by
  intro R htrunc hext hcompat hunion win bridge base state unionData
  exact
    YangMillsConstructiveRelationalCompatibilityStatement
      R htrunc hext hcompat hunion win bridge base state unionData

end MaleyLean
