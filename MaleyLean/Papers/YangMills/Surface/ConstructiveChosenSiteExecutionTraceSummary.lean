import MaleyLean.Papers.YangMills.Kernel.ConstructiveChosenSiteExecutionTrace

namespace MaleyLean

theorem YangMillsConstructiveChosenSiteExecutionTraceSummaryStatement :
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
                      Nonempty (YMConstructiveChosenSiteExecutionTrace R) /\
                      ((YangMillsConstructiveChosenSiteExecutionTraceData
                          R htrunc hext hcompat hunion win bridge base state unionData).certificates.law_atoms.interface.bundle.extend_finite_cap
                          (YangMillsConstructiveChosenSiteExecutionTraceData
                            R htrunc hext hcompat hunion win bridge base state unionData).chosen_window
                          (YangMillsConstructiveChosenSiteExecutionTraceData
                            R htrunc hext hcompat hunion win bridge base state unionData).chosen_bridge_map =
                        (YangMillsConstructiveChosenSiteExecutionTraceData
                          R htrunc hext hcompat hunion win bridge base state unionData).chosen_extension_data) /\
                      ((YangMillsConstructiveChosenSiteExecutionTraceData
                          R htrunc hext hcompat hunion win bridge base state unionData).certificates.law_atoms.interface.bundle.assemble_sharp_local_state
                          (YangMillsConstructiveChosenSiteExecutionTraceData
                            R htrunc hext hcompat hunion win bridge base state unionData).chosen_bounded_base
                          (YangMillsConstructiveChosenSiteExecutionTraceData
                            R htrunc hext hcompat hunion win bridge base state unionData).chosen_bounded_state
                          (YangMillsConstructiveChosenSiteExecutionTraceData
                            R htrunc hext hcompat hunion win bridge base state unionData).chosen_inductive_union =
                        (YangMillsConstructiveChosenSiteExecutionTraceData
                          R htrunc hext hcompat hunion win bridge base state unionData).chosen_sharp_local_state) := by
  exact YangMillsConstructiveChosenSiteExecutionTraceExportStatement

end MaleyLean
