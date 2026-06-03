import MaleyLean.Papers.YangMills.Kernel.ConstructiveSharpLocalConstructionStage

namespace MaleyLean

theorem YangMillsConstructiveSharpLocalConstructionStageSummaryStatement :
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
                      Nonempty (YMConstructiveSharpLocalConstructionStage R) /\
                      ((YangMillsConstructiveSharpLocalConstructionStageData
                          R htrunc hext hcompat hunion win bridge base state unionData).trace.certificates.law_atoms.interface.bundle.assemble_sharp_local_state
                          (YangMillsConstructiveSharpLocalConstructionStageData
                            R htrunc hext hcompat hunion win bridge base state unionData).chosen_bounded_base
                          (YangMillsConstructiveSharpLocalConstructionStageData
                            R htrunc hext hcompat hunion win bridge base state unionData).chosen_bounded_state
                          (YangMillsConstructiveSharpLocalConstructionStageData
                            R htrunc hext hcompat hunion win bridge base state unionData).chosen_inductive_union =
                        (YangMillsConstructiveSharpLocalConstructionStageData
                          R htrunc hext hcompat hunion win bridge base state unionData).constructed_sharp_local_state) := by
  exact YangMillsConstructiveSharpLocalConstructionStageExportStatement

end MaleyLean
