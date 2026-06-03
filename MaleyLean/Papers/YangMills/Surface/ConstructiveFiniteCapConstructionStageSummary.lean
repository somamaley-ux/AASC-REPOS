import MaleyLean.Papers.YangMills.Kernel.ConstructiveFiniteCapConstructionStage

namespace MaleyLean

theorem YangMillsConstructiveFiniteCapConstructionStageSummaryStatement :
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
                      Nonempty (YMConstructiveFiniteCapConstructionStage R) /\
                      ((YangMillsConstructiveFiniteCapConstructionStageData
                          R htrunc hext hcompat hunion win bridge base state unionData).trace.certificates.law_atoms.interface.bundle.extend_finite_cap
                          (YangMillsConstructiveFiniteCapConstructionStageData
                            R htrunc hext hcompat hunion win bridge base state unionData).chosen_window
                          (YangMillsConstructiveFiniteCapConstructionStageData
                            R htrunc hext hcompat hunion win bridge base state unionData).chosen_bridge_map =
                        (YangMillsConstructiveFiniteCapConstructionStageData
                          R htrunc hext hcompat hunion win bridge base state unionData).constructed_extension_data) := by
  exact YangMillsConstructiveFiniteCapConstructionStageExportStatement

end MaleyLean
