import MaleyLean.Papers.YangMills.Kernel.ConstructiveChosenSiteExecutionTrace

namespace MaleyLean

/-- Primitive sharp-local construction stage for the constructive heart. -/
structure YMConstructiveSharpLocalConstructionStage (R : YMConstructiveRoute) where
  trace : YMConstructiveChosenSiteExecutionTrace R
  chosen_bounded_base := trace.chosen_bounded_base
  chosen_bounded_state := trace.chosen_bounded_state
  chosen_inductive_union := trace.chosen_inductive_union
  constructed_sharp_local_state := trace.chosen_sharp_local_state
  sharp_local_construction :
    trace.certificates.law_atoms.interface.bundle.assemble_sharp_local_state
      chosen_bounded_base
      chosen_bounded_state
      chosen_inductive_union =
    constructed_sharp_local_state

def YangMillsConstructiveSharpLocalConstructionStageData
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready)
  (win : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).finite_cap_window)
  (bridge : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).positive_bridge_map)
  (base : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_base_carrier)
  (state : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_state_data)
  (unionData :
    (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).inductive_union_data) :
  YMConstructiveSharpLocalConstructionStage R := by
  let T :=
    YangMillsConstructiveChosenSiteExecutionTraceData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact
    { trace := T
      sharp_local_construction := T.certificates.sharp_local_application }

theorem YangMillsConstructiveSharpLocalConstructionStageExportStatement
  (R : YMConstructiveRoute)
  (htrunc : R.finite_truncation_ready)
  (hext : R.finite_cap_extension_ready)
  (hcompat : R.bounded_state_compatibility_ready)
  (hunion : R.inductive_union_ready)
  (win : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).finite_cap_window)
  (bridge : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).positive_bridge_map)
  (base : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_base_carrier)
  (state : (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).bounded_state_data)
  (unionData :
    (YangMillsConstructiveSemanticBundleData R htrunc hext hcompat hunion).inductive_union_data) :
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
  let T :=
    YangMillsConstructiveSharpLocalConstructionStageData
      R htrunc hext hcompat hunion win bridge base state unionData
  exact And.intro (Nonempty.intro T) T.sharp_local_construction

end MaleyLean
